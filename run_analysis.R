##This script should be in the same folder as 'UCI HAR Dataset" 
##It parses the content of 'UCI HAR Dataset' to do the following:
## 1. Merge training and test sets to create one data set
## 2. Extract mean and standard deviation for each measurement
## 3. Use descriptive names to name the activities in the data set
## 4. Appropriately label the data set with descriptive variable names
## 5. From the data set in step 4, create a second, independent tidy data set
##    with the average of each variable for each activity and each subject. 

library(dplyr)

#Steps 1 and 2: Merge training and test sets and extract mean and std
##Get columns with mean or std in name
labels_df <- read.table("UCI HAR Dataset/features.txt")
labels <- labels_df$V2
mean_std_indices <- grep("mean\\(|std\\(", labels)

##Indicate vector to pass to colClasses in read.table, NULL values not loaded
cc <- rep('NULL', length(labels))
cc[mean_std_indices] <- 'numeric'

##Load and merge data sets
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = cc)
train_set <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses = cc)
merged_set <- rbind(train_set, test_set)
names_merged <- labels[mean_std_indices] #get column names
names(merged_set) <- names_merged #add column names

##Append subject id and activity to data frame
###get subject id
subject_id_train <- read.table("UCI HAR Dataset/train/subject_train.txt",
                               col.names = 'Subject.ID')
subject_id_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                              col.names = 'Subject.ID')
subject_id <- rbind(subject_id_train, subject_id_test)

###get activity ID
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                             col.names = 'Activity')
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                             col.names = 'Activity')
activity <- rbind(activity_train, activity_test)

###Add columns to data frame
merged_set <- cbind(subject_id, activity, merged_set)

#Step 3: Use descriptive names to name the activities in the data set
activity_dict <- read.table("UCI HAR Dataset/activity_labels.txt")
for (i in 1:6) {
  merged_set$Activity <- gsub(as.character(i), activity_dict$V2[i], merged_set$Activity)
}
#more comments
#Step 4: Appropriately label the data set with descriptive variable names
names(merged_set) <- sub("^t", "Time.Domain.", names(merged_set))
names(merged_set) <- sub("^f", "Frequency.Domain.", names(merged_set))
names(merged_set) <- sub("Gyro", "Gyroscope", names(merged_set))
names(merged_set) <- sub("Acc", "Accelerometer", names(merged_set))
names(merged_set) <- sub("Mag", ".Magnitude", names(merged_set))
names(merged_set) <- sub("-std\\(\\)", ".StandardDeviation", names(merged_set))
names(merged_set) <- sub("-mean\\(\\)", ".Mean", names(merged_set))
names(merged_set) <- sub("BodyBody", "Body", names(merged_set))

#Step 5: From the data set in step 4, create a second, independent tidy data set
#        with the average of each variable for each activity and each subject. 
averaged_set <- group_by(merged_set, Subject.ID, Activity) %>%
                         summarize_all(mean)
write.table(averaged_set, "tidy_UCI_HAR.txt", row.name = FALSE)