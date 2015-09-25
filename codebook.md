# Description of the mean.measurements file created for the Getting and Cleaning Data course. 
Ninnakin
25 Sep 2015

The mean.measurements file lists the average for each subject and activity for each measurement relating to a mean or standard deviation value from the Human Activity Using Smartphones Dataset. It used the wide tidy data format. I have chosen not to rename the input variables (i.e. rename t.BodyAcc.mean.X to mean.t.BodyAcc.mean.X) and insted name the entire output dataset mean.measurements. This is because the longer name would decrease readability. 

Source of the original data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Description of the first 8 columns of the manipulated data:
subject			      type: int

The id of the subject performing the experiment 

activity		      type: char

The activity performed while the measurements were collected (standing, laying, sitting, walking, walking_downstair, walking_upstairs)

t.BodyAcc.mean.X	type: dbl

The mean of the t.BodyAcc.mean.X measurements for one particular subject and activity 

t.BodyAcc.mean.Y	type: dbl

The mean of the t.BodyAcc.mean.Y measurements for one particular subject and activity 

t.BodyAcc.mean.Z	type: dbl
The mean of the t.BodyAcc.mean.Z measurements for one particular subject and activity 

t.BodyAcc.std.X		type: dbl

The mean of the t.BodyAcc.std.X measurements for one particular subject and activity 

t.BodyAcc.std.Y		type: dbl

The mean of the t.BodyAcc.std.Y measurements for one particular subject and activity 

t.BodyAcc.std.Z		type: dbl

The mean of the t.BodyAcc.std.Z measurements for one particular subject and activity 

## Additional comments on data 
The dataset contains in total 86 variables describing the average for one subject and activity of a measurement provided in the original dataset, plus 2 variables describing the subject and activity. Here, I have only described the first 6 variables of these 86. The remaining 80 follow the same principle. The manipulated dataset only includes measurements relating to a mean or standard deviation value (such as the t.BodyAcc.mean.X or the t.BodyAcc.std.X). Measurements not relating to a mean or std have been excluded. 

