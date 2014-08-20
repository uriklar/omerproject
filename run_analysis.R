#reading raw data files
trainParticipants<-as.vector(read.table(".\\train\\subject_train.txt", sep="\t", header=F, col.names="subject"))
x_train<-read.table(".\\train\\X_train.txt")
y_train<-as.vector(read.table(".\\train\\Y_train.txt", sep=" ", header=F,col.names="activity number"))
features<-read.table("features.txt") 
names(x_train)<-as.vector(features[,2]) #assign features' names
means<-x_train[,grep("mean",names(x_train))] #subsetting means features into "means"
stds<-x_train[,grep("std",names(x_train))] #subsetting std features into "stds"
train<-cbind(trainParticipants,means,stds,y_train) #merge datasets into 1 train dataset
#same for test
testParticipants<-as.vector(read.table(".\\test\\subject_test.txt", sep="\t", header=F,col.names="subject"))
x_test<-read.table(".\\test\\X_test.txt")
y_test<-as.vector(read.table(".\\test\\Y_test.txt", sep=" ", header=F, col.names="activity number"))
features<-read.table("features.txt")
names(x_test)<-as.vector(features[,2])
means<-x_test[,grep("mean",names(x_test))]
stds<-x_test[,grep("std",names(x_test))]
test<-cbind(testParticipants,means,stds,y_test)
#merge train and test data
data<-rbind(train,test)
activities<-read.table("activity_labels.txt",col.names=c("activity number", "activity name"))
data=merge(data,activities,all=F)
data<-data[,-1] #remove activity number
agg<-aggregate(. ~ subject + activity.name, data = data,FUN = mean) #aggregate oer subject and activity
write.table(agg,"agg.txt", sep="\t",row.names=F)
rm(list=setdiff(ls(), c("agg","data")))
