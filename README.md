gcdassessment
=============
 This readme explains how all of the scripts work and how they are connected for the run.analysis.R script.
 The script makes 3 files "tidy.txt" and "tidy2.txt", which only include only data fields/columns and values 
 that are the mean and standard deviation from the raw data.
 
The Data
The data the used is from accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the 
data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the raw data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The Script Processes Tidy.txt
The script merges the training and the test sets to create one data set.

To do this, it was necessary to combine activity codes and subject 
codes to the test and training sets (cbind). Once the test and training sets were clean, they were combined (rbind).

All field names were cleaned, removing "()" and "-" symbols.

The Script Processes Tidy2.txt
Tidy2.txt takes tidy 1 and works outputs the mean for all values by each activity and subject combination. 

Tidy2.txt used melt and dcast on activity and subject to get the final output.
