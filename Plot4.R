
library(dplyr)

raw_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
raw_data<-tbl_df(raw_data)
data<-subset(raw_data,raw_data$Date=="1/2/2007"|raw_data$Date=="2/2/2007")
GlobalActivePower_raw<-data$Global_active_power
GlobalActivePower<-as.numeric(as.character(GlobalActivePower_raw))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, d, type="l", xlab="", ylab="Global Active Power (kilowatts)")
Voltage_raw<-as.numeric(as.character(data$Voltage))
plot(datetime, Voltage_raw, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="green",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_2, type="l", xlab="", ylab="",col="orange",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","orange","blue"),cex=0.5)

GlobalReactivePower<-as.numeric(as.character(data$Global_reactive_power))
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()