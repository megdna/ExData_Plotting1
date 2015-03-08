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

# Make plots in PNG

png(filename="plot4.png")
par(mfcol = c(2,2))

with(hpc2, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(hpc2, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(hpc2$datetime, hpc2$Sub_metering_2, col="red")
lines(hpc2$datetime, hpc2$Sub_metering_3, col="blue")
legend("topright", lty="solid", bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(hpc2, plot(datetime, Voltage, type="l"))

with(hpc2, plot(datetime, Global_reactive_power, type="l"))

dev.off()