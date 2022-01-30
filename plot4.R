# Plot4  

### Get Data
data <- read.table("household_power_consumption.txt", sep=";", na="?", head=TRUE)

data <- data[which(data$Date== '2/2/2007' | data$Date == '1/2/2007'),]
data$POSIX <- as.POSIXlt.character(paste(data$Date,data$Time), format = "%d / %m / %Y %H:%M:%S")

### Plot into file
png(filename="plot4.png", width = 480,height = 480)
par(mfcol=c(2,2))
#plot topleft
plot(x=data$POSIX, y=data$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power')

#plot bottomleft
plot(x=data$POSIX, y=data$Sub_metering_1, type='l', xlab = '', ylab = 'Energy sub metering', col='black')
lines(x=data$POSIX, y=data$Sub_metering_2, col='red')
lines(x=data$POSIX, y=data$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1)

#plot topright
plot(x=data$POSIX, y=data$Voltage, type='l', xlab = 'datetime', ylab = 'Voltage')
#plot bottomright
plot(x=data$POSIX, y=data$Global_reactive_power, type='l', xlab = 'datetime', ylab = 'Global Reactive Power', col='black')

dev.off()
