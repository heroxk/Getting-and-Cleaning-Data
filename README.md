Getting and Cleaning Data Project
==========================================

This is the Repo for the Coursera's "Getting and Cleaning Data" Course Project.

The following data set has been used:

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Instructions

`run_analysis.R` is the R script which extracts the mean and std data, performs cleanup and exports to another dataset file called `all_mean_std_data_avg.txt`. To run the script, make sure it sit in the same folder as the un-compressed data set.

The additional information about the variables, data and transformations can be found in the file `CodeBook.md`.

## What Does the Script Do?
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


