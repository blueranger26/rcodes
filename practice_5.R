n <- 10
p <- 0.5
cat("The P(X=4) :", dbinom(4,n,p), "\n")
cat("The P(x<=4) :", pbinom(4,n,p), "\n")
cat("The P(x>4) :", 1-pbinom(4,n,p),"\n")
cat("Mean :", n*p, "Var :", n*p*(1-p))

lamda <- 3
cat("p(x=4 :", dpois(4,lamda),"\n")
cat("The P(x<=4) :", ppois(4,lamda), "\n")
cat("The P(x>4) :", 1-ppois(4,lamda),"\n")
cat("Mean :", lamda, "Var :", lamda)

mean <- 100
std_dev <- 15
cat("p(x<120) :", pnorm(120,mean, std_dev),"\n")
z <- (120-mean)/std_dev
cat("Z score :", z)

df <- 10
cat("p(x<15) :",pchisq(15,df),"\n")
cat("p(x>15) :", 1-pchisq(15,df), "\n")
cat("p(10<x<15) :", pchisq(15,df)-pchisq(10,df))

df_t <- 10
cat("p(x<15) :", pt(15,df_t))

df_1 <- 5
df_2 <- 10
cat("p(x<15) :",pf(15,df_1,df_2))

#CI for known SD
m <- 50
std <- 10
n <- 30
alpha <- 0.05

z <- qnorm(1-alpha/2)
upper <- m + z*(std/sqrt(n))
lower <- m - z * (std/sqrt(n))
cat("upper limit :",upper, "Lower limit :",lower)

#CI unknown SD
n <- c(34,56,45,86,34)
t_interval <- t.test(n, conf.level = 0.95)
cat("CI :", t_interval$conf.int)

#CI for proportion test
x <- 40
n <- 100
prop_test <- prop.test(x,n,conf.level = 0.95)
cat("CI :",prop_test$conf.int)

x_value <- seq(50,150, by=0.1)
y_value <- dnorm(x_value,100,15)
plot(
  x_value,
  y_value,
  type = "l",
  xlab = "x",
  ylab = "Density"
)