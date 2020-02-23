## Read the data
phpc <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Using strptime and as.Date to change the Date format in the data.
phpc$Date <- as.Date(strptime(phpc$Date,format = "%d/%m/%Y"))

## Subsetting the data
new_phpc <- phpc[which(phpc$Date ==  as.Date("2007-02-01") | phpc$Date ==  as.Date("2007-02-02")),]


## Now converting Date and Time Column as Date/Time and assigning it to only Date Column (So the new Date column is now Datetime)
## We are also converting Date from character to posixct date/time class
new_phpc$Date <- as.POSIXct(paste(new_phpc$Date, new_phpc$Time))
## Opening the png device
png(file="plot3.png",width=480, height=480)

# plot Sub_metering_1
plot(new_phpc$Date,new_phpc$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
## add Sub_metering_2 to the plot
lines(new_phpc$Date, new_phpc$Sub_metering_2, col="red")
## add Sub_metering_3 to the plot
lines(new_phpc$Date, new_phpc$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), lwd=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Closing the device
dev.off()
