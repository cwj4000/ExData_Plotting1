x<-read.table("household_power_consumption.txt",header=T,sep=";")
x[,1]<-as.Date(x[,1],"%d/%m/%Y")
data<-x[x$Date>=as.Date("2007-02-01")&x$Date<=as.Date("2007-02-02"),]
data[,3]<-as.numeric(as.character(data[,3]))
data[,4]<-as.numeric(as.character(data[,4]))
data[,5]<-as.numeric(as.character(data[,5]))
data[,7]<-as.numeric(as.character(data[,7]))
data[,8]<-as.numeric(as.character(data[,8]))
data[,9]<-as.numeric(as.character(data[,9]))
z<-paste(data[,1],data[,2])
z1<-strptime(z,"%Y-%m-%d %H:%M:%S")

quartz()
plot(z1,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(z1,data$Sub_metering_2,col="red")
lines(z1,data$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex=0.6,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,file="plot3.png",width=480,height=480,units="px")
dev.off()