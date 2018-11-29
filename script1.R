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
df_train <- read.csv("./data/train.csv")
df_test <- read.csv("./data/test.csv")

#### 1a. Make copies of data ####
df_train_ann <- df_train
df_test_ann <- df_test

#### 2. Summary of dataset ####
summary(df_train)
summary(df_test)

#### 3. Convert factors to integer ####
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

library(kknn)

library(C50)

library(randomForest)

library(neuralnet)
