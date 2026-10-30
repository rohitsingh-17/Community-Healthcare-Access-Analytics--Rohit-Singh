# Community-Healthcare-Access-Analytics--Rohit-Singh
# Rural Healthcare Data Analysis using R

## Project Overview

This project focuses on analyzing rural healthcare infrastructure and healthcare workforce across Indian States and Union Territories using R programming.

The project uses the Rural Health Statistics (RHS) 2020 dataset to explore the availability of healthcare facilities and medical staff. It applies data preprocessing, exploratory data analysis (EDA), statistical techniques, and data visualization to understand patterns in healthcare infrastructure.

## Objectives

- Clean and preprocess the healthcare dataset.
- Identify and handle missing values and duplicate records.
- Calculate descriptive statistics.
- Identify the top 10 states based on PHCs and doctors.
- Detect outliers using the Interquartile Range (IQR) method.
- Analyze the correlation between healthcare infrastructure and staffing.
- Visualize the findings using different charts.

## Dataset

**Dataset Name:** Rural Health Statistics 2020

**Data Source:** Ministry of Health and Family Welfare, Government of India.

The dataset contains information about:
- States and Union Territories
- Sub-Centres
- Primary Health Centres (PHCs)
- Community Health Centres (CHCs)
- Doctors and medical specialists
- Pharmacists and laboratory technicians
- Nursing staff and other healthcare workers

## Modules Covered

### Module 1: Introduction to Data Science
- Identification and understanding of the dataset.
- Understanding structured data.
- Classification of numerical and categorical variables.

### Module 2: Data Pre-processing
- Data cleaning and preprocessing.
- Missing-value identification and handling.
- Duplicate record detection and removal.
- Data type conversion.
- Removal of aggregate records for state-wise analysis.

### Module 3: Exploratory Data Analysis (EDA)
- Descriptive statistical analysis.
- Top 10 states by number of PHCs.
- Top 10 states by number of doctors.
- Outlier detection using the IQR method.
- Correlation analysis between healthcare infrastructure and staffing.

### Module 4: Data Visualization
- Bar chart for comparing the top 10 states by PHCs.
- Histogram for understanding PHC distribution.
- Box plot for identifying potential outliers.
- Heatmap for visualizing correlations between healthcare infrastructure and staffing.

## Tools and Technologies

- **Programming Language:** R
- **IDE:** RStudio
- **Data Format:** CSV
- **Libraries/Packages:** Base R functions and graphics.

## Project Structure

```text
Rural-Healthcare-Data-Analysis/
│
├── rhs_2020.csv
├── analysis.R
├── rhs_2020_cleaned.csv
├── README.md
└── outputs/
    ├── bar_chart.png
    ├── histogram.png
    ├── box_plot.png
    └── heatmap.png
```

## How to Run the Project

1. Download or clone this repository.
2. Open RStudio.
3. Set the working directory to the project folder.
4. Make sure the CSV dataset is present in the folder.
5. Open `analysis.R`.
6. Run the script to perform data analysis and generate visualizations.

## Expected Outcomes

- A cleaned healthcare dataset.
- Statistical summaries of healthcare infrastructure.
- Identification of states with the highest PHC and doctor counts.
- Identification of potential outliers.
- Understanding of relationships between healthcare facilities and staffing.
- Visual representation of healthcare data through charts and a heatmap.

## Conclusion

This project demonstrates the application of Data Science concepts using R programming to analyze rural healthcare infrastructure in India. It provides insights into the distribution of healthcare facilities and workforce across different states through statistical analysis and visualization.

## References

1. Ministry of Health and Family Welfare, Government of India – Rural Health Statistics 2020.
2. R Core Team – R: A Language and Environment for Statistical Computing.
3. R for Data Science – https://r4ds.hadley.nz/
4. R Documentation – https://www.r-project.org/

---

**Academic Project:** Foundation of Data Science (FODS)

**Project Topic:** Community Healthcare Access Analytics
