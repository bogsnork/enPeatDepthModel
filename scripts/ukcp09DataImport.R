## Import UKCP09 climate data

# packages----

library(sp)
library(raster)
library(rgdal)

# Define variables ----

### list files

list.files("data/")

### filename

ukcpFile <- "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196101-199001.txt"


### define the coordinate reference system (British National Grid)

crs_bng <- "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +datum=OSGB36 +units=m +no_defs" 

## read in ascii grid files and convert to raster----
## Read all monthly average total rainfall----
rain_1960_90_Jan <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196101-199001.txt"))
rain_1960_90_Feb <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196102-199002.txt"))
rain_1960_90_Mar <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196103-199003.txt"))
rain_1960_90_Apr <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196104-199004.txt"))
rain_1960_90_May <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196105-199005.txt"))
rain_1960_90_Jun <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196106-199006.txt"))
rain_1960_90_Jul <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196107-199007.txt"))
rain_1960_90_Aug <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196108-199008.txt"))
rain_1960_90_Sep <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196109-199009.txt"))
rain_1960_90_Oct <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196110-199010.txt"))
rain_1960_90_Nov <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196111-199011.txt"))
rain_1960_90_Dec <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rainfall_196112-199012.txt"))

## Read all monthly average rain days above 1mm----
raindays_1mm_1960_90_Jan <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196101-199001.txt"))
raindays_1mm_1960_90_Feb <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196102-199002.txt"))
raindays_1mm_1960_90_Mar <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196103-199003.txt"))
raindays_1mm_1960_90_Apr <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196104-199004.txt"))
raindays_1mm_1960_90_May <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196105-199005.txt"))
raindays_1mm_1960_90_Jun <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196106-199006.txt"))
raindays_1mm_1960_90_Jul <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196107-199007.txt"))
raindays_1mm_1960_90_Aug <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196108-199008.txt"))
raindays_1mm_1960_90_Sep <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196109-199009.txt"))
raindays_1mm_1960_90_Oct <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196110-199010.txt"))
raindays_1mm_1960_90_Nov <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196111-199011.txt"))
raindays_1mm_1960_90_Dec <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-1mm_196112-199012.txt"))

## Read all monthly average rain days above 10mm----
raindays_10mm_1960_90_Jan <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196101-199001.txt"))
raindays_10mm_1960_90_Feb <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196102-199002.txt"))
raindays_10mm_1960_90_Mar <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196103-199003.txt"))
raindays_10mm_1960_90_Apr <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196104-199004.txt"))
raindays_10mm_1960_90_May <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196105-199005.txt"))
raindays_10mm_1960_90_Jun <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196106-199006.txt"))
raindays_10mm_1960_90_Jul <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196107-199007.txt"))
raindays_10mm_1960_90_Aug <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196108-199008.txt"))
raindays_10mm_1960_90_Sep <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196109-199009.txt"))
raindays_10mm_1960_90_Oct <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196110-199010.txt"))
raindays_10mm_1960_90_Nov <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196111-199011.txt"))
raindays_10mm_1960_90_Dec <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_rain-days-10mm_196112-199012.txt"))

## Read all monthly average mean temp----
temp_mean_1960_90_Jan <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196101-199001.txt"))
temp_mean_1960_90_Feb <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196102-199002.txt"))
temp_mean_1960_90_Mar <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196103-199003.txt"))
temp_mean_1960_90_Apr <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196104-199004.txt"))
temp_mean_1960_90_May <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196105-199005.txt"))
temp_mean_1960_90_Jun <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196106-199006.txt"))
temp_mean_1960_90_Jul <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196107-199007.txt"))
temp_mean_1960_90_Aug <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196108-199008.txt"))
temp_mean_1960_90_Sep <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196109-199009.txt"))
temp_mean_1960_90_Oct <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196110-199010.txt"))
temp_mean_1960_90_Nov <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196111-199011.txt"))
temp_mean_1960_90_Dec <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_mean-temperature_196112-199012.txt"))


## Read all monthly average min temp----
temp_min_1960_90_Jan <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196101-199001.txt"))
temp_min_1960_90_Feb <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196102-199002.txt"))
temp_min_1960_90_Mar <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196103-199003.txt"))
temp_min_1960_90_Apr <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196104-199004.txt"))
temp_min_1960_90_May <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196105-199005.txt"))
temp_min_1960_90_Jun <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196106-199006.txt"))
temp_min_1960_90_Jul <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196107-199007.txt"))
temp_min_1960_90_Aug <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196108-199008.txt"))
temp_min_1960_90_Sep <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196109-199009.txt"))
temp_min_1960_90_Oct <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196110-199010.txt"))
temp_min_1960_90_Nov <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196111-199011.txt"))
temp_min_1960_90_Dec <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_minimum-temperature_196112-199012.txt"))



