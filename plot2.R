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
png(file="plot2.png",width=480, height=480)

## plotting the histogram
plot(new_phpc$Date,new_phpc$Global_active_power,type = "l",xlab = "",ylab = "Global active power (kilowatt)")

## Closing the device
dev.off()
