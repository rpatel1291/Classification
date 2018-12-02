rm(list = ls())

library('C50')

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

df_train <- df_train[,2:10]
df_test <- df_test[,2:10]

df_train$ID <- as.integer(df_train$ID)

mytree <- C5.0( OutcomeType~ AnimalType + AgeinDays + HasName + IsNeutered + IsMix + Gender, data =df_train )
summary(mytree)
plot(mytree)

library("partykit")
myTree2 <- C50:::as.party.C5.0(mytree)
plot(myTree2[2])
plot(myTree2[10])

prediction<-predict( mytree ,df_test , type="class" )
table(actual=df_test[,2],prediction)
wrong<- (df_test[,2]!=prediction)
rate<-sum(wrong)/length(wrong)
print(rate)
