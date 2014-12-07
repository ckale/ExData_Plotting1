#Read the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
#Convert Date and Time
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
#Select the subset data for required dates
data <- data[c(which(data$Date == as.Date("2007-02-01")),which(data$Date == as.Date("2007-02-02"))) ,]

#Generate the plot
png("plot3.png")

#Add energy sub metering plot
plot(data$Time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()