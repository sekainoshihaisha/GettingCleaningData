# Getting the directory in which the script is in and downloading
fileDirectory <- dirname(rstudioapi::getSourceEditorContext()$path)

if (!file.exists(paste(fileDirectory, "/", "data", sep = "")))
{
    dir.create(paste(fileDirectory, "/", "data", sep = ""))
}

dataDirectory <- paste(fileDirectory, "/", "data", sep = "")

# Downloading and unzipping the zio file in a created folder named data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = paste(dataDirectory, "/", "dataset.zip", sep = ""), method = "curl")
unzip(zipfile = paste(dataDirectory, "/", "dataset.zip", sep = ""), exdir = dataDirectory)

uciDirectory <- paste(dataDirectory, "/UCI HAR Dataset", sep = "")

# Getting the test data
testSubject <- read.table(paste(uciDirectory, "/test/subject_test.txt", sep = ""), header = FALSE)
testX <- read.table(paste(uciDirectory, "/test/X_test.txt", sep = ""), header = FALSE)
testY <- read.table(paste(uciDirectory, "/test/y_test.txt", sep = ""), header = FALSE)

# Getting the train data
trainSubject <- read.table(paste(uciDirectory, "/train/subject_train.txt", sep = ""), header = FALSE)
trainX <- read.table(paste(uciDirectory, "/train/X_train.txt", sep = ""), header = FALSE)
trainY <- read.table(paste(uciDirectory, "/train/y_train.txt", sep = ""), header = FALSE)

# Merging the datasets
subjectData <- rbind(testSubject, trainSubject)
xData <- rbind(testX, trainX)
yData <- rbind(testY, trainY)

names(subjectData) <- c("subject")
featuresName <- read.table(paste(uciDirectory, "/features.txt", sep = ""), header = FALSE)
names(xData) <- featuresName$V2
names(yData) <- c("activity")

mergingData1 <- cbind(subjectData, yData)
mergedData <- cbind(xData, mergingData1)

# Getting measured data
measuredData <- featuresName$V2[grep("mean\\(\\)|std\\(\\)", featuresName$V2)]
selectedData <- c(as.character(measuredData), "subject", "activity")
filteredData <- subset(mergedData, select = selectedData)

# Setting names through activity_labels.txt
activityLabels <- read.table(paste(uciDirectory, "/activity_labels.txt", sep = ""), header = FALSE)
filteredData$activity <- activityLabels$V2[match(filteredData$activity, activityLabels$V1)]

# Creating new dataset with tidy data
tidyData <- aggregate(. ~ subject + activity, data = filteredData, FUN = mean)
write.table(tidyData, file = paste(fileDirectory, "/tidyDataset.txt", sep = ""), row.names = FALSE)
