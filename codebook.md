Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, data, and any transformations and performed work towards clean up the given data.  
Data was loaded from the following site: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The run_analysis.R script performs the following steps to clean the data:   
 1. Lines 2-4: reads X_train.txt, y_train.txt and subject_train.txt from the "./train" folder.
 2. Line 5: reads features' names from the "features.txt" file.
 3. Line 6: assign x_train features names.
 4. Line 7: extract all the features from x_train that contain the word "mean" into a data frame called "means".
 5. Line 8: extract all the features from x_train that contain the word "stds" into a data frame called "stds".
 6. Line 9: binding columns from 4 datasets: subject numbers (train participants), means, stds and y_train into a new data set called "train".
 7. Lines 11-18: perform the same operation as in steps 1-6 to the test data (switch the word train with test on each step).
 8. Line 20: merge rows from train and test datasets, stored in "data".
 9. Lines 21-23: switch activity numbers with activity names.
 10. Line 24: Creates a second, independent tidy data set with the average of each variable for each activity and each subject, stores it into "agg".  
 11. Line 25: Write agg to a file called "agg.txt".

 