# Code Book

##Study design and dataset
The features selected for this assignment come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ in Samsung mobile devices. More information about study design can be found in the README file in the „UCI HAR Dataset“ folder. In that folder complete study design as well as dataset is explained in details so there is no much point in describing it here again. The dataset with thorough explanation can be downloaded at: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". 

Here only the list and short preview of the whole variable have been given.
These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

##Variables name and type used in creating final tidy dataset
Here are the list of variables extracted from the raw dataset used in a creation of tidy dataset. From 561 variables only 66 have been extracted. According to the requirements only the measurements on the mean and standard deviation for each measurement have been extracted.
Note: This doesn't include all the columns that have "mean" or "std" word in column name but mean and standard deviation only as a measurement.
Example: fBodyGyro-mean()-Y is mean of the fBodyGyro variable and its column is extracted, but fBodyGyro-meanFreq()-Y is mean frequency of the fBodyGyro and thus not extracted.

For each record the following is provided:
*Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*Triaxial Angular velocity from the gyroscope. 
*A 561-feature vector with time and frequency domain variables. 
*Its activity label. 
*An identifier of the subject who carried out the experiment.

List of variables used in a creation of tidy dataset:

Variable name                   Variable type
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

##Naming variables
Minimal adjustments of original dataset variables have been made as original ones are already very readble and concise enough. Thus only part of the variable names where measurement have been defined was separated from the rest of the name with underscore. The rest of the names stayed as cammel case. Two minor adjustments have been made: Replacing "t" and "f" with "Time" and "Freq" respectively and removing those strange parenthesis for every single variable.



