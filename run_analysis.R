## Loading all the files

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=F, colClasses = "numeric")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=F)
subject_train <- read.table("Data/UCI HAR Dataset/train/subject_train.txt", header=F)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=F, colClasses = "numeric")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=F)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)
features <- read.table("UCI HAR Dataset/features.txt", header=F)

## Merging the training and the test sets to create one data set

test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
all <- rbind(train, test)

## Adding the variable names

varNames <- make.names(features$V2)
names(all) <- c("subject", "activity", varNames)

## Extracting only the measurements on the mean and standard deviation for each measurement

mean.std <- all[,c(1,2,(grep("(.mean*)|(.std*)",names(all))))]

## Using descriptive activity names to name the activities in the data set

# Merge to create a new column 82 with the activity label
mean.std.activity  <- merge(mean.std, activity_labels,  by.x = "activity", by.y = "V1", all.x = TRUE)
# Replace the activtity column with the new column 82
mean.std.activity$activity <- mean.std.activity[,82]
# Delete the new column 82
mean.std.activity[,82] <- NULL


## Appropriately labelling the data set with descriptive variable names

mean.std.activity.labels  <- names(mean.std.activity)

mean.std.activity.labels <- gsub("(Acc+)", "Acceleration", mean.std.activity.labels)
mean.std.activity.labels <- gsub("(mean+)", "Mean", mean.std.activity.labels)
mean.std.activity.labels <- gsub("(std+)", "StdDev", mean.std.activity.labels)
mean.std.activity.labels <- gsub("(Mag+)", "Magnitude", mean.std.activity.labels)
mean.std.activity.labels <- gsub("(Freq+)", "Frequency", mean.std.activity.labels)
mean.std.activity.labels <- gsub("(AccelerationJerk+)", "LinearAccelerationJerk", mean.std.activity.labels)
mean.std.activity.labels <- gsub("(Gyro+)", "AngularVelocity", mean.std.activity.labels)
mean.std.activity.labels <- gsub("\\.+", "", mean.std.activity.labels)

names(mean.std.activity) <- mean.std.activity.labels

## Creating a second, independent tidy data set with the average of each variable for each activity and each subject

mean.std.activity <- mean.std.activity[order(mean.std.activity$activity, mean.std.activity$subject),]

tidyData <- aggregate(mean.std.activity[,3:81], by=list(activity = mean.std.activity$activity, subject = mean.std.activity$subject), FUN = mean, na.rm = TRUE)
