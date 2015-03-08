## Download and unzip dataset

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp)
unlink(temp)
dateDownloaded <- date()

## Read local file into R

hpc <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset by date

hpc2 <- hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

# Make plot and copy to PNG

hist(hpc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()