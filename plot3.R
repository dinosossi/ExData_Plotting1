mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE)

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- as.Date(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)

subsetted <- filter(mydata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

with(subsetted, plot(Sub_metering_1, Sub_metering_2, type = "s", ylab="Energy sub metering", xlab="", pch='...'))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(subsetted, 
{
     plot(Sub_metering_1, type = "l", ylim = c(0,40), col="black", ylab="Energy sub metering", xlab="", pch='|')
     par(new=T)
     plot(Sub_metering_2, type = "l", ylim = c(0,40), col="red", ylab="Energy sub metering", xlab="", pch='|')
     par(new=T)
	 plot(Sub_metering_3, type = "l", ylim = c(0,40), col="blue", ylab="Energy sub metering", xlab="", pch='|')
     legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .35)
 }
 )
