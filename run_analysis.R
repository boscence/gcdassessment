setwd("/home/ab/Dropbox/projects/JHU_DataScience/gcd/gcdassessment/data")

###load in the required data set
testset = read.table("X_test.txt", comment.char = "", colClasses="numeric")
trainset = read.table("X_train.txt", comment.char = "", colClasses="numeric")

###now load we are loading in the required labels
testlabs = read.table("y_test.txt", comment.char = "", colClasses="numeric")
trainlabs = read.table("y_train.txt", comment.char = "", colClasses="numeric")
testsub = read.table("subject_test.txt", comment.char = "", colClasses="numeric")
trainsub = read.table("subject_train.txt", comment.char = "", colClasses="numeric")
featuresetlabs = read.table("features.txt")

###this code adds appropriate lables to the dataset
colnames(testlabs) = c("activityCode")
colnames(trainlabs) = c("activityCode")
colnames(testsub) = c("subjectCode")
colnames(trainsub) = c("subjectCode")
colnames(testset) = featuresetlabs[,2]
colnames(trainset) = featuresetlabs[,2]

###now we are merging the test labels to the test data
testset = cbind(testlabs,testsub,testset)

###now we are merging the train labels to the train data
trainset = cbind(trainlabs,trainsub,trainset)

###we now want to add a new field identifying if the dataset is training or test
###we do this because we are about the merge (rbind) the datasets and we need to know 
###which dataset is test or train.
trainset$setType = "train" 
testset$setType = "test"


###we need to make one data set, so this next code combines the data (rbind)
ttset = rbind(trainset,testset)

###our next step is to turn the activity codes into desfriptions
###so we create a new field based on the activity codes
ttset$activityDesc = ttset$activityCode
###and convert this into factors 
ttset$activityDesc = as.factor(ttset$activityDesc)

#now we sub the factor codes to their descriptions
ttset$activityDesc = gsub("1", "Walking", ttset$activityDesc)
ttset$activityDesc = gsub("2", "WALKING_UPSTAIRS", ttset$activityDesc)
ttset$activityDesc = gsub("3", "WALKING_DOWNSTAIRS", ttset$activityDesc)
ttset$activityDesc = gsub("4", "SITTING", ttset$activityDesc)
ttset$activityDesc = gsub("5", "STANDING", ttset$activityDesc)
ttset$activityDesc = gsub("6", "LAYING", ttset$activityDesc)

###we now want our dataset to only include the columns containing only mean and std values
###the following code selects only the columns containin "std" and "mean"
meanlab=grep("mean", names(ttset)) 
stdlab=grep("std", names(ttset))
stdmean = c(1,2,563,564,565,meanlab,stdlab)
ttset = subset(ttset[,(stdmean)])

###we now want to clean the column names and replace the "dirty names" with the cleaned names
names = names(ttset)
names = sub("\\()","",names)
names = sub("-","",names)
names = sub("mean","MEAN",names)
names = sub("std","STD",names)
names = sub("-","",names)
colnames(ttset) = names
tidy = ttset


###now to make tidyset 2
###we have to add the library
library(reshape2)
###next we melt the data by subject and activity 
ttset2 = melt(ttset,id=c("subjectCode","activityCode"),variable.name="activity",value.name="value")
###change the type of value of "value" to a numeric
ttset2$value=as.numeric(ttset2$value)
###cast the data
tidy2 = dcast(ttset2, subjectCode + activityCode ~ activity, fun.aggregate=mean)


write.csv(tidy, "tidy.csv", row.names=T)
write.csv(tidy2, "tidy2.csv", row.names=T)
