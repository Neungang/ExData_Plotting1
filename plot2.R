## Getting full dataset
readData <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = "", quote = '\"')
readData$Date <- as.Date(readData$Date, format = "%d/%m/%Y")

## Subsetting the data
realData <- subset(readData, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(readData)

## Converting dates
datetime <- paste(as.Date(realData$Date), realData$Time)
realData$Datetime <- as.POSIXct(datetime)

## Generating Plot 2
plot(realData$Global_active_power ~ realData$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#Copying plot2
dev.copy(png, file = "plot2.png")
dev.off()