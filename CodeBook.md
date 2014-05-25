#Code book for run_analysis.R

##The Data ##

tidy.txt is a merger of test and training data from research conducted by
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 


tidy.txt extracts only the measurements on the mean and standard deviation for each measurement. 
tidy.txt has chaged the descriptive activity names to name the activities in the data set
tidy.txt has appropriately changed the labels in the data set to descriptive activity names. 

tidy.txt is a second, independent tidy data set with the average of each variable for each activity and each subject. 

Both tidy and tidy2 are created with one scipt, run_analysis.R

##The processes##
###Loading Data

Data was loaded usign the read.table function.

The x_test.txt and x_train.txt files were loaded.

###Adding lables
In order to add labels and append the subject and activity codes

y_test.txt, y_train.txt, subject_test.txt, subject_train.txt and features.txt were loaded.

The column names of these data were changed.

Both test and train recieved a lable to identify which record is from which set.
This data was then combined with the test and train data set with the cbind function.

trainset$setType = "train" 
testset$setType = "test"


###Combining the test and train data sets
These files were combined using rbind.

###A text desciption was then added to the dataset to the activity code to make it meaningful
ttset$activityDesc = gsub("1", "Walking", ttset$activityDesc)
ttset$activityDesc = gsub("2", "WALKING_UPSTAIRS", ttset$activityDesc)
ttset$activityDesc = gsub("3", "WALKING_DOWNSTAIRS", ttset$activityDesc)
ttset$activityDesc = gsub("4", "SITTING", ttset$activityDesc)
ttset$activityDesc = gsub("5", "STANDING", ttset$activityDesc)
ttset$activityDesc = gsub("6", "LAYING", ttset$activityDesc)

### Mean and STD columns extracted
only the measurements on the mean and standard deviation for each measurement
So the script looks for column headings that contain the string "mean" and "std". This was done using grep
All other columns, apart from the activity and subject codes were not passed to tidy.txt or tidy2.txt

###Column names were cleaning
The following characters were removed from the column
 "-" and "()"
 the word "mean" and "std" were put into capital
 
###Export tidy.txt
The result of the scrpt so far was exported to tidy.txt
 
###Creating tidy 2
Tidy 2 required the average of each variable for each activity and each subject.
This was done first using melt on subject and activity.
Then dcast was used, again of subject and activity to get the average of each variable for each activity and each subject
 
##variables for tidy##
"activityCode"

"subjectCode"

"angle(Z,gravityMean)"

"setType"

"activityDesc"

"tBodyAccMEANX"

"tBodyAccMEANY"

"tBodyAccMEANZ"

"tGravityAccMEANX"

"tGravityAccMEANY"

"tGravityAccMEANZ"

"tBodyAccJerkMEANX"

"tBodyAccJerkMEANY"

"tBodyAccJerkMEANZ"

"tBodyGyroMEANX"

"tBodyGyroMEANY"

"tBodyGyroMEANZ"

"tBodyGyroJerkMEANX"

"tBodyGyroJerkMEANY"

"tBodyGyroJerkMEANZ"

"tBodyAccMagMEAN"

"tGravityAccMagMEAN"

"tBodyAccJerkMagMEAN"

"tBodyGyroMagMEAN"

"tBodyGyroJerkMagMEAN"

"fBodyAccMEANX"

"fBodyAccMEANY"

"fBodyAccMEANZ"

"fBodyAccMEANFreqX"

"fBodyAccMEANFreqY"

"fBodyAccMEANFreqZ"

"fBodyAccJerkMEANX"

"fBodyAccJerkMEANY"

"fBodyAccJerkMEANZ"

"fBodyAccJerkMEANFreqX"

"fBodyAccJerkMEANFreqY"

"fBodyAccJerkMEANFreqZ"

"fBodyGyroMEANX"

"fBodyGyroMEANY"

"fBodyGyroMEANZ"

"fBodyGyroMEANFreqX"

"fBodyGyroMEANFreqY"

"fBodyGyroMEANFreqZ"

"fBodyAccMagMEAN"

"fBodyAccMagMEANFreq"

"fBodyBodyAccJerkMagMEAN"

"fBodyBodyAccJerkMagMEANFreq"

"fBodyBodyGyroMagMEAN"

"fBodyBodyGyroMagMEANFreq"

"fBodyBodyGyroJerkMagMEAN"

"fBodyBodyGyroJerkMagMEANFreq"

"tBodyAccSTDX"

"tBodyAccSTDY"

"tBodyAccSTDZ"

