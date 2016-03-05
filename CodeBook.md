---
title: "CodeBook.md for Project Course about Getting and Cleaning Data"
author: "Henry Diosa"
date: "March 4, 2016"
output: pdf_document
---

This document describe the new variables that author adds to original data sets of Human Activity Recognition Project(HARP). These additional variables were used to produce a tidy data from raw data about training and test of HARP. The original variables haven't been changed except  two columns were renamed how we will see later.. In consequence, the original files:features.txt,features_info.txt and README.txt are valids. 

The data frame that contains initial tidy data is: "HARmergeTTClean". The new columns( From 562 to 574) are:

[562] "SubjectCode": Number of individual. Range: 1:30. Data sources: "Subject_train.txt", "Subject_test.txt".
[563] "ActivityCode": Code of activity. Range : 1:6.  Data sources: "y_train.txt"", "y_test.txt","activity_labels.txt".                [564] "ActivityName": Name of activity. Corresponds to second column of file: "activity_labels.txt".                       
[565] "BodyAcc.mean..X": Average value(mean) of vector[128 values] that represents measurements registered in "body_acc_x_test.txt" and
"body_acc_y_train.txt" about inertial signals.
[566] "BodyAcc.mean..Y": Average value(mean) of vector[128 values] that represents measurements registered in "body_acc_y_test.txt" and
"body_acc_y_train.txt" about inertial signals.  
[567] "BodyAcc.mean..Z":Average value(mean) of vector[128 values] that represents measurements registered in "body_acc_z_test.txt" and
"body_acc_z_train.txt" about inertial signals.                    
[568] "TotalAcc.mean..X": Average value(mean) of vector[128 values] that represents measurements registered in "total_acc_x_test.txt" and "total_acc_x_train.txt" about inertial signals.                    
[569] "TotalAcc.mean..Y":Average value(mean) of vector[128 values] that represents measurements registered in "total_acc_y_test.txt" and "total_acc_y_train.txt"  about inertial signals.                 
[570] "TotalAcc.mean..Z":Average value(mean) of vector[128 values] that represents measurements registered in "total_acc_z_test.txt" and "total_acc_z_train.txt" about inertial signals.                   
[571] "BodyGyro.mean..X":Average value(mean) of vector[128 values] that represents measurements registered in "body_gyro_x_test.txt" and "body_gyro_x_train.txt" about inertial signals.                  
[572] "BodyGyro.mean..Y": Average value(mean) of vector[128 values] that represents measurements registered in "body_gyro_y_test.txt" and "body_gyro_y_train.txt" about inertial signals.                     
[573] "BodyGyro.mean..Z": Average value(mean) of vector[128 values] that represents measurements registered in "body_gyro_z_test.txt" and "body_gyro_z_train.txt" about inertial signals.                    
[574] "ID" : Identifier to make easiest the merge of data frames.  


For last, tidy data obtained was named: tidyMeanDataHARTT. This data set was stored in file: tidyMeanDataHARTT.txt. Too, I save this data set in other format: tidyMeanDataHARTT.RData. This final data set contains the mean values of activity variable associated to each subject.




