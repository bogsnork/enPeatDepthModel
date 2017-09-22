#Peat Depths: model selection script
#Aug 2017

#packages ----
library(raster)
library(rgdal)
library(randomForest)
library(caTools)
library(ggplot2)

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
input.data <- readRDS("E://National_Peat_Depth_map/data/input.data.rds") 


# Split into training and test set ----

set.seed(123)
split = sample.split(input.data$PEAT_DEPTH, SplitRatio = 2/3)
training_set = subset(input.data, split == TRUE)
test_set = subset(input.data, split == FALSE)

# Feature Scaling ---- 
#not sure needed

# training_set = scale(training_set)
# test_set = scale(test_set)



#run model ----
  #linear model
M.lm <- lm(PEAT_DEPTH ~ elev + aspect + slope + aap, data=training_set)
  summary(M.lm)
  M.lm
  ggplotRegression(M.lm)
  par(mfrow = c(2,2))
  #plot(M.lm)
  par(mfrow = c(1,1))

pred.lm <- predict(M.lm, test_set[-1])  
test.err.lm <- mean((test_set$PEAT_DEPTH - pred.lm)^2)  
test.err.lm

#plot(test_set$PEAT_DEPTH - pred.lm)
abline(0,0, col="red")

hist(test_set$PEAT_DEPTH - pred.lm)
  
  #random forest
M.rf <- randomForest(PEAT_DEPTH ~ elev + aspect + slope + aap, data=training_set)  
  summary(M.rf)
  M.rf
  plot(M.rf)

  
#compare the Out of Bag Sample Errors and Error on Test set
#https://www.r-bloggers.com/random-forests-in-r/

n.variables <- ncol(training_set)-1  
oob.err=double(n.variables)
test.err=double(n.variables)
  
#mtry is no of Variables randomly chosen at each split
  for(mtry in 1:n.variables) 
  {
    rf=randomForest(PEAT_DEPTH ~ . , data = training_set, mtry=mtry,ntree=400) 
    oob.err[mtry] = rf$mse[400] #Error of all Trees fitted
    
    pred<-predict(rf, test_set) #Predictions on Test Set for each Tree
    test.err[mtry]= with(test_set, mean((PEAT_DEPTH - pred)^2)) #Mean Squared Test Error
    
    cat(mtry," ") #printing the output to the console
    
  }

#test error

test.err

#Out of Bag Error Estimation
oob.err

#Plotting both Test Error and Out of Bag Error

matplot(
  1:mtry ,
  cbind(oob.err, test.err),
  pch = 19 ,
  col = c("red", "blue"),
  type = "b",
  ylab = "Mean Squared Error",
  xlab = "Number of Predictors Considered at each Split"
)

legend(
  "bottomright",
  legend = c("Out of Bag Error", "Test Error"),
  pch = 19,
  col = c("red", "blue")
)