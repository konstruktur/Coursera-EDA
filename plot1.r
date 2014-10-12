data <- read.table("/home/gp/Schreibtisch/OrdnungAcer/Skillz/Coursera - Exploratory Data Analysis/Data/household_power_consumption.txt", na.strings = "?", sep=";", header = T)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y" )

power <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, 
     freq=T,
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")
dev.off()