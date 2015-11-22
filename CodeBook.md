# CodeBook.MD file
John C. McDavid, 11/22/2015

Summary Analysis of Data recording Human Activity Using Smartphones Dataset (Version 1.0)

This is the CodeBook for teh summary analysis performed on the data.  This will describe the variables, data, transformations and processing of the work done.  See also the README.md file for companion information.

Overview of data and data processing (and transformations).
See the README.md file for a descriprion of teh experiment.
The datasets provided had separate training and test data. The training datasets had 7352 observations and the test datsets had 2947 observations. For each of teh training and test datasets, there were 3 files: 1. a file containing 561 features (data measurement variables), 2. a file indicating subject number (30), and 3. a file indicating activity (6) for each observation.
The six activities were walking, walking upstairs, walking downstairs, sitting, standing, laying.
The training datasets were column combined; similarly for the test datasets
The training and test datasets were combined by rows into one master dataset.
Only 66 certain features were selected for analysis.  These were the all the mean and standard deviation variables (33 each). Other measurement variables taht had mean and stad dev in their name were not selected because those are differnet measuremnet variable, although of similar type.
The master dataset was reduced to the 66 features of interest.
The master dataset was looped through to find the averages of all the observations of each feature (66) by subject (30) and activity (6).
  Although this looping could be done more efficiently code-wise by teh apply and dplyr functions, for expediency I went through the more laborious manual looping and calculation methods in the interest of time and avoiding incorrectly using the functions (I will later go and reapply more efficient functions, with checking).
The resulting data was put into a tidy data that had Subject (30), Activity (6 for each subject), and average for each selected feature (for each of subject x activity).

The tidy data set is Signals.

Data - master data set ("master","master2")
  Measurement units of data
     "t" prefix idicates time domain signal at constant rate of 50 Hz
     "f" prefix indicates frequency domain signals
     >> the data are normalized from raw data and bounded by [-1,1] so the data in the datasets is dimensionless
There are 69 columns:  66 feature variables, "Subject ID", "Acitivty Number", and "Activity Label"
Subject ID - subject # (1-30)
Activity Number - numerical code of activity performed (1-6), see above
Activity Label - label of activity code performed (six identifiers, see text above)
The 66 features are listed below.  The descriptions are coded by what the measurement is for.  I will describe how to decode the feature labels rather than repeating similar language for all 66.
mean() - mean value of teh signal
std() - standard dev of the signal
Acc - accerometer reading of signal
Gyro - gyuroscope reading of signal
t - measurement in time domain
f - frequency domain signals
X, Y, Z - three linear vectors of space (axial signals)
Mag - magnitude
Jerk - derived in time from body linear acceleraion and angular velocity
Body - body movement
Gravity - Gravity component
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"
"Subject ID"
"Activity NUm"
"Activity Label"

Data - tidy data set ("Signals")
measurement units - see description above (same as for master datasets)
see above also for description of how labels are derived
The variables in this dataset are Averages of all observation for that subject #, activity description, and feature so those varaible names are pre-pended by "Avg."
Variable names follow:
"Subject ID"
"Activity Label"
"Avg.tBodyAcc-mean()-X"
"Avg.tBodyAcc-mean()-Y"
"Avg.tBodyAcc-mean()-Z"
"Avg.tBodyAcc-std()-X"
"Avg.tBodyAcc-std()-Y"
"Avg.tBodyAcc-std()-Z"
"Avg.tGravityAcc-mean()-X"
"Avg.tGravityAcc-mean()-Y"
"Avg.tGravityAcc-mean()-Z"
"Avg.tGravityAcc-std()-X"
"Avg.tGravityAcc-std()-Y"
"Avg.tGravityAcc-std()-Z"
"Avg.tBodyAccJerk-mean()-X"
"Avg.tBodyAccJerk-mean()-Y"
"Avg.tBodyAccJerk-mean()-Z"
"Avg.tBodyAccJerk-std()-X"
"Avg.tBodyAccJerk-std()-Y"
"Avg.tBodyAccJerk-std()-Z"
"Avg.tBodyGyro-mean()-X"
"Avg.tBodyGyro-mean()-Y"
"Avg.tBodyGyro-mean()-Z"
"Avg.tBodyGyro-std()-X"
"Avg.tBodyGyro-std()-Y"
"Avg.tBodyGyro-std()-Z"
"Avg.tBodyGyroJerk-mean()-X"
"Avg.tBodyGyroJerk-mean()-Y"
"Avg.tBodyGyroJerk-mean()-Z"
"Avg.tBodyGyroJerk-std()-X"
"Avg.tBodyGyroJerk-std()-Y"
"Avg.tBodyGyroJerk-std()-Z"
"Avg.tBodyAccMag-mean()"
"Avg.tBodyAccMag-std()"
"Avg.tGravityAccMag-mean()"
"Avg.tGravityAccMag-std()"
"Avg.tBodyAccJerkMag-mean()"
"Avg.tBodyAccJerkMag-std()"
"Avg.tBodyGyroMag-mean()"
"Avg.tBodyGyroMag-std()"
"Avg.tBodyGyroJerkMag-mean()"
"Avg.tBodyGyroJerkMag-std()"
"Avg.fBodyAcc-mean()-X"
"Avg.fBodyAcc-mean()-Y"
"Avg.fBodyAcc-mean()-Z"
"Avg.fBodyAcc-std()-X"
"Avg.fBodyAcc-std()-Y"
"Avg.fBodyAcc-std()-Z"
"Avg.fBodyAccJerk-mean()-X"
"Avg.fBodyAccJerk-mean()-Y"
"Avg.fBodyAccJerk-mean()-Z"
"Avg.fBodyAccJerk-std()-X"
"Avg.fBodyAccJerk-std()-Y"
"Avg.fBodyAccJerk-std()-Z"
"Avg.fBodyGyro-mean()-X"
"Avg.fBodyGyro-mean()-Y"
"Avg.fBodyGyro-mean()-Z"
"Avg.fBodyGyro-std()-X"
"Avg.fBodyGyro-std()-Y"
"Avg.fBodyGyro-std()-Z"
"Avg.fBodyAccMag-mean()"
"Avg.fBodyAccMag-std()"
"Avg.fBodyBodyAccJerkMag-mean()"
"Avg.fBodyBodyAccJerkMag-std()"
"Avg.fBodyBodyGyroMag-mean()"
"Avg.fBodyBodyGyroMag-std()"
"Avg.fBodyBodyGyroJerkMag-mean()"
"Avg.fBodyBodyGyroJerkMag-std()"
