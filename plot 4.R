# Download and unzip the data
setwd("C:\\Users\\Hou\\Documents\\coursera\\Exploratory Data Analysis")
if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "./data/household_power_consumption.zip")

unzip("./data/household_power_consumption.zip", exdir = "./data")


# Read the Feb 01 and Feb 02, 2017 data
files <- file("./data/household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(files), value=TRUE), 
                   sep = ";", col.names = c("Date", "Time", "Global_active_power", 
                                            "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
                                            "Sub_metering_2", "Sub_metering_3"), na.strings = "?")


# Creat plot
par(mfrow = c(2, 2))

plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")

plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")


# Creat png file
png(filename = "plot 4", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")

plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")


# Close device
dev.off()
