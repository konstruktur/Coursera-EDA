data <- read.table("/home/gp/Schreibtisch/OrdnungAcer/Skillz/Coursera - Exploratory Data Analysis/Data/household_power_consumption.txt", na.strings = "?", sep=";", header = T)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y" )

power <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

# 1st plot
plot(power$DateTime, power$Global_active_power, type="l",
     xlab=NA,
     ylab="Global Active Power (kilowatts)")

# 2nd plot
plot(power$DateTime, power$Sub_metering_1, type="l",
     xlab=NA,
     ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1, bty="n")

# 3rd plot
plot(power$DateTime, power$Voltage, type="l",
     xlab="datetime",
     ylab="Voltage")

# 4th plot
plot(power$DateTime, power$Global_reactive_power, type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
