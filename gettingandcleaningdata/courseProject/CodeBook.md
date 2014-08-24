# Code Book

##Study design and dataset
More information about study design can be found in the acompanying readme file in the „UCI HAR Dataset“ folder. There complete study design as well as dataset is explained.

##Variables name and type used in creating final tidy dataset
subject                     	Factor with levels "1:30"
activity                    	Factor with levels "WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING"
set                         	Factor with levels "test, train"
TimeBodyAcc_mean_X          	numeric
TimeBodyAcc_mean_Y          	numeric
TimeBodyAcc_mean_Z          	numeric
TimeBodyAcc_std_X           	numeric
TimeBodyAcc_std_Y           	numeric
TimeBodyAcc_std_Z           	numeric
TimeGravityAcc_mean_X       	numeric
TimeGravityAcc_mean_Y       	numeric
TimeGravityAcc_mean_Z       	numeric
TimeGravityAcc_std_X        	numeric
TimeGravityAcc_std_Y        	numeric
TimeGravityAcc_std_Z        	numeric
TimeBodyAccJerk_mean_X      	numeric
TimeBodyAccJerk_mean_Y      	numeric
TimeBodyAccJerk_mean_Z      	numeric
TimeBodyAccJerk_std_X       	numeric
TimeBodyAccJerk_std_Y       	numeric
TimeBodyAccJerk_std_Z       	numeric
TimeBodyGyro_mean_X         	numeric
TimeBodyGyro_mean_Y         	numeric
TimeBodyGyro_mean_Z         	numeric
TimeBodyGyro_std_X          	numeric
TimeBodyGyro_std_Y          	numeric
TimeBodyGyro_std_Z          	numeric
TimeBodyGyroJerk_mean_X     	numeric
TimeBodyGyroJerk_mean_Y     	numeric
TimeBodyGyroJerk_mean_Z     	numeric
TimeBodyGyroJerk_std_X      	numeric
TimeBodyGyroJerk_std_Y      	numeric
TimeBodyGyroJerk_std_Z      	numeric
TimeBodyAccMag_mean         	numeric
TimeBodyAccMag_std          	numeric
TimeGravityAccMag_mean      	numeric
TimeGravityAccMag_std       	numeric
TimeBodyAccJerkMag_mean     	numeric
TimeBodyAccJerkMag_std      	numeric
TimeBodyGyroMag_mean        	numeric
TimeBodyGyroMag_std         	numeric
TimeBodyGyroJerkMag_mean    	numeric
TimeBodyGyroJerkMag_std     	numeric
FreqBodyAcc_mean_X          	numeric
FreqBodyAcc_mean_Y          	numeric
FreqBodyAcc_mean_Z          	numeric
FreqBodyAcc_std_X           	numeric
FreqBodyAcc_std_Y           	numeric
FreqBodyAcc_std_Z           	numeric
FreqBodyAccJerk_mean_X      	numeric
FreqBodyAccJerk_mean_Y      	numeric
FreqBodyAccJerk_mean_Z      	numeric
FreqBodyAccJerk_std_X       	numeric
FreqBodyAccJerk_std_Y       	numeric
FreqBodyAccJerk_std_Z       	numeric
FreqBodyGyro_mean_X         	numeric
FreqBodyGyro_mean_Y         	numeric
FreqBodyGyro_mean_Z         	numeric
FreqBodyGyro_std_X          	numeric
FreqBodyGyro_std_Y          	numeric
FreqBodyGyro_std_Z          	numeric
FreqBodyAccMag_mean         	numeric
FreqBodyAccMag_std          	numeric
FreqBodyBodyAccJerkMag_mean 	numeric
FreqBodyBodyAccJerkMag_std  	numeric
FreqBodyBodyGyroMag_mean    	numeric
FreqBodyBodyGyroMag_std     	numeric
FreqBodyBodyGyroJerkMag_mean	numeric
FreqBodyBodyGyroJerkMag_std 	numeric

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

