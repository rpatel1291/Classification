##################################################################################################################
####  Purpose: Final Project - Classification - CART
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################
setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
rm(list = ls())

library(neuralnet)

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

df_train <- df_train[,2:10]
df_test <- df_test[,2:10]

df_train$ID <- as.integer(df_train$ID)
df_train$OutcomeType <- as.integer(df_train$OutcomeType)
df_train$AnimalType <- as.integer(df_train$AnimalType)
df_train$SimpleColor <- as.integer(df_train$SimpleColor)
df_train$Gender <- as.integer(df_train$Gender)
df_train$AgeinDays <- as.integer(df_train$AgeinDays)

df_test$AnimalType <- as.integer(df_test$AnimalType)
df_test$SimpleColor <- as.integer(df_test$SimpleColor)

df_ann <- neuralnet(OutcomeType~ AnimalType + AgeinDays + HasName + IsNeutered + IsMix + Gender+ SimpleColor, data = df_train, threshold = 0.01, hidden = 5)

plot(df_ann)

net_result <- compute(df_ann, df_test[.c(-1,-2,-3)])
ann <- as.numeric(net_result$net.result)

table(Actual=df_test$OutcomeType)
