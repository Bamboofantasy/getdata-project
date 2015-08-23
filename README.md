run_analysis.R for UCI HAR dataset
==============================================
The R code cleans and analyzes the original data in UCI HAR dataset.

**Please note:**

 - Please load plyr and dplyr packages before running the script.
 
 - Place the code under the folder "UCI HAR Dataset" and set the folder as working directory.
 
 What the code does
 ==================
 - Reads the txt files in the original dataset into R as data frames for subsequent analysis;
 
 - Merges x_train.txt and x_test.txt and lables the columns with descriptive measurements listed in features.txt;
 
 - Names the rows with subject IDs (listed in subject_train.txt and subject_test.txt) and activity IDs (listed in y_train.txt and y_test.txt);
 
 - Adds two columns for subjectID and activity ID;
 
 - Replaces the activity ID with descriptive activity names (listed in activity_labels.txt)
 
 - Extracts only the measurements on mean and standard deviation;
 
 - Generates sheet_tidy.txt, for the mean for each measurements grouped by activity and subject.