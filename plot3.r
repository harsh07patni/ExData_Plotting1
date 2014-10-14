library(dplyr)
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y");
newdata <- filter(data, Date=="2007-02-01" | Date =="2007-02-02")
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px")

cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(newdata$DateTime, newdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(newdata$DateTime, newdata$Sub_metering_2, type="l", col="red")
lines(newdata$DateTime, newdata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)


dev.off()