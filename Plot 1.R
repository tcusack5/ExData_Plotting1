setwd("C:/Users/tommy/Desktop/R/Coursera/Exploratory Data Analysis/Course Project 1")
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                 na.strings="?", stringsAsFactors=FALSE, nrows=2075259, 
                 check.names=FALSE, comment.char="",quote="\"")
dataTable1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
dataTable1$Date <- as.Date(dataTable1$Date, format="%d/%m/%Y")
hist(dataTable1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab = "Frequency", col="Red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()