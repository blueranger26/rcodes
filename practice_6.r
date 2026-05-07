rm(list = ls())

data <- read.csv("nyka_top_brands_cosmetics_product_reviews.csv")

# Convert categorical columns
data$brand_name <- as.factor(data$brand_name)
data$is_a_buyer <- as.factor(data$is_a_buyer)
data$pro_user <- as.factor(data$pro_user)

print(head(data))


# ONE-SAMPLE t-TEST
t.test(data$review_rating, mu = 4)


# TWO-SAMPLE t-TEST
t.test(review_rating ~ is_a_buyer, data = data)


# NON-PARAMETRIC TEST
wilcox.test(review_rating ~ is_a_buyer, data = data)


# ONE-WAY ANOVA
anova1 <- aov(review_rating ~ brand_name, data = data)
summary(anova1)


# TWO-WAY ANOVA
anova2 <- aov(
  review_rating ~ brand_name * is_a_buyer,
  data = data
)

summary(anova2)


# BOXPLOT
boxplot(
  review_rating ~ brand_name,
  
  data = data,
  
  main = "Review Ratings by Brand",
  
  xlab = "Brand",
  
  ylab = "Review Rating",
  
  las = 2
)