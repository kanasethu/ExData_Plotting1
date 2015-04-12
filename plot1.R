# Read dataset
power <- read.csv("dataset/household_power_consumption.txt", header=T, sep=';', na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")                      

# Subset the data to include only those between 01 Feb 2007 and 02 Feb 2007
power_ss <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create a histogram of Global Active Power
hist(power_ss$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save graph
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
