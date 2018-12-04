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

library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

df_train <- df_train[,2:10]
df_test <- df_test[,2:10]

df_train$ID <- as.integer(df_train$ID)
# df_train$OutcomeType <- as.integer(df_train$OutcomeType)
# df_train$AnimalType <- as.integer(df_train$AnimalType)
df_train$SimpleColor <- as.integer(df_train$SimpleColor)

# df_test$AnimalType <- as.integer(df_test$AnimalType)
# df_test$SimpleColor <- as.integer(df_test$SimpleColor)



mytree1 <- rpart(OutcomeType~., data = df_train)
mytree <- rpart(OutcomeType~ AnimalType + AgeinDays + HasName + IsNeutered + IsMix + Gender+ SimpleColor, data = df_train)

rpart.plot(mytree1)
prp(mytree)
fancyRpartPlot(mytree1)
