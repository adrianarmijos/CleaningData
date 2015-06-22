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
## Data Dictionary

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Variables

### subject_id
A number representing the subject being recorded performing the activity

### activity_name

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### measures

Signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ, 
- tBodyAcc-XYZ, 
- tGravityAcc-XYZ, 
- tBodyAccJerk-XYZ, 
- tBodyGyro-XYZ, 
- tBodyGyroJerk-XYZ, 
- tBodyAccMag, 
- tGravityAccMag, 
- tBodyAccJerkMag, 
- tBodyGyroMag, 
- tBodyGyroJerkMag, 
- fBodyAcc-XYZ, 
- fBodyAccJerk-XYZ, 
- fBodyGyro-XYZ, 
- fBodyAccMag, 
- fBodyAccJerkMag, 
- fBodyGyroMag, 
- fBodyGyroJerkMag.

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
