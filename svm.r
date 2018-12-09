##################################################################################################################
####  Purpose: Final Project - Classification - SVM
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################

#### 0. Cleaning of environment ####
setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
rm(list = ls())


#### 1. Importing of library and data ####
df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

library(e1071)

#### 2. Cleaning of data ####
df_train <- df_train[,-1]
df_test <- df_test[,-1]

levels(df_test$SimpleColor) <- levels(df_train$SimpleColor)

#### 3. SVM ####
svm.model <- svm(OutcomeType~ ., data =df_train[,c(-1)])
svm.pred <- predict(svm.model,  df_test[,c(-1)] )


#### 4. Error Check ####
table(actual=df_test[,2],svm.pred )
SVM_wrong<- (df_test$OutcomeType!=svm.pred)
rate<-sum(SVM_wrong)/length(SVM_wrong)
print(rate)