##################################################################################################################
####  Purpose: Final Project - Classification
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################
setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
rm(list = ls())
library(kknn)

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

df_train$ID <- as.integer(df_train$ID)
df_train$OutcomeType <- as.integer(df_train$OutcomeType)
df_train$AnimalType <- as.integer(df_train$AnimalType)
df_train$SimpleColor <- as.integer(df_train$SimpleColor)

df_test$AnimalType <- as.integer(df_test$AnimalType)
df_test$SimpleColor <- as.integer(df_test$SimpleColor)

train_temp <- df_train[1:1000,]
test_temp <- df_test[1:50,]

df_kknn <- kknn(OutcomeType~., train = train_temp, test = test_temp, k = 10)
fit<- fitted(df_kknn)
table(df_test$OutcomeType, fit)
