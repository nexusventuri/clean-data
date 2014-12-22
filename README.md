clean-data
==========

The purpose of this project is to clean data from a dataset extracted from a Samsung Galaxy S smartphone. 


The code execute the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


How to execut the code:
=======================

Download the sample data from here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

Extract it in the current r working directory. Please not the "UCI HAR Dataset/" needs to be present for the script to run succesfully.

And run on the R console the command source("PATH_TO_RUN_ANALYSYS") where PATH_TO_RUN_ANALYSYS is the location of the run_analysis.R script.

The code will merge the data in the test and the train folders and will create as a result a clean.txt file.


Codebook
========

clean_data is the main function and is executed at the end of the script.

It first load the list of column names from the features.txt 

It will then load all the data in the test and train folders, and save them in the test and train tables adding information about the column names.
The script then merges the two tables (which contain the activity and subject columns).
labels the activity column converting it from a numeric column to a factor column.
The script then extract all the meaningful columns (mean, std, activity and subject).
And then calculates the average for each activity and each subject using the aggregate function

Ends writing the result to a text file.




