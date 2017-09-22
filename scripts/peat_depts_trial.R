#Peat Depths: trial script
#July 2017

#packages ----
library(raster)
library(rgdal)
library(randomForest)

#helper functions----

#plot output of regression model using ggplot
ggplotRegression <- function (fit) {
  
  require(ggplot2)
  
  ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(title = paste("Adj R2 = ",signif(summary(fit)$adj.r.squared, 5),
                       "Intercept =",signif(fit$coef[[1]],5 ),
                       " Slope =",signif(fit$coef[[2]], 5),
                       " P =",signif(summary(fit)$coef[2,4], 5)))
}


#import data ----
list.files(path = "data/")

# main file geodatabase
fgdb <- "data/PeatDepth.gdb"
  # List all feature classes in a file geodatabase
  subset(ogrDrivers(), grepl("GDB", name))
  fc_list <- ogrListLayers(fgdb)
  print(fc_list)

# Read the feature class
  peat.depth <- readOGR("data/SsLevels_peat_dp_surv.shp",  "SsLevels_peat_dp_surv")
  #fc.peat.surv <- readOGR(dsn=fgdb,layer="SsLevels_peat_dp_surv",drop_unsupported_fields = T)
# Determine the FC extent, projection, and attribute information
  #summary(peat.depth)
  #plot(peat.depth, pch = 21, cex = 0.25)

#read elevation data
elev <- raster("data/EA_IHM_2014_DTM_Resampled_20m_SsLevels.tif")
  #summary(elev)
  plot(elev)

#read average annual precip data
#aap <- raster("data/Average_Annual_Rainfall.tif") #thsi is for the whole country, need to clip it
 # summary(aap)
  #plot(aap)

  
  #read rainfall raster
aap <- raster("data/Average_Annual_Rainfall_SsLevels.tif")  
  plot(aap)
  #resample to DTM raster resolution
aap <- resample(elev, aap)
  summary(aap)
  plot(aap)


  
#calculate derrived data ----

slope <- terrain(x = elev, opt = "slope", unit = "radians",
                 neighbors = 8,
                 filename = "data/slope_20m_SsLevels.tif", 
                 overwrite = T)
  summary(slope)
  plot(slope)

aspect <- terrain(x = elev, opt = "aspect", unit = "degrees",
                  neighbors = 8,
                  filename = "data/aspect_20m_SsLevels.tif", 
                  overwrite = T)
  summary(aspect)
  plot(aspect)

#create training data ----
training.data <- as.data.frame(peat.depth$PEAT_DEPTH)
names(training.data) <- "PEAT_DEPTH"
training.data$elev <- extract(elev, coordinates(peat.depth)[,1:2])
training.data$aspect <- extract(aspect, coordinates(peat.depth)[,1:2])
training.data$slope <- extract(slope, coordinates(peat.depth)[,1:2])
training.data$aap <- extract(aap, coordinates(peat.depth)[,1:2])

names(training.data)

#run model ----
  #linear model
M.lm <- lm(PEAT_DEPTH ~ elev + aspect + slope + aap, data=training.data)
  summary(M.lm)
  M.lm
  ggplotRegression(M.lm)
  par(mfrow = c(2,2))
  plot(M.lm)
  par(mfrow = c(1,1))

  
  #random forest
M.rf <- randomForest(PEAT_DEPTH ~ elev + aspect + slope + aap, data=training.data)  
  summary(M.rf)
  M.rf
  plot(M.rf)
  
#create predictors stack ----

#height <- resample(aspect, height)

predictors <- stack(elev, aspect, slope)
names(predictors) <- c("elev", "aspect", "slope")

#generate output layer ----
output <- predict(predictors, M.rf, type="response", progress="text")

#graph output ----
plot(output)

#export output ----
writeRaster(output, "data/predicted_peat_depth_rf.tif")
