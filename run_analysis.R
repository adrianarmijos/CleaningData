
run <- function ()
{
        data <- mergeTrainingAndTest()
        data <- extractsMeasurementsMeanStd(data)
        data <- useActiviyNames(data)
        data <- getTidyData(data)
        
        write.table(tidy_data, file = "tidy_data.txt")
          
}

mergeTrainingAndTest <- function(type)
{
        rbind(getData("train"), getData("test"))
}

getData <- function(type)
{
        
        library(plyr)
        library(dplyr)
        
        # Build features catalog
        
        features <- read.table("UCI HAR Dataset\\features.txt")       
        features <- plyr::rename(features, replace = c("V1" = "feature_id", "V2" = "feature_name"))
        
        subjectFileName <- paste("UCI HAR Dataset\\",type,"\\subject_", type, ".txt",sep="")
        subject <- read.table(file = subjectFileName , col.names = c("subject_id"), header = FALSE )
        subject$id <- seq(along = subject[,1])
        
        activityFileName <- paste("UCI HAR Dataset\\",type,"\\y_", type, ".txt", sep="")
        activity <- read.table(file = activityFileName, col.names = c("activity_id"), header = FALSE )
        activity$id <- seq(along = activity[,1])
        
        measuresFileName <- paste("UCI HAR Dataset\\",type,"\\X_", type, ".txt", sep="")
        measures <- read.table(file = measuresFileName, col.names = features$feature_name, header = FALSE)
        measures$id <- seq(along = measures[,1])
        
        data <- plyr::join(subject, measures, by = "id")
        data <- plyr::join(activity, data, by = "id")
        
        data
}

extractsMeasurementsMeanStd <-function (data)
{

        colunmNames <- colnames(data)
        extract_features <- grepl("id|activity_id|subject_id|mean|std", colunmNames)

        data[,extract_features]
           
}

useActiviyNames<-function (data)
{
        activities <- read.table("UCI HAR Dataset\\activity_labels.txt")       
        activities <- plyr::rename(activities, replace = c("V1" = "activity_id", "V2" = "activity_name"))
        
        plyr::join(activities, data, by = "activity_id")
}

getTidyData<-function(data)
{
        labels <- c("activity_name", "subject_id")
        colunmNames <- colnames(data)
        measuresCol <- grepl("mean|std", colunmNames)
        measures <- colunmNames[measuresCol]
        
        melt_data <- melt(data, id = labels, measure.vars = measures)
        tidy_data <- dcast(melt_data, activity_name + subject_id ~ variable, mean)
        
        tidy_data
}

