require(reshape)

########################
#trainnig data sets
########################

#reading data sets from work directory

dat1_train<-read.table("subject_train.txt",header=TRUE)
dat2_train<-read.table("X_train.txt",header=TRUE)
dat3_train<-read.table("y_train.txt",header=TRUE)
feat_train<-read.table("features.txt",header=FALSE)

#keeping colones with mean and std and replacing characters
ft<-as.character(feat_train$V2)
names(dat2_train)<-ft

#mean
vec1<-which(grepl("-mean",ft)==TRUE)
data11<-dat2_train[,vec1]

#std
vec2<-which(grepl("-std",ft)==TRUE)
data12<-dat2_train[,vec2]

#adding colone subject and colone activity
data13<-data.frame(dat1_train,dat3_train,data11,data12)

#renaming colones
data13<-rename(data13,c(X1="subject",X5="activity"))

##########################
#test data sets
##########################

#reading data sets from work directory

dat1_test<-read.table("subject_test.txt",header=TRUE)
dat2_test<-read.table("X_test.txt",header=TRUE)
dat3_test<-read.table("y_test.txt",header=TRUE)
feat_test<-read.table("features.txt",header=FALSE)

#keeping colones with mean and std and replacing characters
ft<-as.character(feat_test$V2)
names(dat2_test)<-ft

#mean
vec1t<-which(grepl("-mean",ft)==TRUE)
data21<-dat2_test[,vec1t]

#std
vec2t<-which(grepl("-std",ft)==TRUE)
data22<-dat2_test[,vec2t]

#adding colone subject and colone activity
data23<-data.frame(dat1_test,dat3_test,data21,data22)

#renaming colones
data23<-rename(data23,c(X2="subject",X5="activity"))

##################################################################
# merging and arranging data according to subjects and activities
##################################################################
data<-merge(data13,data23,all=TRUE)

#Descriptive acitivity names
data$activity <- as.factor(data$activity)
ac_lab<-read.table("activity_labels.txt",header=F)
levels(data$activity)<-ac_lab$V2

#saving tidy dataset
write.table(data,file="mydata.txt",sep=" ")

##############################
#new dataset for averages
#############################

data2<-aggregate(data[,3:81],by=list(data$subject,data$activity),FUN="mean",simplify = TRUE)

#renaming colones
data2<-rename(data2,c(Group.1="subject",Group.2="activity"))

#saving the data set of averages
write.table(data,file="mydata2.txt",sep=" ")


