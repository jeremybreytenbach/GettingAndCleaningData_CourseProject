---
title: "CodeBook"
author: "JS Breytenbach"
date: "26 July 2015"
output: html_document
---

## Project Description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

##Study design and data processing

###Collection of the raw data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Notes on the original (raw) data 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:<br/>
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.<br/>
- Triaxial Angular velocity from the gyroscope. <br/>
- A 561-feature vector with time and frequency domain variables. <br/>
- Its activity label. <br/>
- An identifier of the subject who carried out the experiment.<br/>

The dataset includes the following files:<br/>
- 'README.txt'<br/>
- 'features_info.txt': Shows information about the variables used on the feature vector.<br/>
- 'features.txt': List of all features.<br/>
- 'activity_labels.txt': Links the class labels with their activity name.<br/>
- 'train/X_train.txt': Training set.<br/>
- 'train/y_train.txt': Training labels.<br/>
- 'test/X_test.txt': Test set.<br/>
- 'test/y_test.txt': Test labels.<br/>

The following files are available for the train and test data. Their descriptions are equivalent. <br/>
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. <br/>
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. <br/>
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. <br/>
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. <br/>

Notes: <br/>
- Features are normalized and bounded within [-1,1].<br/>
- Each feature vector is a row on the text file.<br/>

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

##Creating the tidy datafile

###Guide to create the tidy data file
The following steps are followed in the analysis:<br/>
1. Load required packages and set working directory<br/>
2. Download file if it does not exist<br/>
3. Unzip zip file<br/>
4. Set file names<br/>
5. Load files into R<br/>
6. Appropriately label the data set with descriptive variable names<br/>
7. Merge y data and activity<br/>
8. Rename columns appropriately<br/>
9. Use descriptive activity names to name the activities in the data set<br/>
10. Concatenate x data and subject<br/>
11. Rename columns appropriately<br/>
12. Vertically bind all data<br/>
13. Extract the measurements on the mean and standard deviation for each measurement<br/>
14. Create a second, independent tidy data set with the average of each variable for each activity and each <br/>
15. Write data as .txt<br/>

##Description of the variables in the output
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.<br/>
<br/>
tBodyAcc-XYZ<br/>
tGravityAcc-XYZ<br/>
tBodyAccJerk-XYZ<br/>
tBodyGyro-XYZ<br/>
tBodyGyroJerk-XYZ<br/>
tBodyAccMag<br/>
tGravityAccMag<br/>
tBodyAccJerkMag<br/>
tBodyGyroMag<br/>
tBodyGyroJerkMag<br/>
fBodyAcc-XYZ<br/>
fBodyAccJerk-XYZ<br/>
fBodyGyro-XYZ<br/>
fBodyAccMag<br/>
fBodyAccJerkMag<br/>
fBodyGyroMag<br/>
fBodyGyroJerkMag<br/>

The set of variables that were estimated from these signals are:

mean(): Mean value<br/>
std(): Standard deviation<br/>
meanFreq(): Weighted average of the frequency components to obtain a mean frequency<br/>

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean<br/>
tBodyAccMean<br/>
tBodyAccJerkMean<br/>
tBodyGyroMean<br/>
tBodyGyroJerkMean<br/>
