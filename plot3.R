## plot3.R will generate plot3.png

## download the data and put it is a local file system
fileName <- "exdatahousehold_power_consumption.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = fileName)

## Unzip the file and read the data

dataset <- read.csv(unz(fileName, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?")

## Format the date and subset the data only on 2007-02-01 and 2007-02-02

dataset$timestamp = strptime(paste(dataset$Date, dataset$Time),
                             format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
dataset = dataset[dataset$timestamp >= startDate & dataset$timestamp <= endDate, ]

## Creating the plot
png(filename="plot3.png", width=480, height=480)
plot(dataset$timestamp, dataset$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(dataset$timestamp, dataset$Sub_metering_2, col="red")
lines(dataset$timestamp, dataset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
dev.off()