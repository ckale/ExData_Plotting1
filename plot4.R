#Read the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
#Convert Date and Time
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
#Select the subset data for required dates
data <- data[c(which(data$Date == as.Date("2007-02-01")),which(data$Date == as.Date("2007-02-02"))) ,]

#Generate the plot
png("plot4.png")

#Set layout and margins
par(mfrow=c(2,2))
par(mar=c(4,4,1,1))

#Add global active power plot
plot(data$Time,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")

#Add voltage plot
plot(data$Time,data$Voltage,type="l",ylab="Voltage",xlab="datetime")

#Add energy sub metering plot
plot(data$Time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty = "n")

#Add global reactive power plot
plot(data$Time,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()