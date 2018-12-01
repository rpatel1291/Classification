##################################################################################################################
####  Purpose: Final Project - Classification
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################

setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
#### 0. Clean environment ####
rm(list = ls())

#### 1. Import dataset and libraries ####
df_train <- read.csv("./data/train.csv", na.strings = "?")
df_test <- read.csv("./data/test.csv", na.strings = "?")

library(dplyr)

library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

library(kknn)
library(C50)
library(randomForest)
library(neuralnet)

#### 1a. Cleaning of data ####

#### Renaming of columns ####
names(df_train)[1] <- 'ID'
df_test$ID <- as.character(df_test$ID)

full_df <- bind_rows(df_train, df_test)

#### Has name ####
full_df$HasName <- ifelse(full_df$Name == "", 0, 1)

### Removing Blanks in SexuponOutcome ###
i <- 1
temp <- c()
for(x in full_df$SexuponOutcome){
  if(x == ""){
    temp <- c(temp,i)
  }
  i <- i+1
}
full_df <- full_df[-temp,]
rm(i)
rm(temp)
rm(x)

### Removing blanks from AgeuponOutcome ####
i<-1
temp <- c()
for(x in full_df$AgeuponOutcome){
  if(x == ""){
    temp<-c(temp,i)
  }
  i<-i+1
}
full_df<- full_df[-temp,]
rm(i)
rm(temp)
rm(x)

#### Converting to Age to Days ####
full_df$TimeValue <- as.numeric(sapply(full_df$AgeuponOutcome, function(x) strsplit(x, split= ' ')[[1]][1]))
full_df$TimeUnit <- sapply(full_df$AgeuponOutcome, function(x) strsplit(x, split= ' ')[[1]][2])
full_df$TimeUnit <- gsub('s', '',full_df$TimeUnit)

mult_vector <- ifelse(full_df$TimeUnit == 'day', 1,
               ifelse(full_df$TimeUnit == 'week',7,
               ifelse(full_df$TimeUnit == 'month',30,
               ifelse(full_df$TimeUnit == 'year', 365, NA))))
full_df$AgeinDays <- full_df$TimeValue * mult_vector


#### 1b. Data Splits ####
i<-1
temp<- c()
for(x in full_df$OutcomeType){
  if( is.na(x) | x == "" ){
    temp <- c(temp,i)
  }
  i <- i + 1
}

df_test_new <- full_df[temp,]
df_train_new <- full_df[-temp,]
rm(i)
rm(x)
rm(temp)

#### 2. Summary of dataset ####
summary(full_df)
summary(df_train_new)
summary(df_test_new)

table(df_test_new$OutcomeType, df_test_new$AnimalType)
