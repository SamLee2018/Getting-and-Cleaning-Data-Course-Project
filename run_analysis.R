rm(list=ls())
library(dplyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "F:/Coursera/data/Dataset")
unzip("F:/Coursera/data/Dataset")

# read features (data description)
features <- read.table("F:/Coursera/data/UCI Har Dataset/features.txt")
features[,2] <- as.character(features[,2])

# selected.features vector for mean and std
selected.features <- grep(".*mean.*|.*std.*", features[,2])
selected.features.names <- features[selected.features,2]

# read data from the train only for selected.features
x_train <- read.table("F:/Coursera/data/UCI Har Dataset/train/X_train.txt")[selected.features]
activity_train <- read.table("F:/Coursera/data/UCI Har Dataset/train/y_train.txt")
colnames(activity_train) <- "activity"
subject_train <- read.table("F:/Coursera/data/UCI Har Dataset/train/subject_train.txt")
colnames(subject_train) <- "subject"

# read data from the test only for selected.features
x_test <- read.table("F:/Coursera/data/UCI Har Dataset/test/X_test.txt")[selected.features]
activity_test <- read.table("F:/Coursera/data/UCI Har Dataset/test/y_test.txt")
colnames(activity_test) <- "activity"
subject_test <- read.table("F:/Coursera/data/UCI Har Dataset/test/subject_test.txt")
colnames(subject_test) <- "subject"

#merge data, change column names, Appropriately labels the data set with descriptive variable names.
train_All <- cbind(subject_train, activity_train, x_train)
test_All <- cbind(subject_test, activity_test, x_test)
AllData <- rbind(train_All, test_All)
colnames(AllData) <- c("subject", "activity", selected.features.names)


# read activity labels and name the activities in the AllData
activity_labels <- read.table("F:/Coursera/data/UCI HAR Dataset/activity_labels.txt")
AllData$activity <- factor(AllData$activity, labels = as.character(activity_labels[,2]))


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Mean.by.Group <- AllData %>% group_by(activity, subject) %>% summarize_each(funs(mean))

write.table(Mean.by.Group, "F:/Coursera/data/Mean.by.Group.txt")













