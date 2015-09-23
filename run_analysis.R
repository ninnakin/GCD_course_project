# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.


## Step 1
# I have downloaded and unzipped the data to 
# Read and merge the data from the train and test folders 
library(data.table)
library(dplyr)
library(plyr)
measurements <- rbind(read.table("UCI HAR Dataset\\test\\X_test.txt"),read.table("UCI HAR Dataset\\train\\X_train.txt"))
activities <- rbind(read.table("UCI HAR Dataset\\test\\y_test.txt"),read.table("UCI HAR Dataset\\train\\y_train.txt"))
subject <- rbind(read.table("UCI HAR Dataset\\test\\subject_test.txt"),read.table("UCI HAR Dataset\\train\\subject_train.txt"))
activity.labels <- read.table("UCI HAR Dataset\\activity_labels.txt")


## Step 2
# Read the file containing all column descriptions to identify columns with mean and std values
# Use regular expressions to identify the columns

# I choose to exclude the columns starting with "angle" at the bottom as well because I don't 
# interpret them as representing a mean or standard deviation value
features<-read.table("UCI HAR Dataset\\features.txt")
measurements.to.extract<-(grepl("mean",features[,2],ignore.case=TRUE) | grepl("std",features[,2],ignore.case=TRUE)) & !grepl("angle\\(",features[,2],ignore.case=TRUE )

# Get the columns from X corresponding to the mean or standard deviation
# Use the names from features.txt as column names
measurements <- measurements[,measurements.to.extract];


## Step 3: Use descriptive labels for the activities in the data set
names(activities)="activity"
activities$activity<-mapvalues(activities$activity, activity.labels$V1, as.character(activity.labels$V2))


## Step 4: Label the columns with descriptive names
# some tidying of the names
col.names <- features[measurements.to.extract,2]
col.names<-gsub('-','.',col.names)
col.names<-gsub('\\(\\)','',col.names)
names(measurements)<-col.names


# Step 5: Creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject


# Link the values to activity and subject
names(subject)="subject"

# use merge or join instead?
# no, nothing to join on (no id in X)
measurements <- cbind.data.frame(subject, activities, measurements)

tidy.data <- measurements %>% group_by(subject, activity) %>% summarise_each(funs(mean))



