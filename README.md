---
title: "England Peat Depth Model ReadMe"
author: "CK"
date: "6 October 2017"
output: html_document
---

## About
We are developing a model which can predict the depth of peat where it is found in England.  It is based on publically accessible environmental and geographic data and is intended to be released under an Open Government Data licence.  

## Source Data

### Predictors
A key requirement of the model is that the predictor data is derived from openly available data so that the model can be used without any restrictive licensing.  The predictors used in this model are as follows: 

#### CLIMATE DATA
All climate data was derived from *UKCP09: Met Office gridded land surface climate observations - long term averages at 5km resolution* (Met Office, 2017).  We have used the 1960 to 1990 long term averages (averages for more recent time periods are also available) on the assumption that peat depth is most likely to correlate with historic climate than recent climatic changes.  

Full methodology and lots of further information is available from Met Office 2017, and in Perry et al, 2005.  The monthly long-term averages were aggregated to seasonal and annual data using the same methodology as the Met Office used for its 25km seasonal averages:  

>For the days of frost and days of rain variables the seasonal and annual averages are the total of the individual monthly averages. For the remaining variables the seasonal and annual averages are the mean of the monthly averages (allowing for differences in month length). To facilitate combining the baseline data with the UKCP09 climate projections, the 25 km baseline averages for rainfall have been expressed in units of millimetres per day (rather than total millimetres, as for the 5 km data sets).

Each season is comprised of three calendar months, as follows:  

* Winter = December, January, February  
* Spring = March, April, May  
* Summer = June, July, August  
* Autumn = September, October, November  

The following datasets are used as predictors in the model:  

|Dataset|Units|
|:----|:----|
|Growing degree days annual average|days|
|Growing season length annual average|days|
|Total rainfall annual average|mm|
|Mean daily rainfall annual average|mm|
|Days of rain above 10mm annual average|days|
|Days of rain above 1mm annual average|days|
|Mean annual maximum temperature|deg C|
|Mean annual temperature|deg C|
|Mean annual minimum temperature|deg C|

#### Topographic and hydrological data

TBC

### Training data
The model will be trained on `NUMBER OF MEASUREMENTS` measured peat depths *DETAILS ON HOW THEY WERE GATHERED. Acknowledgements and sources etc.* 

## Models
*explain what models are used, what models were tried and rationale for choice.* 


###Model 1   
`Mrf1` is a random forest model run on a subset of the predictor and observation data.  It uses observation data from Cumbria, Lancashire and the North Pennines, which has been further reduced by subsampling it down from over 22,237 records to 10,000 (purely for processing speed).  

Model results are as follows: 

    Random Forest 
    7502 samples
    15 predictor
    mtry  RMSE      Rsquared   MAE     
    2    50.63915  0.7600158  34.76881
    8    50.82632  0.7582551  34.83158
    15    51.01271  0.7565077  34.94512

|rf variable |importance
|:----------- |:---
|rain_ann       |100.00
|slope          | 93.69
|rain_daily     | 92.65
|elev           | 90.44
|gdd            | 81.07
|gsl            | 79.65
|raindays_10mm  | 79.30
|raindays_1mm   | 76.97
|aspect         | 76.74
|temp_mean      | 76.06
|temp_max       | 68.77
|temp_min       | 67.89
|outflow        | 50.03
|inflow         | 43.90
|surf           |  0.00


## Project information

|Script filename|Type|Purpose|
|:--------------|:---|:---------------------------------------------|
|ukcp09DataImport.R|R script|imports climate data as `ESRI ASCII` files, converts to raster and calculates seasonal and annual averages|
|peat_depth_data_prep.Rmd|Rmarkdown|data preparation. Imports topo and hydro `.tiff` files and converts to raster, calculates slope and aspect rasters, resamples climate rasters|
|peat_depth_input_data.Rmd|Rmarkdown|Creates input dataset for models by extracting location info from peat depth file and extracting predictor variables from rasters|
|peat_depth_model_selection.Rmd|Rmarkdown|Runs a number of models and assesses performance|
|peat_depth_model_run.Rmd|Rmarkdown|Runs final model and creates final outputs|


## References

Met Office (2017): UKCP09: Met Office gridded land surface climate observations - long term averages at 5km resolution. Centre for Environmental Data Analysis, accessed on 01/10/2017. http://catalogue.ceda.ac.uk/uuid/620f6ed379d543098be1126769111007

Perry, Matthew, and Daniel Hollis. "The generation of monthly gridded datasets for a range of climatic variables over the United Kingdom." International Journal of Climatology 25.8 (2005): 1041-1054. https://www.metoffice.gov.uk/binaries/content/assets/mohippo/pdf/p/8/monthly_gridded_datasets_uk.pdf

R Core Team (2016). "R: A language and environment for statistical computing. R Foundation for Statistical Computing"", Vienna, Austria. URL http://www.R-project.org/.
