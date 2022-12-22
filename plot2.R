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
## plot desired data
with(dataTable, {
  plot(Global_active_power ~ dateTime, type="l", 
       xlab="", ylab="Global Active Power (Kilowatts)")})
## save to png
dev.copy(png,"plot2.png", width=480, height=480)
## close PNG device
dev.off()