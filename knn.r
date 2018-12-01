##################################################################################################################
####  Purpose: Final Project - Classification
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################

rm(list = ls())

df_train <- read.csv("./data/train.csv")
df_test <- read.csv("./data/test.csv")

df_kknn <- kknn(OutcomeType~., train = df_train_new, test = df_test_new, k = 10)
