## Second script (Plot2.R) for the Course Project 1 of 
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

# Put togheter Date and Time to abotain the day of the week information
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

# Create the second plot
# Open device
png(file = "plot2.png", width=480, height=480)

# Plot variables
plot(data2$Global_active_power~data2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Close the device
dev.off()