setwd("C:/Users/Paul/Desktop/Statistics/0929")
data <- read.csv("classmate.csv")
data

# 1.
height<-data$height
height

weight<-data$weight
weight

plot(height,weight,main="Scatter plot of height and weight",xlab="Height",ylab="Weight",pch=15,col="red")
# warnings()

# 2. 
rainfall <-c(103.9,174.8,194.5,179.3,216.1,243.4,149.2,202.9,299.1,173.9,120.7,97.6)
color = character(12)
color[] = "red"
color
color[rainfall>180] = "red"
color[rainfall<=180] = "blue"
# Bar plot
barplot(rainfall,col=color,main="Bar plot of the rainfall of Tamsui (Jan-Dec)")

