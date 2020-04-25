library(dplyr)

# Importing data
raw_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
raw_data<-tbl_df(raw_data)

# Applying date filter as per requirement
data<-subset(raw_data,raw_data$Date=="1/2/2007"|raw_data$Date=="2/2/2007")
GlobalActivePower_raw<-data$Global_active_power

# Numeric values only
GlobalActivePower<-as.numeric(as.character(GlobalActivePower_raw))

# Plot creation
png("plot1.png",width=480,height=480)
hist(GlobalActivePower,main="Global Active Power",xlab="Global Active Power (kilowatt)", ylab="Frequency",col="red")
dev.off()
