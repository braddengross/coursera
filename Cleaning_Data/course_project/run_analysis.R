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

#Add subjects to columns
colnames(testing_subject) <- "Subject"
colnames(training_subject) <- "Subject"
subjects <- rbind(testing_subject, training_subject)
test_set <- cbind(testing_subject, test_set)
training_set <- cbind(training_subject, training_set)
#Bind data set 
data_set <- rbind(test_set, training_set)
data_labels <- rbind(test_labels, training_labels)
colnames(data_labels) <- "Activity"

#Extract mean and std columns
mean_data_set <- data_set[ , grepl("-mean()", colnames(data_set))]
std_data_set <- data_set[ , grepl("-std()", colnames(data_set))]
#Bind together subjects, labels, and data
mean_std_dataset <- cbind(mean_data_set, std_data_set)
mean_std_dataset <- cbind(data_labels, mean_std_dataset)
mean_std_dataset <- cbind(subjects, mean_std_dataset)

#Extract activities and convert from numerical identifier to English
activities <- mean_std_dataset[,2]
activities <- as.character(activities)
activity_labels$V2 <- as.character(activity_labels$V2)
for(i in 1:length(activities)){
  activity <- activity_labels[activity_labels$V1 == activities[i], 2]
  activities[i] <- activity
}
mean_std_dataset$Activity <- activities

#Sort by Subject and Activity for clarity
mean_std_dataset <- arrange(mean_std_dataset, Subject, Activity)

#Aggregate data on subject and activity using the mean function for other columns
tidy_dataset <- aggregate(mean_std_dataset, by=list(mean_std_dataset$Subject, mean_std_dataset$Activity), FUN=mean)
#Clear unneccessary columns
tidy_dataset$Subject <- NULL
tidy_dataset$Activity <- NULL
#Reset col names with new columns
colnames(tidy_dataset) <- colnames(mean_std_dataset)

write.table(mean_std_dataset, file="run_analysis.txt", row.name = FALSE)


