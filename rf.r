##################################################################################################################
####  Purpose: Final Project - Classification - RandomForest
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


# install.packages("randomForest")
library(randomForest)


fit <- randomForest( OutcomeType~., data=df_train[,-1], importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, df_test[,-1])

table(actual=df_test$OutcomeType ,Prediction)
plot(fit, ylim=c(0,1))
legend('topright', colnames(fit$err.rate), col=1:6, fill=1:6)



wrong<- (df_test$OutcomeType!=Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate 

