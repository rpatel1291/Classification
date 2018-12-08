##################################################################################################################
####  Purpose: Final Project - Classification - KKNN
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################

setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")

#### 0. Clean environment ####
rm(list = ls())

#### 1. Import libraries and datasets ####
library(kknn)

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

#### 2. Remove unwanted column ####
df_train <- df_train[,-1]
df_test <- df_test[,-1]
levels(df_test$SimpleColor) <- levels(df_train$SimpleColor)

summary(df_test)

df_train$SimpleColor <- as.integer(df_train$SimpleColor)
df_test$SimpleColor<- as.integer(df_test$SimpleColor)

df_k1 <- kknn(OutcomeType~ AnimalType + AgeinDays + HasName + IsNeutered + IsMix + Gender + SimpleColor, df_train, df_test, k = 1)
fit <- fitted(df_k1)
table(df_test$OutcomeType, fit)
wrong<- (df_test[,2] != fit)
rate<-sum(wrong)/length(wrong)
print(rate)


#### 3. KKNN Test and Error Rate ####

for(i in c(1,5,10,20,30,35,50,55,75)){
  predict<- kknn(OutcomeType~ AnimalType + AgeinDays + HasName + IsNeutered + IsMix + Gender, train = df_train, test = df_test, k = i)
  fit<- fitted(predict)
  wrong<- (df_test[,2] != fit)
  rate<-sum(wrong)/length(wrong)
  print(rate)
}

