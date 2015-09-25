# Getting and Cleaning Data, Course Project
This repo contains my code for the course project of the Getting and Cleaning Data course

Ninnakin 25 September 2015

## The task 
The aim of the work done in this project is to practice and demonstrate the ability to collect, work with, and clean a data set. For this purpose, the Human Activity Recognition Using Smartphones Dataset is used and manipulated.

## The original data 

The data used represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The original data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

And a description of the data can be found here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Input 


## Output 
The tidy dataset mean.measurements containing 190 measurements for 88 variables
mean.measurements is closer described in codebook.md 

## run_analysis.R
This repo cotains the file run_analysis.R which will take several files from the Human Activity Recognition Using Smartphones Dataset and return a dataset containing the average values of a number of the original variables. Running the file will perform the following steps: 

- Loads required libraries (this script uses the data.table, plyr and dplyr packages)
- Reads the data from the Human Activity Recognition Using Smartphones Dataset
- Merges the test and training datasets 
- Extracts only those measurements including 'mean' or 'std' in the variable name  
- Uses the activity.labels file to provide descriptiove labels for the activities in the dataset
- Labels the columns with descriptive names using the features.txt file
- Creates an independent tidy dataset containing the means of the measurements from the original dataset and store this in mean.measurements 






