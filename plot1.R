## First script (Plot1.R) for the Course Project 1 of 
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

# Create the first plot
# Open device
png(file = "plot1.png", width=480, height=480)

# Plot the histo
hist(data2$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)")

# Close the device
dev.off()
