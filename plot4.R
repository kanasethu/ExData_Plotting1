# Read dataset
power <- read.csv("dataset/household_power_consumption.txt", header=T, sep=';', na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")                      

# Subset the data to include only those between 01 Feb 2007 and 02 Feb 2007
power_ss <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Combine Date and Time
date_and_time <- paste(power_ss$Date, power_ss$Time)
power_ss$DateTime <- strptime(date_and_time, "%Y-%m-%d %T")

# Plot mulptiple graphs in a screen
par(mfrow = c(2,2), mar=c(4,2,2,0), oma=c(0,0,0,0))
with(power_ss, {
     plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
     plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
     plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n")
     points(DateTime, Sub_metering_1, type="l")
     points(DateTime, Sub_metering_2, type="l", col="red")
     points(DateTime, Sub_metering_3, type="l", col="blue")
     legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

# Insert legend

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
