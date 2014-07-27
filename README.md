Getting-and-Cleaning-Data-Course-Project
========================================

Preparation of Tidy Data from the Human Activity Recognition Dataset. 

==================================================================
Getting and Cleaning Data Course Project, Cousera.

https://class.coursera.org/getdata-005/human_grading/view/courses/972582/assessments/3/submissions
==================================================================
A tidy data set was prepared from Human Activity Recognition Dataset that was provided on https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The tidy data was preparedfrom the following steps:
1. The zipped folder containing the data was downloaded from the website and unzipped into the r working directory. 

2. The following files are read into r
	- 'features.txt': List of all features.
	- 'activity_labels.txt': Links the class labels with their activity name.
	- 'X_train.txt': Training set.
	- 'y_train.txt': Training labels.
	- 'X_test.txt': Test set.
	- 'y_test.txt': Test labels.

3. Data relating to the training set are merge together into one data set 'train' using rbind. likewise data relating to the test set are merge together into one data set 'test' using rbind.

4. The resulting 'train' and 'test'data sets from step 2 are then merged together to create one data set 'all'.
    
5. A subset of the 'all' data set called 'mean.std' was produce  by extracting only the measurements on the mean and standard deviation for each measurement. 
    
6. The descriptive activity names from 'activity_labels.txt' was used to name the activities in the data set to create 'mean.std.activity'
    
7. The data set from step 6 was appropriately labels the data set with descriptive variable names.  
    
8. A second, independent tidy data set called 'tidyData' was created with the average of each variable for each activity and each subject.
 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 81-feature vector with time and frequency domain variables for mean and standrad deviation only. 
- Its activity name. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'TidyDataCodeBook.txt': Shows information about the variables used in the data set.

- 'tidyData.txt': Data set.



Notes: 
======
- Features are normalized and bounded within [-1,1].
