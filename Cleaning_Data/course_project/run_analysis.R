library(dplyr)

#Load all nexessary files
activity_labels <- read.table("./data/activity_labels.txt")
features <- read.table("./data/features.txt")
test_set <- read.table("./data/test/X_test.txt")
test_labels <- read.table("./data/test/y_test.txt")
training_set <- read.table("./data/train/X_train.txt")
training_labels <- read.table("./data/train/y_train.txt")
training_subject <- read.table("./data/train/subject_train.txt")
testing_subject <- read.table("./data/test/subject_test.txt")

#Extract column names
colnames(test_set) <- features$V2
colnames(training_set) <- features$V2
#Bind data set 
data_set <- rbind(test_set, training_set)
data_labels <- rbind(test_labels, training_labels)
colnames(data_labels) <- "Activity"

#Extract mean and std columns
mean_data_set <- data_set[ , grepl("-mean()", colnames(data_set))]
std_data_set <- data_set[ , grepl("-std()", colnames(data_set))]
mean_std_dataset <- cbind(mean_data_set, std_data_set)
mean_std_dataset <- cbind(data_labels, mean_std_dataset)

activities <- mean_std_dataset[,1]
activities <- as.character(activities)
activity_labels$V2 <- as.character(activity_labels$V2)
for(i in 1:length(activities)){
  activity <- activity_labels[activity_labels$V1 == activities[i], 2]
  activities[i] <- activity
}

mean_std_dataset$Activity <- activities