"tGravityAccSTDX"

"tGravityAccSTDY"

"tGravityAccSTDZ"

"tBodyAccJerkSTDX"

"tBodyAccJerkSTDY"

"tBodyAccJerkSTDZ"

"tBodyGyroSTDX"

"tBodyGyroSTDY"

"tBodyGyroSTDZ"

"tBodyGyroJerkSTDX"

"tBodyGyroJerkSTDY"

"tBodyGyroJerkSTDZ"

"tBodyAccMagSTD"

"tGravityAccMagSTD"

"tBodyAccJerkMagSTD"

"tBodyGyroMagSTD"

"tBodyGyroJerkMagSTD"

"fBodyAccSTDX"

"fBodyAccSTDY"

"fBodyAccSTDZ"

"fBodyAccJerkSTDX"

"fBodyAccJerkSTDY"

"fBodyAccJerkSTDZ"

"fBodyGyroSTDX"

"fBodyGyroSTDY"

"fBodyGyroSTDZ"

"fBodyAccMagSTD"

"fBodyBodyAccJerkMagSTD"

"fBodyBodyGyroMagSTD"

"fBodyBodyGyroJerkMagSTD"



##variables for tidy2##

"subjectCode"

"activityCode"

"angle(Z,gravityMean)"

"setType"

"activityDesc"

"tBodyAccMEANX"

"tBodyAccMEANY"

"tBodyAccMEANZ"

"tGravityAccMEANX"

"tGravityAccMEANY"

"tGravityAccMEANZ"

"tBodyAccJerkMEANX"

"tBodyAccJerkMEANY"

"tBodyAccJerkMEANZ"

"tBodyGyroMEANX"

"tBodyGyroMEANY"

"tBodyGyroMEANZ"

"tBodyGyroJerkMEANX"

"tBodyGyroJerkMEANY"

"tBodyGyroJerkMEANZ"

"tBodyAccMagMEAN"

"tGravityAccMagMEAN"

"tBodyAccJerkMagMEAN"

"tBodyGyroMagMEAN"

"tBodyGyroJerkMagMEAN"

"fBodyAccMEANX"

"fBodyAccMEANY"

"fBodyAccMEANZ"

"fBodyAccMEANFreqX"

"fBodyAccMEANFreqY"

"fBodyAccMEANFreqZ"

"fBodyAccJerkMEANX"

"fBodyAccJerkMEANY"

"fBodyAccJerkMEANZ"

"fBodyAccJerkMEANFreqX"

"fBodyAccJerkMEANFreqY"

"fBodyAccJerkMEANFreqZ"

"fBodyGyroMEANX"

"fBodyGyroMEANY"

"fBodyGyroMEANZ"

"fBodyGyroMEANFreqX"

"fBodyGyroMEANFreqY"

"fBodyGyroMEANFreqZ"

"fBodyAccMagMEAN"

"fBodyAccMagMEANFreq"

"fBodyBodyAccJerkMagMEAN"

"fBodyBodyAccJerkMagMEANFreq"

"fBodyBodyGyroMagMEAN"

"fBodyBodyGyroMagMEANFreq"

"fBodyBodyGyroJerkMagMEAN"

"fBodyBodyGyroJerkMagMEANFreq"

"tBodyAccSTDX"

"tBodyAccSTDY"

"tBodyAccSTDZ"

"tGravityAccSTDX"

"tGravityAccSTDY"

"tGravityAccSTDZ"

"tBodyAccJerkSTDX"

"tBodyAccJerkSTDY"

"tBodyAccJerkSTDZ"

"tBodyGyroSTDX"

"tBodyGyroSTDY"

"tBodyGyroSTDZ"

"tBodyGyroJerkSTDX"

"tBodyGyroJerkSTDY"

"tBodyGyroJerkSTDZ"

"tBodyAccMagSTD"

"tGravityAccMagSTD"

"tBodyAccJerkMagSTD"

"tBodyGyroMagSTD"

"tBodyGyroJerkMagSTD"

"fBodyAccSTDX"

"fBodyAccSTDY"

"fBodyAccSTDZ"

"fBodyAccJerkSTDX"

"fBodyAccJerkSTDY"

"fBodyAccJerkSTDZ"

"fBodyGyroSTDX"

"fBodyGyroSTDY"

"fBodyGyroSTDZ"

"fBodyAccMagSTD"

"fBodyBodyAccJerkMagSTD"

"fBodyBodyGyroMagSTD"

"fBodyBodyGyroJerkMagSTD"



