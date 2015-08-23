Code Book for run_analysis.R
===========================================
run_analysis.R reorganises the body movement data files collected in the UCI HAR dataset, and generates a tidy data ('tidy data' thereafter in the Code Book) based on the original HAR dataset.



Variables
--------------
The tidy data contains 81 variables:

- activity: The descriptive names of the activity when the measure was taken.

- subjectID: The ID for the subject who carried out the activity when the measurement was taken.

- 79 measurements on body movement: The average of the measurements on mean and standard deviation, extracted from all the measures described in 'features_info.txt'.


Records
--------------
The tidy data contains 180 records, grouped by 6 types of activity and for 30 different subjects.


Transformations on the original HAR dataset
--------------
The following transformations were carried out in run_analysis.R:

- Reading all the necessary .txt files into R as data frames;

- Merging the train and test data;

- Matching the feature name vector with the column names in the merged data, and extracting only the measurements on mean and standard deviation;

- Matching the subject ID and the activity labels with each row in the extracted data;

- Replacing the activity labels with descriptive activity names;

- Calculating the average of each measurement, grouped by each activity and each subject.

