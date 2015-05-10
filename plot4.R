mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE)

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- as.Date(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)

subsetted <- filter(mydata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 

with(subsetted, {
     plot(Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", pch='|')
     plot(Voltage, ylab="Voltage", xlab="datetime", pch='|')
     plot(Sub_metering_1, Sub_metering_2, ylab="Energy sub metering", xlab="", pch='|')
         legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_active_power, ylab="Global_active_power", xlab="datetime", pch='|')
})
