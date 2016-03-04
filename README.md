---
title: "EXERCISE ABOUT PROCESSING TRAINING DATA ABOUT HUMAN ACTIVITY RECOGNITION"
author: "Henry Diosa"
date: "March 4, 2016"
output: pdf_document
---
This document describe step by step the data processing of Human Activity Recognition data sets until to obtain tidy data in accordance to course project about Getting and Cleaning Data. 

#Initially. Load libraries required

```{r}
library(dplyr)
library(data.table)
library(stringr)
```

## Processing categorical variables about activities

###Read data of activity labels.
```{r}
activities <- read.table("./activity_labels.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Put descriptive headers to columns.
```{r}
activities <- rename(activities,ActivityCode = V1 , ActivityName = V2)
```
#PROCESSING TRAINING DATA SET 

##Processing HAR Train Variables.

### Read data of training dataset and load in data table named:harDataTrain1.
```{r}
harDataTrain1 <- read.table("./train/X_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
### Obtain the names of variables. 
```{r}
dfNames <- read.table("./features.txt",sep="",header=FALSE,na.strings=TRUE)
cnames <- dfNames$V2
```

###Put the 561 column names in harDataTrain1.
```{r}
names(harDataTrain1) <- make.names(cnames,unique=TRUE,allow_=TRUE)
```
###Convert harDataTrain1 to data.frame type 
```{r}
harDataTrain1 <- as.data.frame(harDataTrain1)
```
## Processing Subject Variables

###Read data about subjects of training.
```{r}
subjecTrain <- read.table("./train/subject_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Putting descriptive header to column.
```{r}
subjecTrain <- rename(subjecTrain,SubjectCode = V1)
```
###Convert subjectTrain to data.table type 
```{r}
subjecTrain <- as.data.frame(subjecTrain)
```
##Processing variables about activities

###Read data about activities per subject during training.
```{r}
activiTrain <- read.table("./train/y_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Put descriptive header to column V1.
```{r}
activiTrain <- rename(activiTrain,ActivityCode = V1)
```
###Convert activiTrain to data.frame type 
```{r}
activiTrain <- as.data.frame(activiTrain)
```
##Processing variables about inertial signals. Only add one column that represents average value of each vector. Then, this column will be added to data set of training.

###To obtain means of body acceleration in X,Y,Z

####Read data about body acceleration in X axis
```{r}
ISBodyAccXTrain <- read.table("./train/Inertial Signals/body_acc_x_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyAcc.mean..X" column 
```{r}
ISBodyAccXTrain <- mutate(ISBodyAccXTrain,BodyAcc.mean..X = rowMeans(ISBodyAccXTrain))
```
####Read data about body acceleration in Y axis
```{r}
ISBodyAccYTrain <- read.table("./train/Inertial Signals/body_acc_y_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Put the new "BodyAcc.mean..Y" column 
```{r}
ISBodyAccYTrain <- mutate(ISBodyAccYTrain,BodyAcc.mean..Y = rowMeans(ISBodyAccYTrain))
```
####Read data about body acceleration in Z axis
```{r}
ISBodyAccZTrain <- read.table("./train/Inertial Signals/body_acc_z_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyAcc.mean..Z" column 
```{r}
ISBodyAccZTrain <- mutate(ISBodyAccZTrain,BodyAcc.mean..Z = rowMeans(ISBodyAccZTrain))
```
### To obtain means of total acceleration in X,Y,Z

####Read data about total acceleration in X axis
```{r}
ISTotalAccXTrain <- read.table("./train/Inertial Signals/total_acc_x_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "TotalAcc.mean..X" column 
```{r}
ISTotalAccXTrain <- mutate(ISTotalAccXTrain,TotalAcc.mean..X = rowMeans(ISTotalAccXTrain))
```
####Read data about total acceleration in Y axis
```{r}
ISTotalAccYTrain <- read.table("./train/Inertial Signals/total_acc_y_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "TotalAcc.mean..Y" column 
```{r}
ISTotalAccYTrain <- mutate(ISTotalAccYTrain,TotalAcc.mean..Y = rowMeans(ISTotalAccYTrain))
```
####Read data about total acceleration in Z axis
```{r}
ISTotalAccZTrain <- read.table("./train/Inertial Signals/total_acc_z_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "TotalAcc.mean..Z" column 
```{r}
ISTotalAccZTrain <- mutate(ISTotalAccZTrain,TotalAcc.mean..Z = rowMeans(ISTotalAccZTrain))
```
### To obtain means of body_gyro in X,Y,Z

####Read data about body_gyro in X axis
```{r}
ISBodyGyroXTrain <- read.table("./train/Inertial Signals/body_gyro_x_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyGyro.mean..X" column 
```{r}
ISBodyGyroXTrain <- mutate(ISBodyGyroXTrain,BodyGyro.mean..X = rowMeans(ISBodyGyroXTrain))
```
####Read data about body_gyro in Y axis
```{r}
ISBodyGyroYTrain <- read.table("./train/Inertial Signals/body_gyro_y_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyGyro.mean..Y" column 
```{r}
ISBodyGyroYTrain <- mutate(ISBodyGyroYTrain,BodyGyro.mean..Y = rowMeans(ISBodyGyroYTrain))
```
####Read data about body_gyro in Z axis
```{r}
ISBodyGyroZTrain <- read.table("./train/Inertial Signals/body_gyro_z_train.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyGyro.mean..Y" column 
```{r}
ISBodyGyroZTrain <- mutate(ISBodyGyroZTrain,BodyGyro.mean..Z = rowMeans(ISBodyGyroZTrain))
```
##Add new columns to training data set

### Add two columns(SubjectCode,ActivityCode) to harDataTrain1 and store in data frame variable named: DataTrainHAR
```{r}
DataTrainHAR <- cbind.data.frame(harDataTrain1,SubjectCode = subjecTrain$SubjectCode,ActivityCode=activiTrain$ActivityCode)
```
###Add new column to DataTrainHAR  whose name is: ActivityName
```{r}
DataTrainHAR <- mutate(DataTrainHAR,ActivityName = activities[DataTrainHAR$ActivityCode,2])
```
###Add mean columns of inertial signals
```{r}
DataTrainHAR <- mutate(DataTrainHAR,BodyAcc.mean..X = ISBodyAccXTrain$BodyAcc.mean..X)
DataTrainHAR <- mutate(DataTrainHAR,BodyAcc.mean..Y = ISBodyAccYTrain$BodyAcc.mean..Y)
DataTrainHAR <- mutate(DataTrainHAR,BodyAcc.mean..Z = ISBodyAccZTrain$BodyAcc.mean..Z)

DataTrainHAR <- mutate(DataTrainHAR,TotalAcc.mean..X = ISTotalAccXTrain$TotalAcc.mean..X)
DataTrainHAR <- mutate(DataTrainHAR,TotalAcc.mean..Y = ISTotalAccYTrain$TotalAcc.mean..Y)
DataTrainHAR <- mutate(DataTrainHAR,TotalAcc.mean..Z = ISTotalAccZTrain$TotalAcc.mean..Z)

DataTrainHAR <- mutate(DataTrainHAR,BodyGyro.mean..X = ISBodyGyroXTrain$BodyGyro.mean..X)
DataTrainHAR <- mutate(DataTrainHAR,BodyGyro.mean..Y = ISBodyGyroYTrain$BodyGyro.mean..Y)
DataTrainHAR <- mutate(DataTrainHAR,BodyGyro.mean..Z = ISBodyGyroZTrain$BodyGyro.mean..Z)
```
# PROCESSING TEST DATA SET

##Processing HAR Test Variables.

### Read data of test dataset and load in data table named:harDataTest1.
```{r}
harDataTest1 <- read.table("./test/X_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Put the 561 column names in harDataTest1.
```{r}
names(harDataTest1) <- make.names(cnames,unique = TRUE,allow_ = TRUE)
```
###Convert harDataTest1 to data.table type 
```{r}
harDataTest1 <- as.data.table(harDataTest1)
```
## Processing Subject Variables

###Read data about subjects of test.
```{r}
subjecTest <- read.table("./test/subject_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Putting descriptive header to column V1.
```{r}
subjecTest <- dplyr::rename(subjecTest,subjectCode=V1)
```
###Convert subjectTest to data.table type 
```{r}
subjecTest <- as.data.table(subjecTest)
```
##Processing variables about activities

###Read data about activities per subject during test.
```{r}
activiTest <- read.table("./test/y_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Put descriptive header to column V1.
```{r}
activiTest <- rename(activiTest,ActivityCode = V1)
```
###Convert activiTest to data.table type 
```{r}
activiTest <- as.data.table(activiTest)
```
##Processing variables about inertial signals. Only add one column that represents average value of each vector. Then, this column will be added to data set of training.

###To obtain means of body acceleration in X,Y,Z

####Read data about body acceleration in X axis
```{r}
ISBodyAccXTest <- read.table("./test/Inertial Signals/body_acc_x_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyAcc.mean..X" column 
```{r}
ISBodyAccXTest <- mutate(ISBodyAccXTest,BodyAcc.mean..X = rowMeans(ISBodyAccXTest))
```
####Read data about body acceleration in Y axis
```{r}
ISBodyAccYTest <- read.table("./test/Inertial Signals/body_acc_y_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
###Put the new "BodyAcc.mean..Y" column 
```{r}
ISBodyAccYTest <- mutate(ISBodyAccYTest,BodyAcc.mean..Y = rowMeans(ISBodyAccYTest))
```
####Read data about body acceleration in Z axis
```{r}
ISBodyAccZTest <- read.table("./test/Inertial Signals/body_acc_z_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyAcc.mean..Z" column 
```{r}
ISBodyAccZTest <- mutate(ISBodyAccZTest,BodyAcc.mean..Z = rowMeans(ISBodyAccZTest))
```
### To obtain means of total acceleration in X,Y,Z

####Read data about total acceleration in X axis
```{r}
ISTotalAccXTest <- read.table("./test/Inertial Signals/total_acc_x_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "TotalAcc.mean..X" column 
```{r}
ISTotalAccXTest <- mutate(ISTotalAccXTest,TotalAcc.mean..X = rowMeans(ISTotalAccXTest))
```
####Read data about total acceleration in Y axis
```{r}
ISTotalAccYTest <- read.table("./test/Inertial Signals/total_acc_y_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "TotalAcc.mean..Y" column
```{r}
ISTotalAccYTest <- mutate(ISTotalAccYTest,TotalAcc.mean..Y = rowMeans(ISTotalAccYTest))
```
####Read data about total acceleration in Z axis
```{r}
ISTotalAccZTest <- read.table("./test/Inertial Signals/total_acc_z_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "TotalAcc.mean..Z" column 
```{r}
ISTotalAccZTest <- mutate(ISTotalAccZTest,TotalAcc.mean..Z = rowMeans(ISTotalAccZTest))
```
### To obtain means of body_gyro in X,Y,Z

####Read data about body_gyro in X axis
```{r}
ISBodyGyroXTest <- read.table("./test/Inertial Signals/body_gyro_x_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyGyro.mean..X" column 
```{r}
ISBodyGyroXTest <- mutate(ISBodyGyroXTest,BodyGyro.mean..X = rowMeans(ISBodyGyroXTest))
```
####Read data about body_gyro in Y axis
```{r}
ISBodyGyroYTest <- read.table("./test/Inertial Signals/body_gyro_y_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyGyro.mean..Y" column 
```{r}
ISBodyGyroYTest <- mutate(ISBodyGyroYTest,BodyGyro.mean..Y = rowMeans(ISBodyGyroYTest))
```
####Read data about body_gyro in Z axis
```{r}
ISBodyGyroZTest <- read.table("./test/Inertial Signals/body_gyro_z_test.txt",sep="",header=FALSE,na.strings=TRUE)
```
####Put the new "BodyGyro.mean..Y" column 
```{r}
ISBodyGyroZTest <- mutate(ISBodyGyroZTest,BodyGyro.mean..Z = rowMeans(ISBodyGyroZTest))
```


## Join harDataTest1,subjectTest and activiTest in one data frame named: DataTestHAR
```{r}
DataTestHAR <- harDataTest1[,SubjectCode:=subjecTest$subjectCode]
DataTestHAR <- harDataTest1[,ActivityCode:=activiTest$ActivityCode]
```

##Add to DataTestHAR a new column whose name is: ActivityName
```{r}
DataTestHAR <- mutate(DataTestHAR,ActivityName = activities[DataTestHAR$ActivityCode,2])
```
###Add mean columns of inertial signals
```{r}
DataTestHAR <- mutate(DataTestHAR,BodyAcc.mean..X = ISBodyAccXTest$BodyAcc.mean..X)
DataTestHAR <- mutate(DataTestHAR,BodyAcc.mean..Y = ISBodyAccYTest$BodyAcc.mean..Y)
DataTestHAR <- mutate(DataTestHAR,BodyAcc.mean..Z = ISBodyAccZTest$BodyAcc.mean..Z)

DataTestHAR <- mutate(DataTestHAR,TotalAcc.mean..X = ISTotalAccXTest$TotalAcc.mean..X)
DataTestHAR <- mutate(DataTestHAR,TotalAcc.mean..Y = ISTotalAccYTest$TotalAcc.mean..Y)
DataTestHAR <- mutate(DataTestHAR,TotalAcc.mean..Z = ISTotalAccZTest$TotalAcc.mean..Z)

DataTestHAR <- mutate(DataTestHAR,BodyGyro.mean..X = ISBodyGyroXTest$BodyGyro.mean..X)
DataTestHAR <- mutate(DataTestHAR,BodyGyro.mean..Y = ISBodyGyroYTest$BodyGyro.mean..Y)
DataTestHAR <- mutate(DataTestHAR,BodyGyro.mean..Z = ISBodyGyroZTest$BodyGyro.mean..Z)
```
## Add ID columns to data sets
```{r}
DataTrainHAR <- mutate(DataTrainHAR, ID = paste0("Train",rownames(DataTrainHAR)))
DataTestHAR <- mutate(DataTestHAR, ID = paste0("Test",rownames(DataTestHAR)))
```
##. 1.Answer: Merge test and training data frames
```{r}
HARmergeTT <- merge(DataTrainHAR,DataTestHAR,all=TRUE)
```
##Cleaning HARmergeTT
```{r}
good <- complete.cases((HARmergeTT))
HARmergeTTClean <- HARmergeTT[good,][1:10299,]
```
###Save to disk the data without NAs
```{r}
save(HARmergeTTClean,file="HARmergeTTClean.RData")
```
## 2. Answer: Obtaining mean and standar deviation columns from HARmergeTTClean for each measurement
```{r}
meanStdColumns <- grep("mean|std", dfNames$V2, value = FALSE)
meanSTD_HARmergeTTClean <- select(HARmergeTTClean,SubjectCode,ActivityName,meanStdColumns)
```
### Save to disk mean and standard deviation columns from HARmergeTTClean
```{r}
save(meanSTD_HARmergeTTClean,file="meanSTD_HARmergeTTClean.RData")
```
### 3. Answer: In the "ActivityName" column of HARmergeTTClean appears names of physical activities for training and test.

### 4. Answer: The new columns in "meanSTD_HARmergeTTClean" data set were labelled with descriptive names. The detailed description can be found in CodeBook.md and complementary explanations can be found in README.md

### 5. Answer : Here I use the libraries "reshape2" and "dplyr"
```{r}
library(reshape2)
```
#### Melt variables "SubjectCode" and "ActivityName"
```{r}
meltData <- melt(meanSTD_HARmergeTTClean,id=c("SubjectCode","ActivityName"))
```
#### Group last variables melted
```{r}
groups <- group_by(meltData,SubjectCode,ActivityName)
```
#### To calculate mean for groups
```{r}
tidyMeanData <- summarize(groups,mean = mean(value))
```
#### Save results to file "tidyMeanDataSubject4Activity"
```{r}
save(tidyMeanData,file="tidyMeanDataSubject4Activity.RData")
```
#END OF EXERCISE






















