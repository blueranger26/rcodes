# =====================================================
# Assignment: Hypothesis Testing in R
# Dataset: student_performance_cleaned.csv
# =====================================================

# Clear workspace
rm(list = ls())

# -----------------------------------------------------
# LOAD DATASET
# -----------------------------------------------------

data <- read.csv("student_performance_cleaned.csv")

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
# CHECK DATATYPES
# -----------------------------------------------------

str(data)

# -----------------------------------------------------
# CONVERT CATEGORICAL COLUMNS TO FACTOR
# -----------------------------------------------------

data$grade <- as.factor(data$grade)

# -----------------------------------------------------
# CREATE NEW CATEGORICAL COLUMN
# Attendance Group from attendance percentage
# -----------------------------------------------------

data$attendance_group <- ifelse(
  data$attendance >= 75,
  "High",
  "Low"
)

# Convert into factor
data$attendance_group <- as.factor(data$attendance_group)

# Check levels
levels(data$attendance_group)

# =====================================================
# 1. ONE-SAMPLE t-TEST
# =====================================================

# Question:
# Is average total score significantly different from 75?

one_sample_test <- t.test(data$total_score, mu = 75)

print(one_sample_test)

# -----------------------------------------------------
# Interpretation:
# p-value < 0.05 → significant difference from 75
# -----------------------------------------------------



# =====================================================
# 2. TWO-SAMPLE t-TEST
# =====================================================

# Question:
# Do High-attendance and Low-attendance students
# differ in average total score?

two_sample_test <- t.test(
  total_score ~ attendance_group,
  data = data
)

print(two_sample_test)

# -----------------------------------------------------
# total_score = numeric variable
# attendance_group = categorical variable (2 groups)
# -----------------------------------------------------



# =====================================================
# 3. INDEPENDENT SAMPLE t-TEST
# =====================================================

# Same as above because groups are independent

independent_t_test <- t.test(
  total_score ~ attendance_group,
  data = data
)

print(independent_t_test)



# =====================================================
# 4. NON-PARAMETRIC TEST (Wilcoxon Test)
# =====================================================

# Used when data may not be normally distributed

wilcox_result <- wilcox.test(
  total_score ~ attendance_group,
  data = data
)

print(wilcox_result)



# =====================================================
# 5. ONE-WAY ANOVA
# =====================================================

# Question:
# Does average total score differ across grades?

anova1 <- aov(
  total_score ~ grade,
  data = data
)

summary(anova1)

# -----------------------------------------------------
# grade = categorical variable with multiple groups
# total_score = numeric response variable
# -----------------------------------------------------



# =====================================================
# 6. TWO-WAY ANOVA
# =====================================================

# Question:
# Does total score depend on:
# 1. Grade
# 2. Attendance Group
# 3. Interaction between both?

anova2 <- aov(
  total_score ~ grade * attendance_group,
  data = data
)

summary(anova2)

# -----------------------------------------------------
# * means:
# grade effect
# attendance effect
# interaction effect
# -----------------------------------------------------



# =====================================================
# 7. BOXPLOT VISUALIZATION
# =====================================================

boxplot(
  total_score ~ grade,
  
  data = data,
  
  main = "Total Score by Grade",
  
  xlab = "Grade",
  
  ylab = "Total Score",
  
  col = rainbow(length(levels(data$grade)))
)

#data$attendance_group <- cut(
#data$attendance,

#breaks = c(0, 60, 75, 100),

#labels = c("Low", "Medium", "High")
#)

# =====================================================
# 8. BOXPLOT FOR ATTENDANCE GROUP
# =====================================================

boxplot(
  total_score ~ attendance_group,
  
  data = data,
  
  main = "Total Score by Attendance Group",
  
  xlab = "Attendance Group",
  
  ylab = "Total Score",
  
  col = c("skyblue", "orange")
)



# =====================================================
# END OF ASSIGNMENT
# =====================================================