##################################################################################################################
####  Purpose: Final Project - Classification
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####
####
##################################################################################################################

#### 0. Clean environment ####
rm(list = ls())

#### 1. Import dataset ####
df_train <- read.csv("./data/train.csv", na.strings = "?")
df_test <- read.csv("./data/test.csv", na.strings = "?")


#### 1a. Cleaning of data ####
### Train ###
## Removing blanks in OutcomeSubtype ##
i<-1
temp <- c()
for(x in df_train$OutcomeSubtype){
  if(x == ""){
    temp<-c(temp,i)
  }
  i<-i+1
}
if(length(temp) > 0){
  df_train2 <- df_train[-temp,]
}else{
  df_train2 <- df_train
}
rm(i)
rm(temp)
rm(x)

## Removing Unknown in SexuponOutcome ##
i<-1
temp <- c()
for(x in df_train2$SexuponOutcome){
  if(x == "Unknown"){
    temp<-c(temp,i)
  }
  i<-i+1
}
df_train2<- df_train2[-temp,]
rm(i)
rm(temp)
rm(x)

## Removing blanks from AgeuponOutcome ##
i<-1
temp <- c()
for(x in df_train2$AgeuponOutcome){
  if(x == ""){
    temp<-c(temp,i)
  }
  i<-i+1
}
df_train2<- df_train2[-temp,]
rm(i)
rm(temp)
rm(x)

### Test ###
## Removing blanks in OutcomeSubtype ##
i<-1
temp <- c()
for(x in df_test$OutcomeSubtype){
  if(x == ""){
    temp<-c(temp,i)
  }
  i<-i+1
}
if(length(temp) > 0){
  df_test2<- df_test[-temp,]
}else{
  df_test2<- df_test
}
rm(i)
rm(temp)
rm(x)

## Removing Unknown in SexuponOutcome ##
i<-1
temp <- c()
for(x in df_test2$SexuponOutcome){
  if(x == "Unknown"){
    temp<-c(temp,i)
  }
  i<-i+1
}
if(length(temp) > 0){
  df_test2<- df_test2[-temp,]
}else{
  df_test2<- df_test2
}
rm(i)
rm(temp)
rm(x)

## Removing blanks from AgeuponOutcome ##
i<-1
temp <- c()
for(x in df_test2$AgeuponOutcome){
  if(x == ""){
    temp<-c(temp,i)
  }
  i<-i+1
}
df_test2<- df_test2[-temp,]
rm(i)
rm(temp)
rm(x)

#### 1b. Make copies of data ####
df_train_ann <- df_train2
df_test_ann <- df_test2

#### 2. Summary of dataset ####
summary(df_train2)
summary(df_test2)

#### 3. Convert factors to integer  - for Neural Network function ####
df_train_ann$DateTime <- as.integer(df_train_ann$DateTime)
df_train_ann$AnimalType <- as.integer(df_train_ann$AnimalType)
df_train_ann$SexuponOutcome <- as.integer(df_train_ann$SexuponOutcome)
df_train_ann$AgeuponOutcome <- as.integer(df_train_ann$AgeuponOutcome)
df_train_ann$Breed <- as.integer(df_train_ann$Breed)
df_train_ann$Color <- as.integer(df_train_ann$Color)


df_test_ann$DateTime <- as.integer(df_test_ann$DateTime)
df_test_ann$AnimalType <- as.integer(df_test_ann$AnimalType)
df_test_ann$SexuponOutcome <- as.integer(df_test_ann$SexuponOutcome)
df_test_ann$AgeuponOutcome <- as.integer(df_test_ann$AgeuponOutcome)
df_test_ann$Breed <- as.integer(df_test_ann$Breed)
df_test_ann$Color <- as.integer(df_test_ann$Color)

#### 4. Different Funcitions ####

library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

tree <- rpart(OutcomeType~., data= df_train2)

library(kknn)

library(C50)

library(randomForest)

library(neuralnet)
