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
plotdata <- as.numeric(subdata1$Global_active_power)
png(filename = "plot1.png")
hist(plotdata, 
     col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()