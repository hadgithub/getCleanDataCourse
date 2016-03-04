# EXERCISE ABOUT PROCESSING TRAINING DATA ABOUT HUMAN ACTIVITY RECOGNITION

#Load libraries required

library(dplyr)
library(data.table)
library(stringr)


## Processing categorical variables about activities

###Read data of activity labels.
activities <- read.table("./activity_labels.txt",sep="",header=FALSE,na.strings=TRUE)
###Put descriptive headers to columns.
activities <- rename(activities,ActivityCode = V1 , ActivityName = V2)

##Processing HAR Training Variables.

### Read data of training dataset and load in data table named:harDataTrain1.
harDataTrain1 <- read.table("./train/X_train.txt",sep="",header=FALSE,na.strings=TRUE)
### Obtain the names of variables. 
dfNames <- read.table("./features.txt",sep="",header=FALSE,na.strings=TRUE)
cnames <- dfNames$V2

###Put the 561 column names in harDataTrain1.
names(harDataTrain1) <- make.names(cnames,unique=TRUE,allow_=TRUE)
###Convert harDataTrain1 to data.table type 
harDataTrain1 <- as.data.frame(harDataTrain1)

## Processing Subject Variables

###Read data about subjects of training.
subjecTrain <- read.table("./train/subject_train.txt",sep="",header=FALSE,na.strings=TRUE)
###Putting descriptive header to column.
subjecTrain <- rename(subjecTrain,SubjectCode = V1)
###Convert subjectTrain to data.table type 
subjecTrain <- as.data.frame(subjecTrain)

##Processing variables about activities

###Read data about activities per subject during training.
activiTrain <- read.table("./train/y_train.txt",sep="",header=FALSE,na.strings=TRUE)
###Put descriptive header to column V1.
activiTrain <- rename(activiTrain,ActivityCode = V1)
###Convert activiTrain to data.table type 
activiTrain <- as.data.frame(activiTrain)

##Processing variables about inertial signals. Only add one column that represents average value of each vector. Then, this column will be
## added to data set of training.

###To obtain means of body acceleration in X,Y,Z