## Read all monthly average max temp----
temp_max_1960_90_Jan <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196101-199001.txt"))
temp_max_1960_90_Feb <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196102-199002.txt"))
temp_max_1960_90_Mar <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196103-199003.txt"))
temp_max_1960_90_Apr <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196104-199004.txt"))
temp_max_1960_90_May <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196105-199005.txt"))
temp_max_1960_90_Jun <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196106-199006.txt"))
temp_max_1960_90_Jul <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196107-199007.txt"))
temp_max_1960_90_Aug <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196108-199008.txt"))
temp_max_1960_90_Sep <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196109-199009.txt"))
temp_max_1960_90_Oct <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196110-199010.txt"))
temp_max_1960_90_Nov <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196111-199011.txt"))
temp_max_1960_90_Dec <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_maximum-temperature_196112-199012.txt"))




## Read all annual average growing degree days----
gdd_1960_90_ann <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_annual_growing-degree-days_1961-1990.txt"))
## Read all annual average growing season length----
gsl_1960_90_ann <- raster(read.asciigrid(
  proj4string = paste(crs_bng), 
  fname = "data/ukcp09_gridded-land-obs-averages-5km_annual_growing-season-length_1961-1990.txt"))


# make seasonal averages ----
#see https://www.metoffice.gov.uk/climatechange/science/monitoring/ukcp09/methods.html
# methodology here is same as methodology for 25km seasonal averages: 
# >For the days of frost and days of rain variables the seasonal and annual averages are the total of the individual monthly averages. For the remaining variables the seasonal and annual averages are the mean of the monthly averages (allowing for differences in month length). To facilitate combining the baseline data with the UKCP09 climate projections, the 25 km baseline averages for rainfall have been expressed in units of millimetres per day (rather than total millimetres, as for the 5 km data sets).
#seasons are defined by https://www.metoffice.gov.uk/climate/uk/data/ukcp09/faq#faq14

## rainfall seasonal and annual averages ----

# total rainfall
rain_1960_90_winter <- rain_1960_90_Dec + rain_1960_90_Jan + rain_1960_90_Feb
rain_1960_90_spring <- rain_1960_90_Mar + rain_1960_90_Apr + rain_1960_90_May
rain_1960_90_summer <- rain_1960_90_Jun + rain_1960_90_Jul + rain_1960_90_Aug
rain_1960_90_autumn <- rain_1960_90_Sep + rain_1960_90_Oct + rain_1960_90_Nov
rain_1960_90_annual <- 
  rain_1960_90_Dec + rain_1960_90_Jan + rain_1960_90_Feb + 
  rain_1960_90_Mar + rain_1960_90_Apr + rain_1960_90_May + 
  rain_1960_90_Jun + rain_1960_90_Jul + rain_1960_90_Aug + 
  rain_1960_90_Sep + rain_1960_90_Oct + rain_1960_90_Nov

# average daily rainfall
rain_daily_mean_1960_90_winter <- rain_1960_90_winter / 90
rain_daily_mean_1960_90_spring <- rain_1960_90_spring / 92
rain_daily_mean_1960_90_summer <- rain_1960_90_summer / 92
rain_daily_mean_1960_90_autumn <- rain_1960_90_autumn / 91
rain_daily_mean_1960_90_annual <- rain_1960_90_annual / 365
 
# average rain days above 1mm
raindays_1mm_1960_90_winter <- 
  raindays_1mm_1960_90_Dec + raindays_1mm_1960_90_Jan + raindays_1mm_1960_90_Feb
raindays_1mm_1960_90_spring <- 
  raindays_1mm_1960_90_Mar + raindays_1mm_1960_90_Apr + raindays_1mm_1960_90_May
raindays_1mm_1960_90_summer <- 
  raindays_1mm_1960_90_Jun + raindays_1mm_1960_90_Jul + raindays_1mm_1960_90_Aug
raindays_1mm_1960_90_autumn <- 
  raindays_1mm_1960_90_Sep + raindays_1mm_1960_90_Oct + raindays_1mm_1960_90_Nov
