
## R script for performing the analysis for the course project of the 
## Getting and cleaning data course
#
# Instructions: 
# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.


## Step 1
# I have downloaded and unzipped the data to the folder UCI HAR Dataset
# Read and merge the data from the train and test folders 
# Make sure to read the training data first and the test data second for all datasets 
library(data.table)
library(dplyr)
library(plyr)
measurements    <- rbind(read.table("UCI HAR Dataset\\test\\X_test.txt"),read.table("UCI HAR Dataset\\train\\X_train.txt"))
activities      <- rbind(read.table("UCI HAR Dataset\\test\\y_test.txt"),read.table("UCI HAR Dataset\\train\\y_train.txt"))
subject         <- rbind(read.table("UCI HAR Dataset\\test\\subject_test.txt"),read.table("UCI HAR Dataset\\train\\subject_train.txt"))

activity.labels <- read.table("UCI HAR Dataset\\activity_labels.txt")
features        <- read.table("UCI HAR Dataset\\features.txt")

## Step 2
# Use the fetures file which contains all column descriptions to identify columns with mean and std values
# Use regular expressions to identify the columns
measurements.to.extract<-(grepl("mean|std", features[,2], ignore.case=TRUE))

# Get the columns corresponding to the mean or standard deviation
measurements <- measurements[,measurements.to.extract];

## Step 3: Use descriptive labels for the activities in the data set
# Get descriptions from the activity.labels file
names(activities)="activity"
activities$activity<-mapvalues(activities$activity, activity.labels$V1, as.character(activity.labels$V2))

## Step 4: Label the columns with descriptive names
# Use the names from features.txt as column names
col.names <- features[measurements.to.extract,2]
col.names<-gsub('-','.',col.names)
col.names<-gsub('\\(\\)','',col.names)
names(measurements)<-col.names

# Step 5: Creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject

# Link the measurements to activity and subject
names(subject)="subject"
measurements <- cbind.data.frame(subject, activities, measurements)

# group by subject and activity and compute average 
# I have not renamed the columns of the data set (i.e. tBodyAcc.mean.X is not renamed to mean.tBodyAcc.mean.X)
# because the column names are already so long and making them longer would decrease readability. Instead I 
# have named the dataset so that it is clear that it contains only mean values
mean.measurements <- measurements %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(mean.measurements, "mean.measurements.txt", col.names=TRUE)


