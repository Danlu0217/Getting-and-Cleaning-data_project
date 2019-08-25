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
#Get std columns
stdV<-grep("std",features$V2)
#Get the activity names
Namestd<-features$V2[stdV]
#Get all the data with std functions from the new merged files
std_tot<-newData[,stdV]
#Final merged file with means and standard deviations
newtable1<-cbind(mean_tot,std_tot)
