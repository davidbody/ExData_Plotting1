# Read the data
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
                  colClasses = c(rep("character", 2), rep("numeric", 7)))

# Convert dates & times
power$datetime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for dates of interest
power <- power[as.Date(power$datetime) >= "2007-02-01" & as.Date(power$datetime) < "2007-02-03", ]

# Energy sub metering by date/time
png("plot3.png", width = 480, height = 480)

plot(power$datetime, power$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
points(power$datetime, power$Sub_metering_1, type="l")
points(power$datetime, power$Sub_metering_2, type="l", col="red")
points(power$datetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1)

dev.off()
