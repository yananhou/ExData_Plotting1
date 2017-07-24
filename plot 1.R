# Download and unzip the data

setwd("C:\\Users\\Hou\\Documents\\coursera\\Exploratory Data Analysis")
if(!file.exists('./data')) dir.create('./data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(fileUrl, destfile = './data/household_power_consumption.zip')

unzip('./data/household_power_consumption.zip', exdir = './data')


# read the Feb 01 and Feb 02, 2017 data

files <- file('./data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007", readLines(files), value=TRUE), 
                   sep = ';', col.names = c("Date", "Time", "Global_active_power", 
                  "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
                  "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


# Plot 1

hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
