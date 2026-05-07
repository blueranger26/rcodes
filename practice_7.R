# =====================================================
# Assignment: Hypothesis Testing - 2
# Dataset: nyka_top_brands_cosmetics_product_reviews.csv
# =====================================================

# Clear workspace
rm(list = ls())

# -----------------------------------------------------
# LOAD DATASET
# -----------------------------------------------------

data <- read.csv("nyka_top_brands_cosmetics_product_reviews.csv")

# View first rows
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
data$brand_name <- as.factor(data$brand_name)
data$review_label <- as.factor(data$review_label)

# Check structure again
str(data)

# =====================================================
# 1. INDEPENDENT SAMPLES t-TEST
# =====================================================

# Question:
# Do buyers and non-buyers give different
# average review ratings?

independent_t_test <- t.test(
  review_rating ~ is_a_buyer,
  data = data
)

print(independent_t_test)

# -----------------------------------------------------
# review_rating = numeric variable
# is_a_buyer = categorical variable (2 groups)
# -----------------------------------------------------



# =====================================================
# 2. F-TEST
# =====================================================

# Question:
# Is variance of review ratings same between
# buyers and non-buyers?

f_test <- var.test(
  review_rating ~ is_a_buyer,
  data = data
)

print(f_test)

# -----------------------------------------------------
# F-test compares variances of two groups
# -----------------------------------------------------



# =====================================================
# 3. CHI-SQUARE TEST
# =====================================================

# Question:
# Is buyer status associated with review label?

# Create contingency table
table_data <- table(
  data$is_a_buyer,
  data$review_label
)

print(table_data)

# Perform chi-square test
chi_result <- chisq.test(table_data)

print(chi_result)

# -----------------------------------------------------
# Chi-square test checks association between
# two categorical variables
# -----------------------------------------------------



# =====================================================
# 4. VISUALIZATION - BOXPLOT
# =====================================================

boxplot(
  review_rating ~ is_a_buyer,
  
  data = data,
  
  main = "Review Rating by Buyer Status",
  
  xlab = "Buyer Status",
  
  ylab = "Review Rating",
  
  col = c("skyblue", "orange")
)



# =====================================================
# 5. BARPLOT FOR CHI-SQUARE VARIABLES
# =====================================================

barplot(
  table_data,
  
  beside = TRUE,
  
  legend = TRUE,
  
  col = rainbow(nrow(table_data)),
  
  main = "Buyer Status vs Review Label"
)



# =====================================================
# END OF ASSIGNMENT
# =====================================================