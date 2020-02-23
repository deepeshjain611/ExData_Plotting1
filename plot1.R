## Read the data
phpc <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Using strptime and as.Date to change the Date format in the data.
phpc$Date <- as.Date(strptime(phpc$Date,format = "%d/%m/%Y"))

## Subsetting the data
new_phpc <- phpc[which(phpc$Date ==  as.Date("2007-02-01") | phpc$Date ==  as.Date("2007-02-02")),]

## Opening the png device
png(file="plot1.png",width=480, height=480)

## plotting the histogram
hist(as.numeric(new_phpc$Global_active_power),xlab = "Global Active Power (kilowatts)",col = "red", main = "Global Active Power")

## Closing the device
dev.off()
