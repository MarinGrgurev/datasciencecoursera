## -------------------------
## Author: Marin Grgurev
## Date: August 23, 2014
## -----------------------
## This script create tidy dataset as requirement from the assignment from the Coursera
## Coursera course "Getting and cleaning data"
## Note: This code assume that the required data are downloaded and unizpped and present
## in "/UCI HAR Dataset" folder in working directory.

## Check to see if required datasset is in working directory. If required files
## are not present in the UCI HAR Dataset folder this script can download required data 
## and unzip them in ./UCI HAR Dataset folder automatically.
## Automatic retrieval of data are possible by uncommenting lines from xxxxxxXXXX
if(!file.exists("./UCI HAR Dataset")){
        message("You're missing UCI HAR Dataset folder which are required for this assignment. 
Please download zip file and unzip it in working directory. You can also 
uncomment following four lines to allow script to download required files.")}

## Download and unzip data
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, "UCI HAR Dataset.zip")
#unzip("UCI HAR Dataset.zip")

# Load required packages
library(data.table)
library(reshape2)

## Creating one merged dataset
# Creating train and test data.tables. Aditional variable "set" is also created to be 
# able to distinguish between train and test set in merged dataset 
dataTrain <- data.table(subject=fread("UCI HAR Dataset/train/subject_train.txt"),
                        activity=fread("UCI HAR Dataset/train/y_train.txt"),
                        set=rep("train", nrow(fread("UCI HAR Dataset/train/subject_train.txt"))),
                        setDT(read.table("UCI HAR Dataset/train/X_train.txt")))
dataTest <- data.table(subject=fread("UCI HAR Dataset/test/subject_test.txt"),
                       activity=fread("UCI HAR Dataset/test/y_test.txt"),
                       set=rep("test", nrow(fread("UCI HAR Dataset/test/subject_test.txt"))),
                       setDT(read.table("UCI HAR Dataset/test/X_test.txt")))

# Temporarily label the data set with original variable names
feat <- fread("UCI HAR Dataset/features.txt", select="V2")[,V2]
setnames(dataTrain, colnames(dataTrain)[-c(1:3)], feat)
setnames(dataTest,colnames(dataTest)[-c(1:3)], feat)

# Merging train and test dataset
data <- rbindlist(list(dataTrain,dataTest))

# Extracting only the measurements on the mean and standard deviation for each measurement
# Note: This doesn't include all the columns that have "mean" or "std" word in column name
# but looks for mean and std as a measurement.
# Example: fBodyGyro-mean()-Y is mean of the fBodyGyro variable and its column is extracted,
# but fBodyGyro-meanFreq()-Y is mean frequency of the fBodyGyro and thus not extracted  
data <- data[, c(1:3, grep("mean\\(|std", colnames(data))), with=FALSE]

## Minimal adjusting of original dataset variables as original ones are already very 
## readble and concise enough the idea is that variable names that only measurement section
## of the variable name is separated with the underscore. The rest is cammel case with first 
## word in lowercase.
# Getting current column names
feat <- colnames(data)

# Replacing "t" and "f" with "Time" and "Freq" respectively
feat <- sub("^t", "Time", feat); feat <- sub("tBody", "TimeBody", feat)
feat <- sub("^f", "Freq", feat); 

# Removing those strange parenthesis for every single variable and leaving rest as is
feat <- sub("\\(\\)", "", feat)

# Placing "underscore" instead "minus" sign
feat <- gsub("-", "_", feat)

# Setting final set of variable names
feat <- c("subject", "activity", "set", feat[-c(1:3)])
setnames(data,colnames(data), feat)

# Adjusting column data types and use descriptive activity names to name the 
# activities in the data set
data[, subject := as.factor(subject)]
data[, activity := as.factor(activity)]
data[,set := as.factor(set)]
setattr(data$activity, "levels", fread("./UCI HAR Dataset/activity_labels.txt")[,V2])

## Creating a second tidy data set with the average of each variable for each 
## activity and each subject.
# Creating long dataset with melt to be able to easily calculate mean for each variable
dataL <- melt(data, id.vars=c("subject", "activity", "set"), na.rm=TRUE, variable.name = "measurement", value.name = "value")

# Calculating mean for each variable by subject by activity
setkey(dataL, measurement, activity, subject)
dataLmean <- dataL[, mean(value), by="measurement,activity,subject"]

# Creating wide dataset with each variable in its own column for each subject and activity
dataW <- dcast(dataLmean, subject+activity~measurement, value.var="V1")

# Writing txt file as a result
write.table(dataW, "./data/cleaned_UCI_HAR_dataset.txt", row.name=FALSE)