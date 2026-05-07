marks <- c(45,50,55,60,65,70,75,80,85,90,72,68,77,82,59)

departments <- c("CSE","IT","ECE","MECH","CIVIL")

students <- c(40,35,50,45,30)

study_hours <- c(2,3,4,5,6,7,8,9)

scores <- c(50,55,60,65,70,75,80,85)

barplot(
  students,
  names.arg = departments,
  col = "red",
  main = "Score",
  xlab = "departments",
  ylab = "students"
)

pie(
  students,
  labels = departments,
  main = "Departwise students",
  col = rainbow(length(students))
)

hist(
  marks,
  main = "Histogram of marks",
  xlab = marks,
  col = "skyblue",
  border = "blue"
)

hist_data <- hist(marks, plot = FALSE)
plot(
  hist_data$mid,
  hist_data$count,
  type = "l",
  main = "Frequency polygon",
  xlab = "marks",
  ylab = "Frequency",
  col = "Blue",
)

boxplot(
  marks,
  main = "Box ploto of marks",
  ylab = "marks",
  col = "Orange"
)

plot(
  study_hours,
  scores,
  main = "Study hours vs scores",
  xlab = "Study Hours",
  ylab = "Scores",
  col = "blue",
  pch = 19
)

stem(marks)

sort(table(marks), descreasing = TRUE)