## Fourth script (Plot4.R) for the Course Project 1 of 
## Exploratory Data Analysis (COURSERA)

## Vector names
colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Load data file in R
data <- read.table("data/household_power_consumption.txt", sep=";", col.names=colnames, na.strings = "?", colClasses = "character", skip = 1)

# Convert date and time from character to R Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting data
day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")
data2 <- data[((data$Date == day1) | (data$Date == day2)), ]

# Convert columns as numeric
data2[, c(3:9)] <- sapply(data2[, c(3:9)], as.numeric)

# Put togheter Date and Time to abotain the day of the week information
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

# Open device
png(file = "plot4.png", width=480, height=480)

# Divide the canvas in four pads
par(mfrow = c(2,2))

# Create the plots
# 1
plot(data2$Global_active_power~data2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#2
plot(data2$Voltage~data2$Datetime, type="l", ylab="Voltage", xlab="datetime")
#3
plot(data2$Sub_metering_1~data2$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(data2$Sub_metering_2~data2$Datetime, col = "red")
lines(data2$Sub_metering_3~data2$Datetime, col = "blue")
legend("topright", col = c("black","red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0)
# 4
plot(data2$Global_reactive_power~data2$Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")

# Close the device
dev.off()

