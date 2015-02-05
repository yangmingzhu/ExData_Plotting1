
#plot4
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL
mydata=subset(data, data$DateTime>=("2007-02-01") & data$DateTime<"2007-02-03")

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
plot(mydata$DateTime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(mydata$DateTime, mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(mydata$DateTime, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty="n")
plot(mydata$DateTime, mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