raindays_1mm_1960_90_annual <- 
  raindays_1mm_1960_90_Dec + raindays_1mm_1960_90_Jan + raindays_1mm_1960_90_Feb + 
  raindays_1mm_1960_90_Mar + raindays_1mm_1960_90_Apr + raindays_1mm_1960_90_May + 
  raindays_1mm_1960_90_Jun + raindays_1mm_1960_90_Jul + raindays_1mm_1960_90_Aug + 
  raindays_1mm_1960_90_Sep + raindays_1mm_1960_90_Oct + raindays_1mm_1960_90_Nov

# average rain days above 10mm
raindays_10mm_1960_90_winter <- 
  raindays_10mm_1960_90_Dec + raindays_10mm_1960_90_Jan + raindays_10mm_1960_90_Feb
raindays_10mm_1960_90_spring <- 
  raindays_10mm_1960_90_Mar + raindays_10mm_1960_90_Apr + raindays_10mm_1960_90_May
raindays_10mm_1960_90_summer <- 
  raindays_10mm_1960_90_Jun + raindays_10mm_1960_90_Jul + raindays_10mm_1960_90_Aug
raindays_10mm_1960_90_autumn <- 
  raindays_10mm_1960_90_Sep + raindays_10mm_1960_90_Oct + raindays_10mm_1960_90_Nov
raindays_10mm_1960_90_annual <- 
  raindays_10mm_1960_90_Dec + raindays_10mm_1960_90_Jan + raindays_10mm_1960_90_Feb + 
  raindays_10mm_1960_90_Mar + raindays_10mm_1960_90_Apr + raindays_10mm_1960_90_May + 
  raindays_10mm_1960_90_Jun + raindays_10mm_1960_90_Jul + raindays_10mm_1960_90_Aug + 
  raindays_10mm_1960_90_Sep + raindays_10mm_1960_90_Oct + raindays_10mm_1960_90_Nov

## temperature seasonal and annual averages ----

# average mean temperature
temp_mean_1960_90_winter <- 
  mean(temp_mean_1960_90_Dec, temp_mean_1960_90_Jan, temp_mean_1960_90_Feb)
temp_mean_1960_90_spring <- 
  mean(temp_mean_1960_90_Mar, temp_mean_1960_90_Apr, temp_mean_1960_90_May)
temp_mean_1960_90_summer <- 
  mean(temp_mean_1960_90_Jun, temp_mean_1960_90_Jul, temp_mean_1960_90_Aug)
temp_mean_1960_90_autumn <- 
  mean(temp_mean_1960_90_Sep, temp_mean_1960_90_Oct, temp_mean_1960_90_Nov)
temp_mean_1960_90_annual <- mean(
  temp_mean_1960_90_Dec, temp_mean_1960_90_Jan, temp_mean_1960_90_Feb, 
  temp_mean_1960_90_Mar, temp_mean_1960_90_Apr, temp_mean_1960_90_May, 
  temp_mean_1960_90_Jun, temp_mean_1960_90_Jul, temp_mean_1960_90_Aug, 
  temp_mean_1960_90_Sep, temp_mean_1960_90_Oct, temp_mean_1960_90_Nov)

# average minimum temperature
temp_min_1960_90_winter <- 
  mean(temp_min_1960_90_Dec, temp_min_1960_90_Jan, temp_min_1960_90_Feb)
temp_min_1960_90_spring <- 
  mean(temp_min_1960_90_Mar, temp_min_1960_90_Apr, temp_min_1960_90_May)
temp_min_1960_90_summer <- 
  mean(temp_min_1960_90_Jun, temp_min_1960_90_Jul, temp_min_1960_90_Aug)
temp_min_1960_90_autumn <- 
  mean(temp_min_1960_90_Sep, temp_min_1960_90_Oct, temp_min_1960_90_Nov)
temp_min_1960_90_annual <- mean(
  temp_min_1960_90_Dec, temp_min_1960_90_Jan, temp_min_1960_90_Feb, 
  temp_min_1960_90_Mar, temp_min_1960_90_Apr, temp_min_1960_90_May, 
  temp_min_1960_90_Jun, temp_min_1960_90_Jul, temp_min_1960_90_Aug, 
  temp_min_1960_90_Sep, temp_min_1960_90_Oct, temp_min_1960_90_Nov)

# export to file ----

#save all data
files <- paste(ls())
saveRDS(object = files, file = "outputs/ukcp09GriddedData.rds")

