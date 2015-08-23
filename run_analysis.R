#Please load the following packages, in the following order, BEFORE running the script:
#plyr
#dplyr

#Please place the R script into path "...\UCI HAR Dataset\" and set the path as working directory.

#Reading the txt files into R
x_train <- read.table("./train/X_train.txt", header = FALSE)
y_train <- read.table("./train/y_train.txt", header = FALSE)
sub_train <- read.table("./train/subject_train.txt", header = FALSE)
x_test <- read.table("./test/X_test.txt", header = FALSE)
y_test <- read.table("./test/y_test.txt", header = FALSE)
sub_test <- read.table("./test/subject_test.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)
activity_names <- read.table("activity_labels.txt", header = FALSE)

#Labeling the columms by descriptive measurement names
features <- select(features,V2) %>% t
colnames(x_train) <- features
colnames(x_test) <- features

#Merging the training and the test to create sheet1
sheet1 <- rbind(x_train, x_test)

#Extracting only the measurements on the mean and standard deviation for each measurement, leaving with sheet1_extr
pat <- c("mean()","std()")
#The idea to remove these duplicate columns: https://class.coursera.org/getdata-031/forum/thread?thread_id=214
sheet1 <- sheet1[,-(303:344)] 
sheet1_extr <- select(sheet1, grep(paste(pat, collapse = "|"), names(sheet1)))

#Putting together the variable columns and the activity and subjectID columns
names(y_train)[names(y_train) == "V1"] <- "activity"
names(sub_train)[names(sub_train) == "V1"] <- "subjectID"
names(y_test)[names(y_test) == "V1"] <- "activity"
names(sub_test)[names(sub_test) == "V1"] <- "subjectID"
subject_col <- rbind(sub_train, sub_test)
activity_col <- rbind(y_train,y_test)
sheet1_extr <- cbind(subject_col, activity_col, sheet1_extr)

#Using descriptive activity names to name the activities in the data set
activity_names <- activity_names[sheet1_extr$activity,2]
sheet1_extr$activity <- activity_names

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
sheet1_extr %>%
  group_by(activity,subjectID) %>%
  summarise_each(funs(mean)) -> sheet_tidy

write.table(sheet_tidy,"sheet_tidy.csv")

rm(activity_col, features, sheet1, sheet1_extr, sub_test, sub_train, subject_col, test, train, x_test, x_train, y_test, y_train, pat, activity_names)
detach("package:plyr", unload = TRUE)
detach("package:dplyr", unload = TRUE)