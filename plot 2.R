# Plot 2

# Converting date and time formats

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plot

plot(data$DateTime, data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
