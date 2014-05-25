Getting And Cleaning Data - Course Project
==========================================

This repository contains my submission for the Coursera Getting and Cleaning Data course project as
described in the [project description](https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions).

To run the script:
------------------

* Clone this repository.
* Download the data from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
* Extact the contents of the zip file to a temporary directory.
* Edit the run_analysis.R script to modify the dataPath variable defined on the second line of the script to point to the `UCI HAR Dataset` directory within the extracted files.
* `source(...)` the run_analysis.R script.
* Execute the `run()` function to run the process.

Expected output:
----------------

> [1] "Reading X..."
>
> [1] "Reading Y..."
>
> [1] "Reading Subject..."
>
> [1] "Outputting results..."
>
> [1] "Done!"

Two files should be generated in the current directory as specified by the `setcwd(...)` directory:
* tidy.txt - This should contain the a tidied version of the data.
* averages.txt - This should contain an independent tidy data set with the average of each variable for each activity and each subject. 