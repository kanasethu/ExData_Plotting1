# Read dataset
power <- read.csv("dataset/household_power_consumption.txt", header=T, sep=';', na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")                      

# Subset the data to include only those between 01 Feb 2007 and 02 Feb 2007
power_ss <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Combine Date and Time
date_and_time <- paste(power_ss$Date, power_ss$Time)
power_ss$DateTime <- strptime(date_and_time, "%Y-%m-%d %T")

# Create a histogram of Global Active Power
plot(power_ss$DateTime, power_ss$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)") 

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
