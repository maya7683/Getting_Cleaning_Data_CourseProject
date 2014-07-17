# Define file names
features_file <- "./UCI HAR Dataset/features.txt"
train_subj_file <- "./UCI HAR Dataset/train/subject_train.txt"
train_x_file <- "./UCI HAR Dataset/train/X_train.txt"
train_y_file <- "./UCI HAR Dataset/train/y_train.txt"
test_subj_file <- "./UCI HAR Dataset/test/subject_test.txt"
test_x_file <- "./UCI HAR Dataset/test/X_test.txt"
test_y_file <- "./UCI HAR Dataset/test/y_test.txt"

# Read in .csv files
## Read in features
features <- read.table(features_file, header=FALSE)
## Read in training data
train_subj <- read.table(train_subj_file, header=FALSE)
train_x <- read.table(train_x_file, header=FALSE)
train_y <- read.table(train_y_file, header=FALSE)
## Read in test data
test_subj <- read.table(test_subj_file, header=FALSE)
test_x <- read.table(test_x_file, header=FALSE)
test_y <- read.table(test_y_file, header=FALSE)

## Rename columns of data according to features
colnames(train_x) <- features$V2
colnames(test_x) <- features$V2

# Merge files
data <-rbind(cbind(train_subj, train_y, train_x),cbind(test_subj, test_y, test_x))

# Rename subject and activity (y) columns with descriptive variable names
colnames(data)[1] <- "SUBJECT"
colnames(data)[2] <- "ACTIVITY"

# Replace activity number with descriptive activity name
activities <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
for (activity_n in 1:6){
  data$ACTIVITY[data$ACTIVITY==activity_n] <- activities[activity_n]
}

# Extract mean and std data
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", colnames(data))
data <- data[c(1, 2, mean_std_columns)]


# Calculate mean for each activity for each subject
clean_data <- aggregate(. ~ ACTIVITY+SUBJECT, data = data, mean)

# Sort subjects
clean_data <- data[order(data$SUBJECT),]

# Save cleaned data as .csv file
write.csv(clean_data, file="clean_data.csv", row.names=FALSE)


