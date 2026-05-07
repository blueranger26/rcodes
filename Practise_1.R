num <- 10
text <- "Sushant"
flag <- TRUE
class(num)
class(text)
class(flag)

a <- 20
b <- 5
a+b
a*b
text <- "Hello"
class(text)
v <- 1:5
v*3
v[2]
v[v>3]
b<- c(2:9)
b

m1 <- matrix(1:4, nrow = 2)
m2 <- matrix(5:8, nrow = 2)
m1 %*% m2
m1[2,]
m2[,1]

i <- diag(2)
i %*% m1

df1 <- list(
  name = c("Sushant","Kartik","Trump"),
  cgpa = c(8.5,7.3,2.4)
)
df1$name[3] <- "Vance"
df1$cgpa[3] <- 4.3
df1

name <- c("Sushant","Kartik","Ramesh")
marks <- c(98.4,78.3,87.4)
result <- ifelse(marks > 40,"Pass","Fail")
student <- data.frame(name,marks,result)
head(student)
summary(student)
student[student$marks >90,]

car_price <- data.frame(
  name <- c("Suzuki","Hyundai","Volkswagen"),
  price <- c(8,15,18)
)
library(ggplot2)
ggplot(car_price, aes(x=name,y=price)) +
  geom_bar(stat = "identity", fill="Red")+ 
  ggtitle("Car Price Comparison")

r <- 0.7
area <- pi * r^2
area

v_1 <- c(2:11)
v*2
v[3:7]
v[v>=5]
v[v%%2==0]

