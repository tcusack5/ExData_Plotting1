## set working directory
setwd("C:/Users/tommy/Desktop/R/Coursera/Exploratory Data Analysis/Course Project 1")
## read data text file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                 na.strings="?", stringsAsFactors=FALSE, nrows=2075259, 
                 check.names=FALSE, comment.char="",quote="\"")
## subset for desired dates
dataTable <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
## format dates
dataTable$Date <- as.Date(dataTable$Date, format="%d/%m/%Y")
##create data times
dateTime <- paste(as.Date(dataTable$Date),dataTable$Time)
## format data times
dataTable$dateTime <- as.POSIXct(dateTime)
## set workspace for graph to be positioned
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
## plot desired data
with(dataTable,{
  ## plot in top left
  plot(Global_active_power ~ dateTime, type="l", 
       xlab="", ylab="Global Active Power (Kilowatts)")
  ## plot in top right
  plot(Voltage ~ dateTime, type="l", 
       xlab="", ylab="Voltage (Volts)")
  ## plot in bottom left
  plot(Sub_metering_1 ~ dateTime, type="l", 
       xlab="", ylab="Global Active Power (Kilowatts)")
lines(Sub_metering_2 ~ dateTime, col='Red')
lines(Sub_metering_3 ~ dateTime, col='Blue')
## sets legend
legend("topright", col=c("black","red","blue"), lty=1, lwd=2, bty="n",cex=0.75,
        text.width = 50000,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## plot in bottom right
plot(Global_reactive_power ~ dateTime, type="l",
     xlab="", ylab="Global Reactive Power (Kilowatts)")
})
## save to png
dev.copy(png,"plot4.png", width=480, height=480)
## close PNG device
dev.off()