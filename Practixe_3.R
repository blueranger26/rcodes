table(c(1,1,2,2,3,3))
nykaa <- read.csv("nyka_top_brands_cosmetics_product_reviews.csv")
colSums(is.na(nykaa))
nykaa <- na.omit(nykaa)
names(sort(table(nykaa$mrp), descending=TRUE))[1]
mean(nykaa$mrp)
median(nykaa$mrp)
sd(nykaa$mrp)
var(nykaa$mrp)
range(nykaa$mrp)
min(nykaa$mrp)
max(nykaa$mrp)
quantile(nykaa$mrp)
IQR(nykaa$mrp)
coeff_var <- (sd(nykaa$mrp) / mean(nykaa$mrp))*100
coeff_var
str(nykaa)
nykaa$review_date <- is.numeric(nykaa$review_date)
x <- c(10,20,20,40,50)
mean(x)
median(x)
names(sort(table(x), decreasing = TRUE))[1]