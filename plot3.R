# Read dataset
power <- read.csv("dataset/household_power_consumption.txt", header=T, sep=';', na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")                      

# Subset the data to include only those between 01 Feb 2007 and 02 Feb 2007
power_ss <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Combine Date and Time
date_and_time <- paste(power_ss$Date, power_ss$Time)
power_ss$DateTime <- strptime(date_and_time, "%Y-%m-%d %T")

# Plot mulptiple graphs 
with(power_ss, {
     plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n")
     points(DateTime, Sub_metering_1, type="l")
     points(DateTime, Sub_metering_2, type="l", col="red")
     points(DateTime, Sub_metering_3, type="l", col="blue")
})

# Insert legend
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
