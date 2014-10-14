library(dplyr)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y");
newdata <- filter(data, Date=="2007-02-01" | Date =="2007-02-02")
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time), "%Y-%m-%d %H:%M:%S")


hist(newdata$Global_active_power, col="Red",main ="Global Active Power",xlab = "Global Active Power (kilowatts)")
