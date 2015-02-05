
#plot1
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL
mydata=subset(data, data$DateTime>=("2007-02-01") & data$DateTime<"2007-02-03")

png(filename="plot1.png", width=480, height=480)
hist(mydata$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=range(0,1200))
dev.off()
