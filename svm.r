##################################################################################################################
####  Purpose: Final Project - Classification - SVM
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################
setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
rm(list = ls())

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

df_train <- df_train[,2:10]
df_test <- df_test[,2:10]


levels(df_test$SimpleColor) <- levels(df_train$SimpleColor)


df_train$ID <- as.integer(df_train$ID)

# install.packages("e1071")
library(e1071)

svm.model <- svm(OutcomeType~ ., data =df_train[,c(-1)])
svm.pred <- predict(svm.model,  df_test[,c(-1)] )

table(actual=df_test[,2],svm.pred )
SVM_wrong<- (df_test$OutcomeType!=svm.pred)
rate<-sum(SVM_wrong)/length(SVM_wrong)
print(rate)