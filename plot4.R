df <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?", dec = ".")
subsetdf <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
globalActivePower <- as.numeric(subsetdf$Global_active_power)
globalReactivePower <- as.numeric(subsetdf$Global_reactive_power)
voltage <- as.numeric(subsetdf$Voltage)
submetering1 <- as.numeric(subsetdf$Sub_metering_1)
submetering2 <- as.numeric(subsetdf$Sub_metering_2)
submetering3 <- as.numeric(subsetdf$Sub_metering_3)
datetime <- strptime(paste(subsetdf$Date, subsetdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power")
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()