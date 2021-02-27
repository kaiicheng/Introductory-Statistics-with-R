# 1.
x<-seq(2,100)
x
x_1<-x*x
x_1
# Ans:
mean(x_1)

# 2.
y<-rep(c(2:4), times = 77)
y
y_1<-rep(c(0:76), each=3)
y_1
y_2<-y+y_1
y_2
length(y_2)
# Ans:
var(y_2)

# 3.
z<-seq(1,99)
z
z_1<-seq(2,100)
z_1
z_2<-z*z_1
z_2
# Ans:
sd(z_2)

