---
title: "README"
author: "JS Breytenbach"
date: "26 July 2015"
output: html_document
---

#Getting and Cleaning Data - Course Project

##Contents
The following files are included in this repository:<br/>
1. run_analysis.R<br/>
2. README.md<br/>
3. CodeBook.md<br/>

##Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The script "run_analysis.R" performs the following tasks:<br/>
1. Merges the training and the test sets to create one data set.<br/>
2. Extracts only the measurements on the mean and standard deviation for each measurement. <br/>
3. Uses descriptive activity names to name the activities in the data set<br/>
4. Appropriately labels the data set with descriptive variable names. <br/>
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Assumptions and setup
The scripts assumes a working, up to date version of R and Rstudio running on a Windows Operating System.
The user is expected to modify line 5 to correctly set up his/her own working directory as desired.

##Required packages
1. plyr

##Running the analysis
To run the analysis simply source and run the script "run_analysis.R"

##Output
The output from this analysis will be saved as a .txt file in the working directory under the name "tidy_data.txt"

##Further reading:
For further information on the script contents and the variables, data please see CodeBook.md along side this README.md
