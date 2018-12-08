##################################################################################################################
####  Purpose: Final Project - Classification - c50
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################

#### 0. Clean up environment ####
rm(list = ls())

#### 1. Import Libraries and Datasets ####
library('C50')
library(rpart)
library(rpart.plot)
library(partykit)

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")


#### 2. Remove unwanted data ####
df_train <- df_train[,-1]
df_test <- df_test[,-1]
levels(df_test$SimpleColor) <- levels(df_train$SimpleColor)

#### 3.C5.0 Tree ####

mytree <- C5.0( OutcomeType~ AnimalType + AgeinDays + HasName + IsNeutered + IsMix + Gender + SimpleColor, data =df_train )
summary(mytree)
plot(mytree)


# myTree2 <- C50:::as.party.C5.0(mytree)
# fit<-fitted(myTree2)
# plot(myTree2[2])
# plot(myTree2[10])


#### 4. Error Checking ####
prediction<-predict( mytree ,df_test , type="class" )
table(actual=df_test[,2],prediction)
wrong<- (df_test[,2]!=prediction)
rate<-sum(wrong)/length(wrong)
print(rate)
