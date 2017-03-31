
##Clear workspace, set directory, load packages
rm(list=ls())
setwd("C:/Users/sml/Desktop/Coursera R/UCI HAR Dataset")
list.files()
library(dplyr)

### Read in Test Data
test_data <- read.table("test/X_test.txt", stringsAsFactors = FALSE)
test_activitylabels <- read.table("test/y_test.txt", stringsAsFactors = FALSE)
names(test_activitylabels)[names(test_activitylabels)=="V1"] <- "activity"
test_subject <- read.table("test/subject_test.txt", stringsAsFactors = FALSE)
names(test_subject)[names(test_subject)=="V1"] <- "subject"

### Read in Training Data
train_data <- read.table("train/X_train.txt", stringsAsFactors = FALSE)
train_activitylabels <- read.table("train/y_train.txt", stringsAsFactors = FALSE)
names(train_activitylabels)[names(train_activitylabels)=="V1"] <- "activity"
train_subject <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)
names(train_subject)[names(train_subject)=="V1"] <- "subject"

### Rename Variables using Features data
features <- read.table("features.txt", stringsAsFactors = FALSE)
newnames <- features$V2
colnames(test_data) <- c(newnames)
colnames(train_data) <- c(newnames)

### Add in column denoting the activity type
test_data <- cbind(test_activitylabels, test_data)
train_data <- cbind(train_activitylabels, train_data)


### Add in column denoting the subject
test_data <- cbind(test_subject, test_data)
train_data <- cbind(train_subject, train_data)

### Append training and test datasets together
all_data <- rbind(test_data, train_data)

### keep only the mean() and std() variables. Did not keep the Additional Means. or the meanFreq.
varnames <- grep("mean[^Freq]|[Ss]td|subject|activity", names(all_data), value="TRUE")
selected_data <- all_data[varnames]

### Cleaning the variable names to get rid of "-", "(", and ")"
colnames(selected_data) <- c(gsub("-","", names(selected_data)))
colnames(selected_data) <- c(gsub("\\(","",names(selected_data)))
colnames(selected_data) <- gsub("\\)","",names(selected_data))

### Labeling the activity types
selected_data$activity[selected_data$activity==1] <- "Walking"
selected_data$activity[selected_data$activity==2] <- "Walking_Upstairs"
selected_data$activity[selected_data$activity==3] <- "Walking_Downstairs"
selected_data$activity[selected_data$activity==4] <- "Sitting"
selected_data$activity[selected_data$activity==5] <- "Standing"
selected_data$activity[selected_data$activity==6] <- "Laying"

### Grouping this dataset by activity type and generating a table with the averages 
table_of_means <- selected_data %>% group_by(activity, subject) %>% summarize_each(funs(mean))

### Writing the resulting tidy dataset to a text file
write.table(table_of_means, "tidy_dataset.txt", sep = "\t")



