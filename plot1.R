mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE)

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- as.Date(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)

subsetted <- filter(mydata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))


hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red", yaxt="n", xaxt="n", cex.lab=0.8)
     axis(2, xaxp=c(0, 1200, 200), cex.axis=.9)     
     axis(1, xaxp=c(0, 6, 3), cex.axis=.9)