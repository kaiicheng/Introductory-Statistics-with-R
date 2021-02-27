setwd("C:/Users/Paul/Desktop/Statistics/0929")

data <- read.csv("classmate.csv")

data

gender<-data$gender
gender

weight<-data$weight
weight  

# Wrong.
# which(gender="M")
# which(gender="F")

which(gender=="M")
which(gender=="F")

summary(data)

# 1. Calculate how many males and females in the class.
# Males = 20, Females = 23
table(gender)

# 2. Calculate the mean of males’ and females’ weight respectively.
gender

male_number<-which(gender=="M")
male_number

female_number<-which(gender=="F")
female_number

male_weight<-data$weight[male_number]
male_weight
mean_male_weight<-sum(male_weight)/length(male_weight)
mean_male_weight

female_weight<-data$weight[female_number]
female_weight
mean_female_weight<-sum(female_weight)/length(female_weight)
mean_female_weight
"""
which(data$gender=="M")

weight<-(data$male_number$weight)
weight

male_weight<-which(data$weight)
male_weight

female_weight<-data$gender
female_weight
"""