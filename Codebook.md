Getting and Cleaning Data - Codebook
====================================

# Purpose of the project

This project has the objective of obtaining a clear dataset from different files of UCI HAR Dataset, involving information from a specified experiment about human activity recognition using smartphones through sensors to detect particular movements.

# Used data

* Subjects data: subject_test.txt, subject_train.txt
* Numeric data: X_test.txt, y_test.txt, X_train.txt, y_train.txt
* Operations data: features.txt
* Activities data: activity_labels.txt

# Process of cleaning and constructing

1. The working directory is set and structured to distribute data as a way of ordered environment.
2. The datasets are downloaded to the specified directory.
3. Each one of the numeric and subject datasets are stored in variables to get an easy access to them.
4. The datasets are merged to get one full dataset. The operations dataset is set in one of the numeric dataset to get column name of the operation applied to each one.
5. Obtaining part of the complete dataset with required operations by subsetting it.
6. The generated dataset is then created as a file to save the tidy data.