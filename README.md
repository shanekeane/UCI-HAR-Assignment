There is only one script: run_analysis.R
This must be run in the same folder as the UCI HAR Dataset, which can be downloaded from here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data for the project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The above dataset is divided into test and train sets. Running run_analysis.R does
the following:
1. Merges training and test sets to create one data set
2. Extracts mean and standard deviation for each measurement
3. Uses descriptive names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set
6. Saves the independent tidy data set in tidy_UCI_HAR.txt

The following packages should be installed:
dplyr