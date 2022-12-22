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
## plot desired data
hist(dataTable$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab = "Frequency", col="Red")
## save to png
dev.copy(png,"plot1.png", width=480, height=480)
## close PNG device
dev.off()