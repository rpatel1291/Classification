##################################################################################################################
####  Purpose: Final Project - Classification - KKNN
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

df_kknn <- kknn(OutcomeType~., train = df_train, test = df_test, k = 10)
fit<- fitted(df_kknn)
table(fit)
