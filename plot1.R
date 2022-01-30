# Plot1 

### Get Data
data <- read.table("household_power_consumption.txt", sep=";", na="?", head=TRUE)

data <- data[which(data$Date== '2/2/2007' | data$Date == '1/2/2007'),]
data$POSIX <- as.POSIXlt.character(paste(data$Date,data$Time), format = "%d / %m / %Y %H:%M:%S")

### Plot into file
png(filename="plot1.png", width = 480,height = 480)
hist(data$Global_active_power, col = 'red', 
     main="Global Active Power", xlab = "Global Active Power (kWatts)")
dev.off()
