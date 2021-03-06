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

# Converting date and time formats
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


# Create plot
plot(data$DateTime, data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")


# Create png file
png(filename = "plot 2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")


# Close device
dev.off()

