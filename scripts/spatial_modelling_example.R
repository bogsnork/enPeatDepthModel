library(raster)
library(rgdal)
#library(randomForest)

peat.depth <- readOGR("peat_depth.shp", "peat_depth")
height <- raster("height.tif")
aspect <- raster("aspect.tif")
slope <- raster("slope.tif")

training.data <- peat.depth$depth
training.data$height <- extract(height, peat.depth)
training.data$aspect <- extract(aspect, peat.depth)
training.data$slope <- extract(slope, peat.depth)

M <- lm(depth ~ height + aspect + slope, data=training.data)
#M.rf <- randomForest(depth ~ height + aspect + slope, data=training.data)

#height <- resample(aspect, height)

predictors <- stack(height, aspect, slope)

output <- predict(predictors, M, type="response", progress="text")

plot(output)

writeRaster(output, "predicted_peat_depth.tif")
