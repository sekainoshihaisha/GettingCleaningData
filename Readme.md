Getting and Cleaning Data - Course Project
==========================================

# General view

* This project provides a way to get a tidy dataset from a series of datasets that corresponds from a study made about several actions gotten from the movement of subjects.
* The data was provided by the [Human activity recognition using smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) investigation.
* The files needed to get the tidy dataset are: subject_test.txt, subject_train.txt, X_test.txt, y_test.txt, X_train.txt, y_train.txt, features.txt, activity_labels.txt.

# `run_analysis.R` logic

1. It is needed to get the directory of which the script is.
2. A data folder is created in that directory if it doesn't exists.
3. The new directory path of the data folder is stored.
4. The data is downloaded and stored in the data folder.
5. The downloaded file is a .zip file, which will be unzipped in the same directory.
6. The subjects, x and y files from train and test folders are set in variables, getting six individual datasets.
7. Each dataset is merged into one according to the dataset (merging only subjects, Xs and Ys in appropriate specified variable), getting just three datasets.
8. The three resulting datasets are merged into one.
9. The one dataset is subset to get the mean and standard deviation of each movement stored in the original files.
10. The activity column is replaced with the specified activity that was performed.
11. The differents required columns are selected and stored in a variable.
12. The final dataset, which is the tidy one, is stored in an external file in the same directory which the R script is stored.