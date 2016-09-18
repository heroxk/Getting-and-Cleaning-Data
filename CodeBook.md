# Data Set information

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


# Attribute Information
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.


# Implementation
Step 1. Merge the training and test sets (`X_test.txt` and `X_train.txt`) to create one data set (`all_data`) using `rbind()`.
Step 2. Load the `features.txt`, search and extract the terms which contains 'mean()'' and 'std()'. Once get the indecis of the terms, extract the subset of `all_data` and store in `mean_std_data`.
Step 3. Activity data (`y_test.txt` and `y_train.txt`) is combined to become `activity_data` data set using `rbind()`. However, in `activity_data` data set, the activities are represented using the number 1 to 6. We load the activity description file `activity_labels.txt` and use replace the numbers in `activity_data` with descriptions.
Step 4. Give the meaningful column names
Step 5. We generate a new dataset with all the average measures for each subject and activity type and dump data to `all_mean_std_data_avg.txt`.


# Variables
`x_train`, `y_train`, `x_test`, `y_test`, `subject_train`, `subject_test` and `feature` contain the data from the original files. `all_data` and `subject` are merged dataset which has all signaling data and subject data respectively. `mean_std_data` is the subset of `all_data` with only mean and std data. `activity_data` contains all activity records of each subject. `all_mean_std_data` is combination of `subject_data`,`activity_data` and `mean_std_data`. `all_mean_std_data_avg` has all relevant averages grouped by different subjects and activities.
