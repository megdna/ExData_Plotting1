## Download and unzip dataset

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp)
unlink(temp)
dateDownloaded <- date()

## Read local file into R

hpc <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset by date and convert to time

hpc2 <- hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]
hpc2$datetime <- strptime(paste(hpc2$Date, hpc2$Time),"%d/%m/%Y %H:%M:%S")

# Make plot and copy to PNG

with(hpc2, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png")
dev.off()