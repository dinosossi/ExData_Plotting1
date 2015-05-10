mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE)

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- as.Date(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)

subsetted <- filter(mydata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

with(subsetted, plot(Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="", pch='|'))
