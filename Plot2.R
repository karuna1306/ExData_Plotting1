library(dplyr)

# Importing data
raw_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
raw_data<-tbl_df(raw_data)

# Applying data filter as per requirement
data<-subset(raw_data,raw_data$Date=="1/2/2007"|raw_data$Date=="2/2/2007")
GlobalActivePower_raw<-data$Global_active_power

# Numeric values only
GlobalActivePower<-as.numeric(as.character(GlobalActivePower_raw))

# Plot creation
png("plot2.png", width=480, height=480)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()