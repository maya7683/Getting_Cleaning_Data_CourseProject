# Getting and Cleaning Data - Course Project

## The Variables
Variables (column names) found in the output file 'clean_data.csv':
* ACTIVITY: Each activity found in 'activity_labls.txt' of the original data for every subject
* SUBJECT: Each subject number from training and test datasets
* Other: All other variables are attributes explained below
* The values in each cell represent the mean for that subject and that activity for the particular measurement

## The Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Attribute Information:
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### Data files and descriptions
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_t'
* 'rain.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Data Transformations
The data are transformed from their raw form to a tidy data set by the following steps:
* File names are defined and loaded into R using `read.table()`
* Columns of the data are renamed according to `features`
* Subject information, Activity information, and the data are merged into one dataset using `cbind()` and `rbind()`
* Activity and Subject information columns are renamed accordingly
* Activity numbers are replaced by their descriptive activity name according to `activity_labels.txt`
* Mean and standard deviation data is extracted from the data using `grep()`
* The mean for each activity for each subject is calculated using `aggregate()`
* The data is sorted by subject using `order()`
* The cleaned data is saved using `write.csv()`