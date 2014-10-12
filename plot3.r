data <- read.table("/home/gp/Schreibtisch/OrdnungAcer/Skillz/Coursera - Exploratory Data Analysis/Data/household_power_consumption.txt", na.strings = "?", sep=";", header = T)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y" )

power <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(power$DateTime, power$Sub_metering_1, type="l",
     xlab=NA,
     ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)
dev.off()