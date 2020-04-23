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
png(filename = "plot2.png")
plot(datetime, subdata1$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")
dev.off()