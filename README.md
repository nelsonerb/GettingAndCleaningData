# Overview

This project fulfills the requirements for the Coursera Getting and Cleaning
course. The purpose of this project is to ‘tidy’ input data to support further
analysis. Input files combined and cleaned using the run_analysis.R script. Only means and standard deviation measures are kept from the original data set. 

# Running the project

The analysis was run by loading the ‘run_analysis.R’ script in R Studio and then executing the run_analysis function from the current directory.

# List of Files and Directories

1. Root Directory
  * run_analysis.R main r program file script for project
  * all_data.csv tidy data file with all relevant data points
  * mean_data.csv summary data file with means for each subject/activity combination 
1. UCI_HAR_dataset - root directory for raw data set
  * activity_labels.txt text description of activity labels
  * feature_info.txt background information on feature data points
  * features.txt input file with all feature labels
  * README.txt read me file for original data set
2. UCI_HAR_dataset/train - training data
  * subject_test.txt input file for train subjects
  * X_test.txt input file for train measures
  * y_test input file for train activities
3. UCI_HAR_dataset/test - test data
  * subject_test.txt input file for test subjects
  * X_test.txt input file for test measures
  * y_test input file for test activities

# Original Data Source

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip