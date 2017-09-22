#Peat Depths: model selection script
#Aug 2017

#packages ----
library(raster)
library(rgdal)


#import data ----
list.files(path = "data/peat_depth_data/")

# main file geodatabase - currently peat depth data is not in there
fgdb <- "data/PeatDepth.gdb"
  # List all feature classes in a file geodatabase
  subset(ogrDrivers(), grepl("GDB", name))
  fc_list <- ogrListLayers(fgdb)
  print(fc_list)

# peat depth file
pdshp <- "data/peat_depth_data/Combined_Peat_Depth_Survey_Data_NOV2012_ALLDATA.shp"
ogrInfo(pdshp)
  
# save teh shapefile into an object
peat.depth <- readOGR(dsn = pdshp, verbose = TRUE)
# Determine the FC extent, projection, and attribute information
summary(peat.depth)
  #plot(peat.depth, pch = 21, cex = 0.25)

#read elevation data
elev <- raster("data/Ground Elevation © CEH1.tif")
  #summary(elev)
#  plot(elev)

#read average annual precip data
aap <- raster("data/Average_Annual_Rainfall.tif") 
 # summary(aap)
#  plot(aap)

#resample to DTM raster resolution
aap <- resample(elev, aap)
  #summary(aap)
  #plot(aap)


  
####calculate derrived data ----

##for the time beign we don't need to do this because its already in teh
##peat.depth dataset.  however, for running full model we'll have to do it.
# 
# slope <- terrain(x = elev, opt = "slope", unit = "radians",
#                  neighbors = 8,
#                  filename = "data/slope_20m.tif", 
#                  overwrite = T)
#   # summary(slope)
#   #  plot(slope)
# 
# aspect <- terrain(x = elev, opt = "aspect", unit = "degrees",
#                   neighbors = 8,
#                   filename = "data/aspect_20m.tif", 
#                   overwrite = T)
#   #  summary(aspect)
#   #  plot(aspect)
# 



# #create input data from derrived data----
# input.data <- as.data.frame(peat.depth$PEAT_DEPTH)
# names(input.data) <- "PEAT_DEPTH"
# input.data$elev <- extract(elev, coordinates(peat.depth)[,1:2])
# input.data$aspect <- extract(aspect, coordinates(peat.depth)[,1:2])
# input.data$slope <- extract(slope, coordinates(peat.depth)[,1:2])
# input.data$aap <- extract(aap, coordinates(peat.depth)[,1:2])



#create input data from provided data
input.data <- as.data.frame(peat.depth[,c(1, 4:13)])
names(input.data)

#export to file
saveRDS(input.data, file="data/input.data.rds")
write.csv(input.data, file = "input_data.csv", row.names = F)
 