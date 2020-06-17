CODEBOOK - UCI HAR DATASET

This dataset contains all of the data in the UCI train and test sets, available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Train and test sets have been merged, and mean and std values extracted.
Averages have then been calculated for each variable for user and activity type.
Various parameters are presented for each subject during six different activity types.

VARIABLES:

Subject.ID:
  Id number of each of 30 subjects.
  
Activity:
  Activity type of subject during test:
    LAYING
    SITTING
    STANDING
    WALKING
    WALKING_DOWNSTAIRS
    WALKING_STAIRS
    
Remaining variables:
  Averaged values over a plurality of observations for each subject and 
  each activity type. Column heading indicate different parameters related to a single subject and activity type. The following indicates what each segment of a column heading means:
    Time.Domain/Frequency.Domain - whether the value is in Time/Frequency domain
    Body/Gravity - whether the acceleration measured is due to body movement of gravity
    Gyroscope/Accelerometer - the device used to measure the acceleration. 
    XYZ - indicates axis of measurement
    Mean/StandardDeviation - whether it is the mean or standard deviation value. 
    Jerk - indicates that the signal is a jerk signal, calculated from linear acceleration and angular velocity
    Magnitude - indicates the magnitude of 3D signals calculated using Euclidean norm. 
    