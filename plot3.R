#Load the data into workspace
data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")
#Selecting the rows with the specified dates
data<-data[data[,1]=="1/2/2007" | data[,1]=="2/2/2007",]
#Mixing the date and time into one variable
data$DateTime<-strptime(x = paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
#Using graphic device to get the plot
png(filename = "plot3.png",width = 480,height = 480)
#Plotting
{
plot(data$DateTime,data$Sub_metering_1,type = "l",col="black",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
}
#Creating the legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid")
#Turning the graphic device off manually
dev.off()