Skip to content
 
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@Danlu0217 
Learn Git and GitHub without any code!
Using the Hello World guide, you’ll start a branch, write comments, and open a pull request.

 
1
0 0 Danlu0217/Getting-and-Cleaning-data_project
 Code  Issues 0  Pull requests 0  Projects 0  Wiki  Security  Insights  Settings
Getting-and-Cleaning-data_project/secondRscript.R
@Danlu0217 Danlu0217 Update secondRscript.R
c096ce3 14 hours ago
69 lines (67 sloc)  2.47 KB
    
#read data files: value file from "test" folder and another file from "train" file
a<-read.table("test/X_test.txt")
c<-read.table("train/X_train.txt")
b<-read.table("test/y_test.txt")
d<-read.table("train/Y_train.txt")
#MERGE files together (same column, therefore use rbind)
newData<-rbind(a,c)
#Get where/in which column "Mean()" functions are located from features file
features<-read.table("features.txt")
#serach for functions,excluding "meanFreq"
meanV<-grep("\\<mean\\>",features$V2)
#Get the name for the activity
NameMean<-features$V2[grep("\\<mean\\>",features$V2)]
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
newM<-colMeans(newtable1)
data1<-finaltable1[finaltable1$actname=="WALKING",]
data2<-finaltable1[finaltable1$actname=="WALKING_UPSTAIRS",]
data3<-finaltable1[finaltable1$actname=="WALKING_DOWNSTAIRS",]
data4<-finaltable1[finaltable1$actname=="SITTING",]
data5<-finaltable1[finaltable1$actname=="STANDING",]
data6<-finaltable1[finaltable1$actname=="LAYING",]
#mean for WALKING for each measurement
d1mean<-colMeans(data1[,1:66])
#Mean for WALKING_UPSTAIRS
d2mean<-colMeans(data2[,1:66])
#Mean for WALKING_DOWNSTAIRS
d3mean<-colMeans(data3[,1:66])
#Mean for SITTING
d4mean<-colMeans(data4[,1:66])
#Mean for STANDING
d5mean<-colMeans(data5[,1:66])
#Mean for LAYING
d6mean<-colMeans(data6[,1:66])
meandata<-data.frame(d1mean,d2mean,d3mean,d4mean,d5mean,d6mean)
act<-c("WALKING","WALKING_UPSTAIRS","#WALKING_DOWNSTAIRS","SITING","STANDING","LAYING")
#Rename the columns
names(meandata)<-act


