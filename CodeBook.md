# Overview

This code book describes the data found in the all_data.csv and mean_data.csv files. The all_data.cvs contains all of the measures for the data set while the mean_data.cv contains the mean values for each subject/activity value. The data was cleaned using the run_analysis.R script against original data collected from volunteer subjects performing various activities with a Samsung Galaxy S II devise (see UCI_HAR_Datasert/README.txt for more information about the input data).

# Data

The following is a description of the data sets 

1. all_data.csv - combined train and test data from original set
2. mean_data.cv - mean values for each variable grouped by subject and activity

Variable names have been modified from the original data set to be more descriptive and to remove special characters.

# Variables

1. subject - the volunteer subject identified as 1 to 30
2. activity - the activity being performed when measurements where taken
3. all others - mean and standard deviation measures renamed from original data set (see UCI_HAR_Dataset/features_info.txt for detailed description of measures)

# Transformations

1. Both train and test data sets were combined
2. X, y and subject files combined for each data
3. Activity (y) values transformed from number to descriptive label
4. Measure labels were modified to be more readable and to remove special characters
5. Measures that were not mean or standard deviation values were removed
6. Mean values for each subject/activity combination were calculated

The results for steps 1-4 were written to all_data.csv while the results for step 5 were written to mean_data.cv.

# Original Data Source

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

