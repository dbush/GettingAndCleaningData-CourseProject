Getting And Cleaning Data - Course Project
==========================================

This repository contains my submission for the Coursera Getting and Cleaning Data course project as
described in the [project description](https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions).

To run the script:
------------------

* Clone this repository.
* Download the data from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to the same directory as the run_analysis.R file.
* Extact the contents of the zip file, retaining the directory layout. 
* Set the current directory to be the same directory as the run_analysis.R file using the `setwd(...)` function.
* `source('run_analysis.R')` to load the run_analysis.R script.
* Execute the `run()` function to run the process.

Expected file layout:
---------------------

````
Repo directory
|
¦   .gitignore
¦   CodeBook.md
¦   getdata-projectfiles-UCI HAR Dataset.zip
¦   README.md
¦   run_analysis.R
¦
+---.git (contents not shown for clarity)
+---getdata-projectfiles-UCI HAR Dataset
   +---UCI HAR Dataset
       ¦   activity_labels.txt
       ¦   features.txt
       ¦   features_info.txt
       ¦   README.txt
       ¦
       +---test
       ¦   ¦   subject_test.txt
       ¦   ¦   X_test.txt
       ¦   ¦   y_test.txt
       ¦   ¦
       ¦   +---Inertial Signals
       ¦           body_acc_x_test.txt
       ¦           body_acc_y_test.txt
       ¦           body_acc_z_test.txt
       ¦           body_gyro_x_test.txt
       ¦           body_gyro_y_test.txt
       ¦           body_gyro_z_test.txt
       ¦           total_acc_x_test.txt
       ¦           total_acc_y_test.txt
       ¦           total_acc_z_test.txt
       ¦
       +---train
           ¦   subject_train.txt
           ¦   X_train.txt
           ¦   y_train.txt
           ¦
           +---Inertial Signals
                   body_acc_x_train.txt
                   body_acc_y_train.txt
                   body_acc_z_train.txt
                   body_gyro_x_train.txt
                   body_gyro_y_train.txt
                   body_gyro_z_train.txt
                   total_acc_x_train.txt
                   total_acc_y_train.txt
                   total_acc_z_train.txt
````

Expected output:
----------------

````
[1] "Reading X..."
[1] "Reading Y..."
[1] "Reading Subject..."
[1] "Outputting results..."
[1] "Done!"
````
Two files should be generated in the current directory as specified by the `setcwd(...)` directory:

* tidy.txt - This should contain the a tidied version of the data.
* averages.txt - This should contain an independent tidy data set with the average of each variable for each activity and each subject. 