####Read data about body acceleration in X axis
ISBodyAccXTrain <- read.table("./train/Inertial Signals/body_acc_x_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyAcc.mean..X" column 
ISBodyAccXTrain <- mutate(ISBodyAccXTrain,BodyAcc.mean..X = rowMeans(ISBodyAccXTrain))

####Read data about body acceleration in Y axis
ISBodyAccYTrain <- read.table("./train/Inertial Signals/body_acc_y_train.txt",sep="",header=FALSE,na.strings=TRUE)
###Put the new "BodyAcc.mean..Y" column 
ISBodyAccYTrain <- mutate(ISBodyAccYTrain,BodyAcc.mean..Y = rowMeans(ISBodyAccYTrain))

####Read data about body acceleration in Z axis
ISBodyAccZTrain <- read.table("./train/Inertial Signals/body_acc_z_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyAcc.mean..Z" column 
ISBodyAccZTrain <- mutate(ISBodyAccZTrain,BodyAcc.mean..Z = rowMeans(ISBodyAccZTrain))

### To obtain means of total acceleration in X,Y,Z

####Read data about total acceleration in X axis
ISTotalAccXTrain <- read.table("./train/Inertial Signals/total_acc_x_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "TotalAcc.mean..X" column 
ISTotalAccXTrain <- mutate(ISTotalAccXTrain,TotalAcc.mean..X = rowMeans(ISTotalAccXTrain))

####Read data about total acceleration in Y axis
ISTotalAccYTrain <- read.table("./train/Inertial Signals/total_acc_y_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "TotalAcc.mean..Y" column 
ISTotalAccYTrain <- mutate(ISTotalAccYTrain,TotalAcc.mean..Y = rowMeans(ISTotalAccYTrain))

####Read data about total acceleration in Z axis
ISTotalAccZTrain <- read.table("./train/Inertial Signals/total_acc_z_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "TotalAcc.mean..Z" column 
ISTotalAccZTrain <- mutate(ISTotalAccZTrain,TotalAcc.mean..Z = rowMeans(ISTotalAccZTrain))

### To obtain means of body_gyro in X,Y,Z

####Read data about body_gyro in X axis
ISBodyGyroXTrain <- read.table("./train/Inertial Signals/body_gyro_x_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyGyro.mean..X" column 
ISBodyGyroXTrain <- mutate(ISBodyGyroXTrain,BodyGyro.mean..X = rowMeans(ISBodyGyroXTrain))

####Read data about body_gyro in Y axis
ISBodyGyroYTrain <- read.table("./train/Inertial Signals/body_gyro_y_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyGyro.mean..Y" column 
ISBodyGyroYTrain <- mutate(ISBodyGyroYTrain,BodyGyro.mean..Y = rowMeans(ISBodyGyroYTrain))

####Read data about body_gyro in Z axis
ISBodyGyroZTrain <- read.table("./train/Inertial Signals/body_gyro_z_train.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyGyro.mean..Y" column 
ISBodyGyroZTrain <- mutate(ISBodyGyroZTrain,BodyGyro.mean..Z = rowMeans(ISBodyGyroZTrain))

##Add new columns to training data set

### Add two columns(SubjectCode,ActivityCode) to harDataTrain1 and store in data frame variable named: DataTrainHAR

DataTrainHAR <- cbind.data.frame(harDataTrain1,SubjectCode = subjecTrain$SubjectCode,ActivityCode=activiTrain$ActivityCode)

###Add to DataTrainHAR a new column whose name is: ActivityName
DataTrainHAR <- mutate(DataTrainHAR,ActivityName = activities[DataTrainHAR$ActivityCode,2])

###Add mean columns of inertial signals
DataTrainHAR <- mutate(DataTrainHAR,BodyAcc.mean..X = ISBodyAccXTrain$BodyAcc.mean..X)
DataTrainHAR <- mutate(DataTrainHAR,BodyAcc.mean..Y = ISBodyAccYTrain$BodyAcc.mean..Y)
DataTrainHAR <- mutate(DataTrainHAR,BodyAcc.mean..Z = ISBodyAccZTrain$BodyAcc.mean..Z)

DataTrainHAR <- mutate(DataTrainHAR,TotalAcc.mean..X = ISTotalAccXTrain$TotalAcc.mean..X)
DataTrainHAR <- mutate(DataTrainHAR,TotalAcc.mean..Y = ISTotalAccYTrain$TotalAcc.mean..Y)
DataTrainHAR <- mutate(DataTrainHAR,TotalAcc.mean..Z = ISTotalAccZTrain$TotalAcc.mean..Z)

DataTrainHAR <- mutate(DataTrainHAR,BodyGyro.mean..X = ISBodyGyroXTrain$BodyGyro.mean..X)
DataTrainHAR <- mutate(DataTrainHAR,BodyGyro.mean..Y = ISBodyGyroYTrain$BodyGyro.mean..Y)
DataTrainHAR <- mutate(DataTrainHAR,BodyGyro.mean..Z = ISBodyGyroZTrain$BodyGyro.mean..Z)

# PROCESSING TEST DATA ABOUT HUMAN ACTIVITY RECOGNITION

##Processing HAR Test Variables.

### Read data of test dataset and load in data table named:harDataTest1.
harDataTest1 <- read.table("./test/X_test.txt",sep="",header=FALSE,na.strings=TRUE)
###Put the 561 column names in harDataTest1.

names(harDataTest1) <- make.names(cnames,unique = TRUE,allow_ = TRUE)
###Convert harDataTest1 to data.table type 
harDataTest1 <- as.data.table(harDataTest1)

## Processing Subject Variables

###Read data about subjects of test.
subjecTest <- read.table("./test/subject_test.txt",sep="",header=FALSE,na.strings=TRUE)
###Putting descriptive header to column V1.
subjecTest <- dplyr::rename(subjecTest,subjectCode=V1)
###Convert subjectTest to data.table type 
subjecTest <- as.data.table(subjecTest)

##Processing variables about activities

###Read data about activities per subject during test.
activiTest <- read.table("./test/y_test.txt",sep="",header=FALSE,na.strings=TRUE)
###Put descriptive header to column V1.
activiTest <- rename(activiTest,ActivityCode = V1)
###Convert activiTest to data.table type 
activiTest <- as.data.table(activiTest)

##Processing variables about inertial signals. Only add one column that represents average value of each vector. Then, this column will be
## added to data set of training.

###To obtain means of body acceleration in X,Y,Z

####Read data about body acceleration in X axis
ISBodyAccXTest <- read.table("./test/Inertial Signals/body_acc_x_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyAcc.mean..X" column 
ISBodyAccXTest <- mutate(ISBodyAccXTest,BodyAcc.mean..X = rowMeans(ISBodyAccXTest))

####Read data about body acceleration in Y axis
ISBodyAccYTest <- read.table("./test/Inertial Signals/body_acc_y_test.txt",sep="",header=FALSE,na.strings=TRUE)
###Put the new "BodyAcc.mean..Y" column 
ISBodyAccYTest <- mutate(ISBodyAccYTest,BodyAcc.mean..Y = rowMeans(ISBodyAccYTest))

####Read data about body acceleration in Z axis
ISBodyAccZTest <- read.table("./test/Inertial Signals/body_acc_z_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyAcc.mean..Z" column 
ISBodyAccZTest <- mutate(ISBodyAccZTest,BodyAcc.mean..Z = rowMeans(ISBodyAccZTest))

### To obtain means of total acceleration in X,Y,Z

####Read data about total acceleration in X axis
ISTotalAccXTest <- read.table("./test/Inertial Signals/total_acc_x_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "TotalAcc.mean..X" column 
ISTotalAccXTest <- mutate(ISTotalAccXTest,TotalAcc.mean..X = rowMeans(ISTotalAccXTest))

####Read data about total acceleration in Y axis
ISTotalAccYTest <- read.table("./test/Inertial Signals/total_acc_y_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "TotalAcc.mean..Y" column 
ISTotalAccYTest <- mutate(ISTotalAccYTest,TotalAcc.mean..Y = rowMeans(ISTotalAccYTest))

####Read data about total acceleration in Z axis
ISTotalAccZTest <- read.table("./test/Inertial Signals/total_acc_z_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "TotalAcc.mean..Z" column 
ISTotalAccZTest <- mutate(ISTotalAccZTest,TotalAcc.mean..Z = rowMeans(ISTotalAccZTest))

### To obtain means of body_gyro in X,Y,Z

####Read data about body_gyro in X axis
ISBodyGyroXTest <- read.table("./test/Inertial Signals/body_gyro_x_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyGyro.mean..X" column 
ISBodyGyroXTest <- mutate(ISBodyGyroXTest,BodyGyro.mean..X = rowMeans(ISBodyGyroXTest))

####Read data about body_gyro in Y axis
ISBodyGyroYTest <- read.table("./test/Inertial Signals/body_gyro_y_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyGyro.mean..Y" column 
ISBodyGyroYTest <- mutate(ISBodyGyroYTest,BodyGyro.mean..Y = rowMeans(ISBodyGyroYTest))

####Read data about body_gyro in Z axis
ISBodyGyroZTest <- read.table("./test/Inertial Signals/body_gyro_z_test.txt",sep="",header=FALSE,na.strings=TRUE)
####Put the new "BodyGyro.mean..Y" column 
ISBodyGyroZTest <- mutate(ISBodyGyroZTest,BodyGyro.mean..Z = rowMeans(ISBodyGyroZTest))



## Join harDataTest1,subjectTest and activiTest in one data frame named: DataTestHAR
DataTestHAR <- harDataTest1[,SubjectCode:=subjecTest$subjectCode]
DataTestHAR <- harDataTest1[,ActivityCode:=activiTest$ActivityCode]

##Add to DataTestHAR a new column whose name is: ActivityName
DataTestHAR <- mutate(DataTestHAR,ActivityName = activities[DataTestHAR$ActivityCode,2])

###Add mean columns of inertial signals
DataTestHAR <- mutate(DataTestHAR,BodyAcc.mean..X = ISBodyAccXTest$BodyAcc.mean..X)
DataTestHAR <- mutate(DataTestHAR,BodyAcc.mean..Y = ISBodyAccYTest$BodyAcc.mean..Y)
DataTestHAR <- mutate(DataTestHAR,BodyAcc.mean..Z = ISBodyAccZTest$BodyAcc.mean..Z)

DataTestHAR <- mutate(DataTestHAR,TotalAcc.mean..X = ISTotalAccXTest$TotalAcc.mean..X)
DataTestHAR <- mutate(DataTestHAR,TotalAcc.mean..Y = ISTotalAccYTest$TotalAcc.mean..Y)
DataTestHAR <- mutate(DataTestHAR,TotalAcc.mean..Z = ISTotalAccZTest$TotalAcc.mean..Z)

DataTestHAR <- mutate(DataTestHAR,BodyGyro.mean..X = ISBodyGyroXTest$BodyGyro.mean..X)
DataTestHAR <- mutate(DataTestHAR,BodyGyro.mean..Y = ISBodyGyroYTest$BodyGyro.mean..Y)
DataTestHAR <- mutate(DataTestHAR,BodyGyro.mean..Z = ISBodyGyroZTest$BodyGyro.mean..Z)

## Add ID columns to data sets
DataTrainHAR <- mutate(DataTrainHAR, ID = paste0("Train",rownames(DataTrainHAR)))
DataTestHAR <- mutate(DataTestHAR, ID = paste0("Test",rownames(DataTestHAR)))

##. 1.Answer: Merge test and training data frames
HARmergeTT <- merge(DataTrainHAR,DataTestHAR,all=TRUE)

##Cleaning HARmergeTT

good <- complete.cases((HARmergeTT))
HARmergeTTClean <- HARmergeTT[good,][1:10299,]

###Save to disk the data without NAs

save(HARmergeTTClean,file="HARmergeTTClean.RData")

## 2. Answer: Obtaining mean and standar deviation columns from HARmergeTTClean for each measurement

meanStdColumns <- grep("mean|std", dfNames$V2, value = FALSE)
meanSTD_HARmergeTTClean <- select(HARmergeTTClean,SubjectCode,ActivityName,meanStdColumns)

### Save to disk mean and standard deviation columns from HARmergeTTClean

save(meanSTD_HARmergeTTClean,file="meanSTD_HARmergeTTClean.RData")

### 3. Answer: In the "ActivityName" column of HARmergeTTClean appears names of physical activities for training and test.

### 4. Answer: The new columns in "meanSTD_HARmergeTTClean" data set were labelled with descriptive names. The detailed description can be 
### found in CodeBook.md and complementary explanations can be found in README.md

### 5. Answer : Here I use the libraries "reshape2" and "dplyr"
library(reshape2)
#### Melt variables "SubjectCode" and "ActivityName"
meltData <- melt(meanSTD_HARmergeTTClean,id=c("SubjectCode","ActivityName"))
#### Group last variables melted
groups <- group_by(meltData,SubjectCode,ActivityName)
#### To calculate mean for groups
tidyMeanData <- summarize(groups,mean = mean(value))
#### Save results to file "tidyMeanDataSubject4Activity"
save(tidyMeanData,file="tidyMeanDataSubject4Activity.RData")

#END OF EXERCISE



