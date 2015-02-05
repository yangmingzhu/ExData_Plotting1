
#plot3
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL
mydata=subset(data, data$DateTime>=("2007-02-01") & data$DateTime<"2007-02-03")

png(filename="plot3.png", width=480, height=480)
plot(mydata$DateTime, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()
