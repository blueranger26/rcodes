# =====================================================
# Assignment: Confidence Interval Estimation
# Dataset: nyka_top_brands_cosmetics_product_reviews.csv
# =====================================================

# Clear workspace
rm(list = ls())

# -----------------------------------------------------
# LOAD DATASET
# -----------------------------------------------------

data <- read.csv("nyka_top_brands_cosmetics_product_reviews.csv")

# View dataset
head(data)

# Check structure
str(data)

# -----------------------------------------------------
# CLEAN COLUMN NAMES
# -----------------------------------------------------

names(data) <- tolower(names(data))
names(data) <- make.names(names(data))

# -----------------------------------------------------
# CONVERT CATEGORICAL COLUMNS TO FACTORS
# -----------------------------------------------------

data$is_a_buyer <- as.factor(data$is_a_buyer)
data$pro_user <- as.factor(data$pro_user)
data$review_label <- as.factor(data$review_label)

# =====================================================
# 1. CONFIDENCE INTERVAL FOR MEAN USING Z-TEST
# =====================================================

# Question:
# Estimate confidence interval for average review rating

# Numeric column
xbar <- mean(data$review_rating, na.rm = TRUE)

# Sample size
n <- length(na.omit(data$review_rating))

# Assume population SD known
sigma <- sd(data$review_rating, na.rm = TRUE)

# Significance level
alpha <- 0.05

# Critical z-value
z <- qnorm(1 - alpha/2)

# Confidence interval calculation
lower_z <- xbar - z * (sigma / sqrt(n))
upper_z <- xbar + z * (sigma / sqrt(n))

cat("===== Z-TEST CONFIDENCE INTERVAL =====\n")

cat("Sample Mean:", xbar, "\n")
cat("Sample Size:", n, "\n")
cat("Confidence Interval: [",
    lower_z, ",", upper_z, "]\n\n")



# =====================================================
# 2. t-TEST CONFIDENCE INTERVAL
# =====================================================

# Question:
# Confidence interval for average product rating

t_result <- t.test(
  data$product_rating,
  conf.level = 0.95
)

cat("===== t-TEST CONFIDENCE INTERVAL =====\n")

print(t_result)

# -----------------------------------------------------
# t.test automatically calculates:
# - confidence interval
# - t statistic
# - p-value
# -----------------------------------------------------



# =====================================================
# 3. PROPORTION TEST
# =====================================================

# Question:
# Estimate confidence interval for proportion
# of buyers in dataset

# Count TRUE buyers
buyers <- sum(data$is_a_buyer == TRUE, na.rm = TRUE)

# Total observations
total <- nrow(data)

# Perform proportion test
prop_result <- prop.test(
  buyers,
  total,
  conf.level = 0.95
)

cat("===== PROPORTION TEST =====\n")

print(prop_result)

# -----------------------------------------------------
# This estimates:
# proportion of buyers in population
# -----------------------------------------------------



# =====================================================
# 4. EXTRA: CONFIDENCE INTERVAL FOR PRICE
# =====================================================

price_test <- t.test(
  data$price,
  conf.level = 0.95
)

cat("===== CONFIDENCE INTERVAL FOR PRICE =====\n")

print(price_test)



# =====================================================
# 5. VISUALIZATION - HISTOGRAM
# =====================================================

hist(
  data$review_rating,
  
  main = "Histogram of Review Ratings",
  
  xlab = "Review Rating",
  
  col = "skyblue",
  
  border = "black"
)



# =====================================================
# 6. BOXPLOT
# =====================================================

boxplot(
  data$product_rating,
  
  main = "Boxplot of Product Ratings",
  
  ylab = "Product Rating",
  
  col = "orange"
)



# =====================================================
# END OF ASSIGNMENT
# =====================================================