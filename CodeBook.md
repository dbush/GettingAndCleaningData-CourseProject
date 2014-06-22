CodeBook
========

This codebook describes the tidy data set generated for the Getting and Cleaning Data Coursera course project and the run_analysis.R script.

Source Data
-----------

**Abstract:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.  
activityrecognition '@' smartlab.ws  
www.smartlab.ws  

**Data Set Information:**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

* [Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* [Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The final version of the data analysed was downloaded at Sunday 22nd June 2014 16:39 (British Summer Time).

Source Data Description
-----------------------

The source data includes the following description of the variables in the data. It is included within the zip file as the file `features_info.txt`.

````
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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
````

Project Description
-------------------

The course project required that one R script called run_analysis.R should be produced that does the following. 

> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Script Description
------------------

The code of the script is structured as follows:

````
run()
  +---readData()
  ¦     +---readX()
  ¦     +---readY()
  ¦     +---readSubject()
  +---writeTidy()
  +---writeAverages()
````

* `run()` "Wires" the functions below together. Function to run to run the whole process.
* `readData()` Reads Xs, Ys and subjects into R using the functions below and combines them into a tidy data set.
* `readX()` Reads the X data files into R and modifies the column names and extracts just the mean and standard deviation columns using the "features.txt" reference file as a lookup to extract just those columns. Additionally columns are renamed as per the naming convention described below.
* `readY()` Reads the Y data files into R and uses descriptive activity names using the reference file "activity_labels.txt". 
* `readSubject()` Reads the subject data files into R and renames the column to be called "subject"
* `writeTidy()` Output the tidy data to a file called "tidy.txt".
* `writeAverages()` Generate and output averages to a file called "averages.txt".

Running the Script
-----------------

Please refer to the [README.md](README.md) file that accompanies this code book.

Output file
-----------

**Naming convention**

* () characters are removed.
* Dashes (i.e. -) characters are replaced with periods.
* The name is lower cased.
* I considered replacing the t and f prefixes with a reference to time and frequency domain signals respectively but it did not seem that this would improve readablity due to the length of the name becoming longer. 
* I also considered replacing acc with acceleration but again I did not think that this would necessarily make the name of the column more understandable.

**Columns**

|Column number|Name|Notes|
|-------------|----|-----|
|1|subject|Integer from 1-30. Represents which test subject the data refers to.|
|2|activity|Taken from the labels in the "activity_labels.txt" reference file. These values are lower cased and any underscores are replaced with spaces to give: walking, walking upstairs, walking downstairs, sitting, standing, laying.|
|3|tbodyacc.mean.x||
|4|tbodyacc.mean.y||
|5|tbodyacc.mean.z||
|6|tbodyacc.std.x||
|7|tbodyacc.std.y||
|8|tbodyacc.std.z||
|9|tgravityacc.mean.x||
|10|tgravityacc.mean.y||
|11|tgravityacc.mean.z||
|12|tgravityacc.std.x||
|13|tgravityacc.std.y||
|14|tgravityacc.std.z||
|15|tbodyaccjerk.mean.x||
|16|tbodyaccjerk.mean.y||
|17|tbodyaccjerk.mean.z||
|18|tbodyaccjerk.std.x||
|19|tbodyaccjerk.std.y||
|20|tbodyaccjerk.std.z||
|21|tbodygyro.mean.x||
|22|tbodygyro.mean.y||
|23|tbodygyro.mean.z||
|24|tbodygyro.std.x||
|25|tbodygyro.std.y||
|26|tbodygyro.std.z||
|27|tbodygyrojerk.mean.x||
|28|tbodygyrojerk.mean.y||
|29|tbodygyrojerk.mean.z||
|30|tbodygyrojerk.std.x||
|31|tbodygyrojerk.std.y||
|32|tbodygyrojerk.std.z||
|33|tbodyaccmag.mean||
|34|tbodyaccmag.std||
|35|tgravityaccmag.mean||
|36|tgravityaccmag.std||
|37|tbodyaccjerkmag.mean||
|38|tbodyaccjerkmag.std||
|39|tbodygyromag.mean||
|40|tbodygyromag.std||
|41|tbodygyrojerkmag.mean||
|42|tbodygyrojerkmag.std||
|43|fbodyacc.mean.x||
|44|fbodyacc.mean.y||
|45|fbodyacc.mean.z||
|46|fbodyacc.std.x||
|47|fbodyacc.std.y||
|48|fbodyacc.std.z||
|49|fbodyaccjerk.mean.x||
|50|fbodyaccjerk.mean.y||
|51|fbodyaccjerk.mean.z||
|52|fbodyaccjerk.std.x||
|53|fbodyaccjerk.std.y||
|54|fbodyaccjerk.std.z||
|55|fbodygyro.mean.x||
|56|fbodygyro.mean.y||
|57|fbodygyro.mean.z||
|58|fbodygyro.std.x||
|59|fbodygyro.std.y||
|60|fbodygyro.std.z||
|61|fbodyaccmag.mean||
|62|fbodyaccmag.std||
|63|fbodybodyaccjerkmag.mean||
|64|fbodybodyaccjerkmag.std||
|65|fbodybodygyromag.mean||
|66|fbodybodygyromag.std||
|67|fbodybodygyrojerkmag.mean||
|68|fbodybodygyrojerkmag.std||