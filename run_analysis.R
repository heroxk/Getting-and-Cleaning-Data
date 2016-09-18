library(plyr)

setwd("/home/kaixi/R/data/UCI HAR Dataset")

# 1. Merge the training and the test sets to create one data set.
# Load files and merge the training and test sets
test_data <- read.table("test/X_test.txt")
train_data <- read.table("train/X_train.txt")
all_data<-rbind(test_data,train_data)

# Load files and merge the training and test subject sets
test_subject <- read.table("test/subject_test.txt")
train_subject <- read.table("train/subject_train.txt")
subject_data <- rbind(test_subject,train_subject)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# Load the feature data and extract the attribute with mean and standard deviation
features <- read.table("features.txt")
mean_std_index <- grep('mean\\(\\)|std\\(\\)',features[[2]])
mean_std_data <- all_data[,mean_std_index]

# 3. Use descriptive activity names to name the activities in the data set
# Load the activity data sets, merge and replace the indics with names
activity_data <- rbind(read.table("test/y_test.txt"),read.table("train/y_train.txt"))
activity_list <- read.table("activity_labels.txt")
activity_data[, 1] <- activity_list[activity_data[, 1], 2]

# 4. Appropriately labels the data set with descriptive variable names.
# Give the meaningful column names
names(mean_std_data) <- features[mean_std_index, 2]
names(activity_data) <- "activity"
names(subject_data ) <- "subject"
names(mean_std_data)<-gsub("-","",names(mean_std_data))
names(mean_std_data)<-gsub("[Mm]ean","Mean",names(mean_std_data))
names(mean_std_data)<-gsub("[Ss]td","Std",names(mean_std_data))
names(mean_std_data)<-gsub("\\(\\)","",names(mean_std_data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Combine subject data, activity data and signal data(mean and standard deviation)
all_mean_std_data <- cbind(subject_data,activity_data,mean_std_data)

# Calculate the mean group by subject and activity
num_colume <- as.numeric(dim(all_mean_std_data)[2])
all_mean_std_data_avg <- ddply(all_mean_std_data, .(subject, activity), function(x) colMeans(x[, 3:num_colume]))

# Export data to a text file
write.table(all_mean_std_data_avg, "all_mean_std_data_avg.txt", row.name=FALSE)

