data <- read.table("/home/gp/Schreibtisch/OrdnungAcer/Skillz/Coursera - Exploratory Data Analysis/Data/household_power_consumption.txt", na.strings = "?", sep=";", header = T)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y" )

power <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(power$DateTime, power$Global_active_power, type="l",
     xlab=NA,
     ylab="Global Active Power (kilowatts)")
dev.off()