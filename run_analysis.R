# Load required packages
library(plyr)

# Set working directory
setwd("Your working directory path goes here");

# Get data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
zipFileName <- "UCI HAR dataset.zip";

# Download file if it does not exist
if(!file.exists(zipFileName))
{
  download.file(fileURL, zipFileName)
}

# Unzip zip file
if(!file.exists("UCI HAR Dataset"))
{
  unzip(file)
}

# Set file names
activity_labels_fileName = "activity_labels.txt"
features_fileName = "features.txt"
X_train_fileName = "./train/X_train.txt"
y_train_fileName = "./train/y_train.txt"
subject_train_fileName = "./train/subject_train.txt"
X_test_fileName = "./test/X_test.txt"
y_test_fileName = "./test/y_test.txt"
subject_test_fileName = "./test/subject_test.txt"

setwd("./UCI HAR Dataset");

# Load files into R
activity_labels = read.table(activity_labels_fileName)
features = read.table(features_fileName)
X_train = read.table(X_train_fileName)
y_train = read.table(y_train_fileName)
subject_train = read.table(subject_train_fileName)
X_test = read.table(X_test_fileName)
y_test = read.table(y_test_fileName)
subject_test = read.table(subject_test_fileName)

# 4. Appropriately label the data set with descriptive variable names.
names(X_test) = features$V2;
names(X_train) = features$V2;

# Concatenate y and activity
y_test_activity =  join(y_test,activity_labels);
y_train_activity = join(y_train,activity_labels);

# Rename columns in y_*_activity
names(y_test_activity)[names(y_test_activity)=="V1"] <- "ID"
names(y_train_activity)[names(y_train_activity)=="V1"] <- "ID"
names(y_test_activity)[names(y_test_activity)=="V2"] <- "activity"
names(y_train_activity)[names(y_train_activity)=="V2"] <- "activity"

# 3. Use descriptive activity names to name the activities in the data set
X_test_activity = cbind(y_test_activity$activity,X_test)
X_train_activity = cbind(y_train_activity$activity,X_train)

# Concatenate x and subject
X_test_activity_subject = cbind(subject_test,X_test_activity)
X_train_activity_subject = cbind(subject_train,X_train_activity)
names(X_test_activity_subject)[names(X_test_activity_subject)=="y_test_activity$activity"] <- "activity"
names(X_train_activity_subject)[names(X_train_activity_subject)=="y_train_activity$activity"] <- "activity"

# Rename subject column
names(X_test_activity_subject)[names(X_test_activity_subject)=="V1"] <- "subject"
names(X_train_activity_subject)[names(X_train_activity_subject)=="V1"] <- "subject"

# Vertically bind final dataframes
tidy_data = rbind(X_test_activity_subject,X_train_activity_subject)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
indMeanCols = grep("mean", colnames(tidy_data))
indStdDevCols = grep("std", colnames(tidy_data))
indDescriptiveCols = 1:2;
indMeanAndStdDev = sort.int(c(indDescriptiveCols,indMeanCols,indStdDevCols))
colnames(tidy_data)[indMeanAndStdDev]

tidy_data = tidy_data[1:dim(tidy_data)[1],indMeanAndStdDev]

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data_2 = tidy_data[1,1:dim(tidy_data)[2]];
n = 0;
for (k in 1:max(tidy_data$subject))
{
  for (l in 1:max(activity_labels$V1))
  {
    n = n + 1;
    indSubject = tidy_data$subject == k;
    indActivity = tidy_data$activity == activity_labels$V2[l];
    
    tidy_data_2[n,3:dim(tidy_data_2)[2]] = colMeans(tidy_data[indSubject & indActivity,3:dim(tidy_data)[2]])
    tidy_data_2$subject[n] = k;
    tidy_data_2$activity[n] = activity_labels$V2[l];
  }
}

# Alternative method using plyr
tidy_data_2_plyr <- ddply(tidy_data, .(subject, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

# Write data as .txt
write.table(tidy_data_2,row.name=FALSE,file="tidy_data.txt")






