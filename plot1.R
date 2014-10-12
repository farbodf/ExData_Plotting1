#Load the data into workspace
data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")
#Selecting the rows with the specified dates
data<-data[data[,1]=="1/2/2007" | data[,1]=="2/2/2007",]
#Using graphic device to get the plot
png(filename = "plot1.png",width = 480,height = 480)
#Plotting with hist function
hist(data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
#Turning the graphic device off manually
dev.off()
