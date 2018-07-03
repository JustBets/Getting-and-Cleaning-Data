This is the the repository for the Peer-graded Assignment: Getting and Cleaning Data Course Project.
It contains the following files:
    
    README.md - This file
    
    codebook.md - Description of the variables created by the run_analysis.R script
    
    run_analysis.R - This script assumes that the UCI HAR Dataset is in the working directory. The script
    reads in the data, and combines it into one tidy dataset that contains only the mean and standard
    deviation features. A second tidy dataset is created that contains a summary of the features in the
    previous dataset, grouped by subject and activity and then summarized by mean.
    
    The tidy dataset that contains the mean of each feature by subject and activity can be created
    by writing the variable meanData to a table by write.table(meanData, "output.txt", row.names = FALSE)
    