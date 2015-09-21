# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.


# Read and merge the data from the train and test folders 
library(data.table)
X <- rbind(read.table("UCI HAR Dataset\\test\\X_test.txt"),read.table("UCI HAR Dataset\\train\\X_train.txt"))
y <- rbind(read.table("UCI HAR Dataset\\test\\y_test.txt"),read.table("UCI HAR Dataset\\train\\y_train.txt"))
subject <- rbind(read.table("UCI HAR Dataset\\test\\subject_test.txt"),read.table("UCI HAR Dataset\\train\\subject_train.txt"))

# Read the file containing all column descriptions to identify columns with mean and std values
# Use regular expressions to identify the columns
features<-read.table("features.txt")
features[grepl("mean",features[,2],ignore.case=TRUE) | grepl("std",features[,2],ignore.case=TRUE),]

# Get the columns from X corresponding to the mean or standard deviation
# Use the names from features.txt as column names
X2 <- X[, grepl("mean",features[,2],ignore.case=TRUE) | grepl("std",features[,2],ignore.case=TRUE)]
names(X2)<-features[grepl("mean",features[,2],ignore.case=TRUE) | grepl("std",features[,2],ignore.case=TRUE),2]

# Link the values to activity and subject
names(subject)="subject"
names(y)="activity"
X3 <- cbind.data.frame(subject, y, X2)

# Create new dataset with average of each variable for each activity and each subject
# Probably good idea to apply some version of plyr to calculate mean for the columns

