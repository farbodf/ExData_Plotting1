#Load the data into workspace
data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")
#Selecting the rows with the specified dates
data<-data[data[,1]=="1/2/2007" | data[,1]=="2/2/2007",]
#Mixing the date and time into one variable
data$DateTime<-strptime(x = paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
#Using graphic device to get the plot
png(filename = "plot4.png",width = 480,height = 480)
#Plotting
par(mfrow=c(2,2))
with(data , {
  plot(data$DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(data$DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage")
  {
    plot(data$DateTime,data$Sub_metering_1,type = "l",col="black",xlab="",ylab="Energy sub metering")
    lines(data$DateTime,data$Sub_metering_2,col="red")
    lines(data$DateTime,data$Sub_metering_3,col="blue")
  }
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid")
  plot(data$DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
#Turning the graphic device off manually
dev.off()