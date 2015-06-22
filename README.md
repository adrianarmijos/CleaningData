# Getting and Cleaning Data
Create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
## R code
The R code that is available in the [run_analysis.R](run_analysis.R) file. It run de analysis and save a file tidy_data.txt in the working directory

```R
source("run_analysis.R")
run()
td <- read.table(file = "tidy_data.txt")
head(td)
```
