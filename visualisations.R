# =====================================================
# VISUALIZATIONS ON NYKAA DATASET
# =====================================================

# Clear workspace
rm(list = ls())

# -----------------------------------------------------
# LOAD DATASET
# -----------------------------------------------------

data <- read.csv("nyka_top_brands_cosmetics_product_reviews.csv")

# Clean column names
names(data) <- tolower(names(data))
names(data) <- make.names(names(data))

# Convert categorical columns
data$brand_name <- as.factor(data$brand_name)
data$is_a_buyer <- as.factor(data$is_a_buyer)
data$pro_user <- as.factor(data$pro_user)
data$review_label <- as.factor(data$review_label)

# =====================================================
# 1. BAR PLOT
# =====================================================

# Number of reviews per brand

brand_counts <- table(data$brand_name)

barplot(
  brand_counts,
  
  main = "Number of Reviews per Brand",
  
  xlab = "Brand",
  
  ylab = "Count",
  
  col = rainbow(length(brand_counts)),
  
  las = 2
)

# -----------------------------------------------------
# las = 2 rotates labels vertically
# -----------------------------------------------------



# =====================================================
# 2. PIE CHART
# =====================================================

# Buyer vs Non-Buyer distribution

buyer_counts <- table(data$is_a_buyer)

pie(
  buyer_counts,
  
  main = "Buyer Distribution",
  
  col = c("skyblue", "orange")
)



# =====================================================
# 3. HISTOGRAM
# =====================================================

# Distribution of review ratings

hist(
  data$review_rating,
  
  main = "Histogram of Review Ratings",
  
  xlab = "Review Rating",
  
  ylab = "Frequency",
  
  col = "lightgreen",
  
  border = "black"
)



# =====================================================
# 4. FREQUENCY POLYGON
# =====================================================

hist_data <- hist(
  data$review_rating,
  plot = FALSE
)

plot(
  hist_data$mids,
  hist_data$counts,
  
  type = "l",
  
  col = "blue",
  
  lwd = 2,
  
  main = "Frequency Polygon of Review Ratings",
  
  xlab = "Review Rating",
  
  ylab = "Frequency"
)



# =====================================================
# 5. BOXPLOT
# =====================================================

# Product rating across buyer groups

boxplot(
  review_rating ~ is_a_buyer,
  
  data = data,
  
  main = "Review Rating by Buyer Status",
  
  xlab = "Buyer Status",
  
  ylab = "Review Rating",
  
  col = c("skyblue", "orange")
)



# =====================================================
# 6. SCATTER PLOT
# =====================================================

# Price vs Product Rating

plot(
  data$price,
  data$product_rating,
  
  main = "Price vs Product Rating",
  
  xlab = "Price",
  
  ylab = "Product Rating",
  
  col = "red",
  
  pch = 19
)

# -----------------------------------------------------
# pch = 19 gives solid circular points
# -----------------------------------------------------



# =====================================================
# 7. STEM-AND-LEAF PLOT
# =====================================================

stem(data$review_rating)



# =====================================================
# 8. DENSITY PLOT
# =====================================================

plot(
  density(data$product_rating, na.rm = TRUE),
  
  main = "Density Plot of Product Ratings",
  
  xlab = "Product Rating",
  
  col = "darkgreen",
  
  lwd = 2
)



# =====================================================
# 9. BOXPLOT BY BRAND
# =====================================================

boxplot(
  review_rating ~ brand_name,
  
  data = data,
  
  main = "Review Ratings by Brand",
  
  xlab = "Brand",
  
  ylab = "Review Rating",
  
  col = rainbow(length(levels(data$brand_name))),
  
  las = 2
)



# =====================================================
# 10. BARPLOT FOR REVIEW LABELS
# =====================================================

review_counts <- table(data$review_label)

barplot(
  review_counts,
  
  main = "Review Label Distribution",
  
  xlab = "Review Label",
  
  ylab = "Count",
  
  col = rainbow(length(review_counts))
)



# =====================================================
# END OF VISUALIZATIONS
# =====================================================