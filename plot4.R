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
png(file="plot4.png",width=480, height=480)

# plotting
par(mfrow=c(2,2),oma=c(0,0,2,0), mar=c(4,4,2,1))
plot(new_phpc$Date,new_phpc$Global_active_power,type = "l",xlab = "",ylab = "Global active power (kilowatt)")
plot(new_phpc$Date,new_phpc$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(new_phpc$Date,new_phpc$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(new_phpc$Date, new_phpc$Sub_metering_2, col="red")
lines(new_phpc$Date, new_phpc$Sub_metering_3, col="blue")
legend("topright",inset = 0.01, col = c("black", "red", "blue"), lwd=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.7, box.lty = 0)
plot(new_phpc$Date,new_phpc$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
## Closing the device
dev.off()
