# Getting and Cleaning Data Course Project

This script create tidy dataset as requirement from the assignment from the Coursera course "Getting and cleaning data" with purpose to demonstrate ability to collect, workwith, and clean a data set. The script (run_analysis.R) thus  does the following:
        
1. Merges the train and test datasets to create one merged data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the dataset.
4. Appropriately labels the dataset with descriptive activity names.
5. Creates a second, independent tidydata set with the average of each variable for each activity and each subject.

##Running the script
run_analysis.R script assume that the required data are downloaded as well as unizpped and present in "./UCI HAR Dataset" folder in working directory.
Script will automaticaly check to determine if required datasset is already present there. If required files are not present in the "./UCI HAR Dataset" folder, this script can download required data and unzip them in "./UCI HAR" Dataset folder automatically. For this it is required that lines from 19-22 are uncommented.

##Script logic
###Creating merged dataset
First, merged dataset is created. For this part data.table package is used because all operations and calculations on data are faster than usual R dataframe and read.table() command. Although not displayed in this readme, system.time() function continuously gave faster results with fread() function than with read.table() and that is the reason I opted for this approach. Additional factor variable "set" is also created in merged dataset to be able to distinguish between train and test set in later analyses (if needed).

###Extracting the mean and standard deviation measurements
Extracting only the measurements on the mean and standard deviation for each measurement doesn't include all the columns that have "mean" or "std" word in column name but rather looks for mean and standard deviation as a measurement. Example: fBodyGyro-mean()-Y is mean of the fBodyGyro variable and its column is extracted, but fBodyGyro-meanFreq()-Y is mean frequency of the fBodyGyro variable and not mean measurement of fBodyGyro variable and thus it is not extracted for further analysis.

###Adjusting the names of the variables and use descriptive activity names to name the activities in the dataset
Minimal adjusting of original dataset variables is perforemed as original ones are already very readble and concise. Explained in more details in Code book. Activities are converted to factors and used to name the activities in the dataset.

### Creating a second tidy data set with the average of each variable for each activity and each subject.
For this part first long dataset is created with the help of melt() function reshape2 package to prepare dataframe to be able to easily calculate mean for each variable. After that mean for each variable by subject and by activity is created. Finally, wide dataset is created with each variable in its own column for each subject and activity and cleaned dataset is written to file "cleaned_UCI_HAR_dataset.txt".
    
##Cleaned Data
The resulting tidy and cleaned dataset is saved in working directory in: "data/cleaned_UCI_HAR_dataset.txt". As required from the assignment it contains independent tidy dataset with the average of each variable for each activity and each subject.

