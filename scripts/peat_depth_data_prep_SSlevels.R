#Peat Depths: model selection script
#Aug 2017

#packages ----
library(raster)
library(rgdal)


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
#  plot(elev)

#read average annual precip data
#aap <- raster("data/Average_Annual_Rainfall.tif") #thsi is for the whole country, need to clip it
 # summary(aap)
  #plot(aap)

  
  #read rainfall raster
aap <- raster("data/Average_Annual_Rainfall_SsLevels.tif")  
#  plot(aap)
  #resample to DTM raster resolution
aap <- resample(elev, aap)
  summary(aap)
#  plot(aap)


  
#calculate derrived data ----

slope <- terrain(x = elev, opt = "slope", unit = "radians",
                 neighbors = 8,
                 filename = "data/slope_20m_SsLevels.tif", 
                 overwrite = T)
  summary(slope)
#  plot(slope)

aspect <- terrain(x = elev, opt = "aspect", unit = "degrees",
                  neighbors = 8,
                  filename = "data/aspect_20m_SsLevels.tif", 
                  overwrite = T)
  summary(aspect)
#  plot(aspect)

#create input data ----
input.data <- as.data.frame(peat.depth$PEAT_DEPTH)
names(input.data) <- "PEAT_DEPTH"
input.data$elev <- extract(elev, coordinates(peat.depth)[,1:2])
input.data$aspect <- extract(aspect, coordinates(peat.depth)[,1:2])
input.data$slope <- extract(slope, coordinates(peat.depth)[,1:2])
input.data$aap <- extract(aap, coordinates(peat.depth)[,1:2])

names(input.data)

#export to file
saveRDS(input.data, file="data/input.data.rds")
write.csv(input.data, file = "input_data.csv", row.names = F)
 