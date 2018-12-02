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

df_train <- df_train[,2:10]
df_test <- df_test[,2:10]

df_train$ID <- as.integer(df_train$ID)
# df_train$OutcomeType <- as.integer(df_train$OutcomeType)
# df_train$AnimalType <- as.integer(df_train$AnimalType)
# df_train$SimpleColor <- as.integer(df_train$SimpleColor)

# df_test$AnimalType <- df_test(temp_test$AnimalType)
# df_test$SimpleColor <- df_test(temp_test$SimpleColor)

for(i in c(10,20,30,35,50,55,85)){
  predict<- kknn(OutcomeType~ AnimalType + AgeinDays + HasName + IsNeutered + IsMix + Gender+ SimpleColor, train = df_train, test = df_test, k = i, kernel = "rectangular")
  fit<- fitted(predict)
  wrong<- (df_test[,2] != fit)
  rate<-sum(wrong)/length(wrong)
  print(rate)
}

