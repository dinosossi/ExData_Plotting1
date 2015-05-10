mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE)

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- as.Date(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)

subsetted <- filter(mydata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 

with(subsetted, {
     plot(Global_active_power, type = "l", ylab="Global Active Power", xlab="", pch='|', yaxt="n", xaxt="n", cex.lab=0.75)
     axis(2,cex.axis=.5)     
     axis(1,cex.axis=.5)

     plot(Voltage, type = "l", ylab="Voltage", xlab="datetime", pch='|', yaxt="n", xaxt="n", cex.lab=0.75)
     axis(2,cex.axis=.5)     
     axis(1,cex.axis=.5)
     
     plot(Sub_metering_1, type = "l", ylim = c(0,40), col="black", ylab="Energy sub metering", xlab="", pch='|', yaxt="n", xaxt="n", cex.lab=0.75)
     axis(2,cex.axis=.5)     
     axis(1,cex.axis=.5)
     par(new=T)
     plot(Sub_metering_2, type = "l", ylim = c(0,40), col="red", ylab="Energy sub metering", xlab="", pch='|', yaxt="n", xaxt="n", cex.lab=0.75)
     axis(2,cex.axis=.5)     
     axis(1,cex.axis=.5)
     par(new=T)
	 plot(Sub_metering_3, type = "l", ylim = c(0,40), col="blue", ylab="Energy sub metering", xlab="", pch='|', yaxt="n", xaxt="n", cex.lab=0.75)
	 axis(2,cex.axis=.5)     
     axis(1,cex.axis=.5)
     legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .35)
        
     plot(Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime", pch='|', yaxt="n", xaxt="n", cex.lab=0.75)
     axis(2,cex.axis=.5)     
     axis(1,cex.axis=.5)
}
)
