# Read the data
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
                  colClasses = c(rep("character", 2), rep("numeric", 7)))

# Convert dates & times
power$datetime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for dates of interest
power <- power[as.Date(power$datetime) >= "2007-02-01" & as.Date(power$datetime) < "2007-02-03", ]

# Global Active Power histogram
png("plot1.png", width = 480, height = 480)

hist(power$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