#monthly data
## save all monthly grids ----
saveRDS(file = "outputs/ukcp09GriddedDataMonthly.rds", object = c(
  "rain_1960_90_Jan", "rain_1960_90_Feb", "rain_1960_90_Mar", "rain_1960_90_Apr", 
  "rain_1960_90_May", "rain_1960_90_Jun", "rain_1960_90_Jul", "rain_1960_90_Aug", 
  "rain_1960_90_Sep", "rain_1960_90_Oct", "rain_1960_90_Nov", "rain_1960_90_Dec",
  "raindays_1mm_1960_90_Jan", "raindays_1mm_1960_90_Feb", "raindays_1mm_1960_90_Mar", "raindays_1mm_1960_90_Apr", 
  "raindays_1mm_1960_90_May", "raindays_1mm_1960_90_Jun", "raindays_1mm_1960_90_Jul", "raindays_1mm_1960_90_Aug", 
  "raindays_1mm_1960_90_Sep", "raindays_1mm_1960_90_Oct", "raindays_1mm_1960_90_Nov", "raindays_1mm_1960_90_Dec", 
  "raindays_10mm_1960_90_Jan", "raindays_10mm_1960_90_Feb", "raindays_10mm_1960_90_Mar", "raindays_10mm_1960_90_Apr", 
  "raindays_10mm_1960_90_May", "raindays_10mm_1960_90_Jun", "raindays_10mm_1960_90_Jul", "raindays_10mm_1960_90_Aug", 
  "raindays_10mm_1960_90_Sep", "raindays_10mm_1960_90_Oct", "raindays_10mm_1960_90_Nov", "raindays_10mm_1960_90_Dec", 
  "temp_mean_1960_90_Jan", "temp_mean_1960_90_Feb", "temp_mean_1960_90_Mar", "temp_mean_1960_90_Apr", 
  "temp_mean_1960_90_May", "temp_mean_1960_90_Jun", "temp_mean_1960_90_Jul", "temp_mean_1960_90_Aug", 
  "temp_mean_1960_90_Sep", "temp_mean_1960_90_Oct", "temp_mean_1960_90_Nov", "temp_mean_1960_90_Dec", 
  "temp_min_1960_90_Jan", "temp_min_1960_90_Feb", "temp_min_1960_90_Mar", "temp_min_1960_90_Apr", 
  "temp_min_1960_90_May", "temp_min_1960_90_Jun", "temp_min_1960_90_Jul", "temp_min_1960_90_Aug", 
  "temp_min_1960_90_Sep", "temp_min_1960_90_Oct", "temp_min_1960_90_Nov", "temp_min_1960_90_Dec", 
  "temp_max_1960_90_Jan", "temp_max_1960_90_Feb", "temp_max_1960_90_Mar", "temp_max_1960_90_Apr", 
  "temp_max_1960_90_May", "temp_max_1960_90_Jun", "temp_max_1960_90_Jul", "temp_max_1960_90_Aug", 
  "temp_max_1960_90_Sep", "temp_max_1960_90_Oct", "temp_max_1960_90_Nov", "temp_max_1960_90_Dec")) 
  
## save all seasonal grids ----
saveRDS(file = "outputs/ukcp09GriddedDataSeas.rds", object = c(
  "rain_1960_90_winter",  "rain_1960_90_spring", "rain_1960_90_summer", "rain_1960_90_autumn", 
  "rain_daily_mean_1960_90_winter",  "rain_daily_mean_1960_90_spring", 
  "rain_daily_mean_1960_90_summer", "rain_daily_mean_1960_90_autumn", 
  "raindays_1mm_1960_90_winter",  "raindays_1mm_1960_90_spring", 
  "raindays_1mm_1960_90_summer", "raindays_1mm_1960_90_autumn", 
  "raindays_10mm_1960_90_winter",  "raindays_10mm_1960_90_spring", 
  "raindays_10mm_1960_90_summer", "raindays_10mm_1960_90_autumn", 
  "temp_mean_1960_90_winter",  "temp_mean_1960_90_spring", "temp_mean_1960_90_summer", "temp_mean_1960_90_autumn", 
  "temp_min_1960_90_winter",  "temp_min_1960_90_spring", "temp_min_1960_90_summer", "temp_min_1960_90_autumn", 
  "temp_max_1960_90_winter",  "temp_max_1960_90_spring", "temp_max_1960_90_summer", "temp_max_1960_90_autumn")) 
  

## save all annual grids ----
  saveRDS(file = "outputs/ukcp09GriddedDataAnn.rds", object = c(  
    "gdd_1960_90_ann ", "gsl_1960_90_ann",  
    "rain_1960_90_annual", "rain_daily_mean_1960_90_annual", 
    "raindays_1mm_1960_90_annual", "raindays_10mm_1960_90_annual",
    "temp_mean_1960_90_annual", "temp_min_1960_90_annual", "temp_max_1960_90_annual"))
  