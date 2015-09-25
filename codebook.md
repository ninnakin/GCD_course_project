# Description of the mean.measurements file created for the Getting and Cleaning Data course. 
Ninnakin
25 Sep 2015

The mean.measurements file lists the average for each subject and 
activity for each measurement relating to a mean or standard deviation value 
from the Human Activity Using Smartphones Dataset. 

Source of the original data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Description of manipulated data:
subject			      int

The id of the subject performing the experiment 

activity		      char

The activity performed while the measurements were collected (standing, laying, sitting, walking, walking_downstair, walking_upstairs)

t.BodyAcc.mean.X	dbl

The mean of the t.BodyAcc.mean.X measurements for one particular subject and activity 

t.BodyAcc.mean.Y	dbl

The mean of the t.BodyAcc.mean.Y measurements for one particular subject and activity 

t.BodyAcc.mean.Z	dbl
The mean of the t.BodyAcc.mean.Z measurements for one particular subject and activity 

t.BodyAcc.std.X		dbl

The mean of the t.BodyAcc.std.X measurements for one particular subject and activity 

t.BodyAcc.std.Y		dbl

The mean of the t.BodyAcc.std.Y measurements for one particular subject and activity 

t.BodyAcc.std.Z		dbl

The mean of the t.BodyAcc.std.Z measurements for one particular subject and activity 

## Additional comments on data 
The dataset contains in total 86 variables describing the average for one subject and activity of a measurement provided in the original dataset. The manipulated dataset only includes measurements relating to a mean or standard 
