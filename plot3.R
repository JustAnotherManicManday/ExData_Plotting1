### Load required package/s
library(lubridate)

### Read in the household power consumption data
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

### Subset the data based on date
subdata <- subset(data, data$V1 == "2/2/2007" | data$V1 == "1/2/2007")

### Transform the date and time colums to Date and Period class
subdata1 <- cbind(dmy(subdata$V1), hms(subdata$V2), subdata[, 3:9])

### Rename the columns
colnames <- data[1, ]
names(subdata1) <- unclass(colnames)

### Create the plot
datetime <- subdata1$Date + subdata1$Time
png(filename = "plot3.png")
plot(x = datetime, y = subdata1$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "l")
lines(datetime, subdata1$Sub_metering_2, col = "red")
lines(datetime, subdata1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, 
       cex = 0.8, y.intersp = 1, x.intersp = 1.2)
dev.off()