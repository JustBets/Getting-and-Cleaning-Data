## run_analysis.R
library(dplyr)


## Read in all files needed
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

## Combine into one object
train<-bind_cols(subject_train, y_train, X_train)
test<-bind_cols(subject_test, y_test, X_test)
data<-bind_rows(test, train)

## Select only the columns for subject, y, and the features that have "mean(" or "std("in their name
data<-select(data, 1, 2, grep("mean\\(|std\\(", features$V2)+2)

## Give descriptive names to activities in data from activity_labels object
data$V1100<-activity_labels$V2[data$V1100]

## Get the original names of the features that have "mean(" or "std("in their name
featureNames<-grep("mean\\(|std\\(", features$V2, value=TRUE)

## Make the original names more readable
featureNames<-gsub("^t", "time", featureNames)
featureNames<-gsub("^f", "freq", featureNames)
featureNames<-gsub("\\(|\\)|-", "", featureNames)

## Name the columns in data
colnames(data)<-c("subjectID", "activity", featureNames)

## Group by subject and activity
meanData<-group_by(data, subjectID, activity)

## Summarize (mean) by all the variables that aren't groups
meanData<-summarize_all(meanData, mean)






