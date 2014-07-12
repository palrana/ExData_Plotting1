## plot1.R will generate plot1.png

## download the data and put it is a local file system
fileName <- "exdatahousehold_power_consumption.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = fileName)

## Unzip the file and read the data

dataset <- read.csv(unz(fileName, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?")

## Format the date and subset the data only on 2007-02-01 and 2007-02-02

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
startDate <- as.Date("01/02/2007", format="%d/%m/%Y")
endDate <- as.Date("02/02/2007", format="%d/%m/%Y")
dataset <- dataset[dataset$Date >= startDate & dataset$Date <= endDate, ]

## Create the plot
png(filename="plot1.png", width=480, height=480)
hist(dataset$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()

