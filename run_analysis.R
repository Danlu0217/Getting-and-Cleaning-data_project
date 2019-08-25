#read data files: value file from "test" folder and another file from "train" file
a<-read.table("test/X_test.txt")
c<-read.table("train/X_train.txt")
b<-read.table("test/y_test.txt")
d<-read.table("train/Y_train.txt")
#MERGE files together (same column, therefore use rbind)
newData<-rbind(a,c)
#Get where/in which column "Mean()" functions are located from features file
features<-read.table("features.txt")
#serach for functions
meanV<-grep("mean",features$V2)
#Get the name for the activity
NameMean<-features$V2[meanV]
#Get all the data with mean functions from the new merged files
mean_tot<-newData[,meanV]
NameMean1<-as.character(NameMean)
#Get all the data with mean functions from the new merged files
mean_tot<-newData[,meanV]
#Get std columns
stdV<-grep("std",features$V2)
#Get the activity namesNamestd<-features$V2[stdV]
Namestd<-features$V2[stdV]
Namestd1<-as.character(Namestd)
#Make a label vector
label<-c(NameMean1,Namestd1)
#Get merged activity number labels
ActNum<-rbind(b,d)
actnum<-ActNum[,1]
#Get all the data with std functions from the new merged files
std_tot<-newData[,stdV]
#Final merged file with means and standard deviations
newtable1<-cbind(mean_tot,std_tot)
names(newtable1)<-label
#Make actviity names
newn1<-gsub("1","WALKING",actnum)
newn2<-gsub("2","WALKING_UPSTAIRS",newn1)
newn3<-gsub("3","WALKING_DOWNSTAIRS",newn2)
newn4<-gsub("4","SITTING",newn3)
newn5<-gsub("5","STANDING",newn4)
newn6<-gsub("6","LAYING",newn5)
actname<-as.factor(newn6)
#Put  activity name in the new table as a column
library(dplyr)
finaltable1<-mutate(newtable1,actname)







