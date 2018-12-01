rm(list = ls())


df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

df_train$ID <- as.integer(df_train$ID)

# install.packages("e1071")
library(e1071)

svm.model <- svm( factor(OutcomeType)~ ., data =df_train[,c(-1,-2)])
svm.pred <- predict(svm.model,  df_test[,c(-1,-2)] )

table(actual=df_test[,3],svm.pred )
SVM_wrong<- (df_test$OutcomeType!=svm.pred)
rate<-sum(SVM_wrong)/length(SVM_wrong)
