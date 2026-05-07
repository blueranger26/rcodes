num <- 10
if (num %% 2 == 0){
  print("It is a even number")
}else if(num %% 2 != 0){
  print("It is a odd numbe")
}else{
  print("Error")
}

n <- 10
sum <- 0
for (i in 1:n){
  sum <- sum + i
}
print(sum)

num <- 5
for (i in 1:n){
  print(paste(num,"x",i,"=",num*i))
}

fact <- 1
for (i in 1:num){
  fact <- fact * i 
}
print(fact)

square_func <- function(x){
  return(x^2)
}
square_func(6)

student <- function(marks){
  if (marks >= 90){
    print("You passed with distinction")
  }else if (marks < 90 && marks >=40){
    print("You passed")
  }else{
    print("You failed")
  }
}
student(77)

count_even <- function(v){
  sum(v %% 2 == 0)
}
v <- c(1:10)
count_even(v)

install.packages("readxl")
library(readxl)
merchandise <- read_excel("Merchandise_Sales.xlsx")
head(merchandise)
mewto <- scan("mewto.txt")
nykaa <- read.csv("nyka_top_brands_cosmetics_product_reviews.csv")
head(nykaa)