# Read the data
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
                  colClasses = c(rep("character", 2), rep("numeric", 7)))

# Convert dates & times
power$datetime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for dates of interest
power <- power[as.Date(power$datetime) >= "2007-02-01" & as.Date(power$datetime) < "2007-02-03", ]

png("plot4.png", width = 480, height = 480)

# 2 x 2 plots
par("mfrow" = c(2, 2))

# Plot 1
plot(power$datetime, power$Global_active_power, type="l", ylab = "Global Active Power", xlab="")

# Plot 2
plot(power$datetime, power$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

# Plot 3
plot(power$datetime, power$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
points(power$datetime, power$Sub_metering_1, type="l")
points(power$datetime, power$Sub_metering_2, type="l", col="red")
points(power$datetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, bty = "n")

# Plot 4
plot(power$datetime, power$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()
