library(dplyr)

# Importing data
raw_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
raw_data<-tbl_df(raw_data)

# Applying data filter as per requirement
data<-subset(raw_data,raw_data$Date=="1/2/2007"|raw_data$Date=="2/2/2007")

# Plot creation
png("plot3.png", width=480, height=480)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="green",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_2, type="l", xlab="", ylab="",col="orange",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","orange","blue"))
dev.off()