##################################################################################################################
####  Purpose: Final Project - Classification - EDA
####  Group: Ravi P., Derek P., Aneesh K., Ninad K.
####  Date: 11/28/2018
####  Comment:
####    setwd("~/Stevens/Fall2018/CS513_Knowledge_Discovery/Final Project/Classification")
####
##################################################################################################################
rm(list = ls())

df_train <- read.csv("./data/train_new.csv")
df_test <- read.csv("./data/test_new.csv")

# install.packages("ggplot2")
# install.packages("ggthemes")

library(dplyr)
library(ggplot2)
library(ggthemes) # visualization

#Combine datasets
df <- rbind(df_train,df_test)

summary(df[,c(-1,-2)])

#Check Animal Type vs Outcome
ggplot(df, aes(x = AnimalType, fill = OutcomeType)) + 
  geom_bar(position = 'fill', colour='black') +
  labs(y = "Proportion", x = "Animal Type", title = "Animal Type vs. Outcome")

#Check isMix vs Outcome for Cats and Dogs
ggplot(df, aes(x = IsMix, fill = OutcomeType)) + 
  geom_bar(position = 'fill', colour='black') +
  facet_wrap(~AnimalType)+
  labs(y = "Proportion", x = "IsMix", title = "isMix ~ Cats & Dogs Outcome")

#Check Age vs Outcome
ggplot(df, aes(x = AgeinDays, fill = OutcomeType)) + 
  geom_bar(position = 'fill', colour='black') +
  labs(y = "Proportion", x = "Age Range", title = "Age vs. Outcome")

#Check isNeutered vs Outcome
ggplot(df, aes(x = IsNeutered, fill = OutcomeType)) + 
  geom_bar(position = 'fill', colour='black') +
  labs(y = "Proportion", x = "IsNeutered", title = "IsNeutered vs. Outcome")