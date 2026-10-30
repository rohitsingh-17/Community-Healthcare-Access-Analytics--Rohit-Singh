data <- read.csv("rhs_2020.csv",
                 stringsAsFactors = FALSE,
                 na.strings = c("", "NA"),
                 check.names = FALSE)

# 1. DATA CLEANING AND MISSING VALUES

num_cols <- setdiff(names(data), "State/UT")

for (col in num_cols) {
  data[[col]] <- suppressWarnings(
    as.numeric(as.character(data[[col]]))
  )
}

cat("Missing values before cleaning:\n")
print(colSums(is.na(data)))

cat("Duplicate rows:\n")
print(sum(duplicated(data)))

data <- data[!duplicated(data), ]

data <- data[data$`State/UT` != "All India Total", ]

data <- data[
  rowSums(!is.na(data[num_cols])) > 0, ]

cat("Missing values after cleaning:\n")
print(colSums(is.na(data)))

# 2. DESCRIPTIVE STATISTICS

cat("Descriptive statistics:\n")
print(summary(data[num_cols]))

cat("Mean PHCs:\n")
print(mean(data$PHCs, na.rm = TRUE))

cat("Median PHCs:\n")
print(median(data$PHCs, na.rm = TRUE))

cat("Standard deviation of PHCs:\n")
print(sd(data$PHCs, na.rm = TRUE))

cat("Mean doctors:\n")
print(mean(data$Doctors, na.rm = TRUE))

# 3. TOP 10 STATES BY PHCs AND DOCTORS

top_phc <- head(
  data[order(data$PHCs, decreasing = TRUE,
             na.last = NA), ], 10)

top_doctors <- head(
  data[order(data$Doctors, decreasing = TRUE,
             na.last = NA), ], 10)

cat("Top 10 states by PHCs:\n")
print(top_phc[, c("State/UT", "PHCs")])

cat("Top 10 states by doctors:\n")
print(top_doctors[, c("State/UT", "Doctors")])

# 4. OUTLIER DETECTION USING IQR

x <- data$PHCs
q1 <- quantile(x, 0.25, na.rm = TRUE)
q3 <- quantile(x, 0.75, na.rm = TRUE)
iqr_value <- IQR(x, na.rm = TRUE)

lower_limit <- q1 - 1.5 * iqr_value
upper_limit <- q3 + 1.5 * iqr_value

outliers <- data[
  !is.na(data$PHCs) &
  (data$PHCs < lower_limit |
   data$PHCs > upper_limit),
  c("State/UT", "PHCs")
]

cat("PHC outliers:\n")
print(outliers)

# 5. CORRELATION: INFRASTRUCTURE VS STAFFING

facilities <- c("SubCenters", "PHCs", "CHCs")

staff <- c("ANM/Health_Worker_Female", "Doctors",
           "Specialists", "Radiographers",
           "Pharmacists", "LabTechnicians",
           "NursingStaff")

cor_matrix <- cor(
  data[facilities],
  data[staff],
  use = "pairwise.complete.obs"
)

cat("Infrastructure and staffing correlation:\n")
print(round(cor_matrix, 2))

# 6. DATA VISUALIZATION

# Bar chart: Top 10 states by PHCs
barplot(top_phc$PHCs,
        names.arg = top_phc$`State/UT`,
        las = 2,
        col = "skyblue",
        main = "Top 10 States by PHCs",
        ylab = "Number of PHCs",
        cex.names = 0.65)

# Histogram: Distribution of PHCs
hist(data$PHCs,
     breaks = 10,
     col = "lightgreen",
     main = "Distribution of PHCs",
     xlab = "Number of PHCs")

# Box plot: PHC outliers
boxplot(data$PHCs,
        col = "orange",
        main = "Outliers in PHC Data",
        ylab = "Number of PHCs")

# Heatmap: Infrastructure and staffing correlation
heatmap(cor_matrix,
        Rowv = NA,
        Colv = NA,
        scale = "none",
        margins = c(10, 10),
        main = "Infrastructure vs Staffing Correlation")

# Save cleaned dataset
write.csv(data, "rhs_2020_cleaned.csv",
          row.names = FALSE)