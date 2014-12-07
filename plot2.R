#Read the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
#Convert Date and Time
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
#Select the subset data for required dates
data <- data[c(which(data$Date == as.Date("2007-02-01")),which(data$Date == as.Date("2007-02-02"))) ,]

#Generate the plot
png("plot2.png")

#Add global active power plot
plot(data$Time,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()