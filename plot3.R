#################################
## Exploratory Data Analysis
## Course Project 1
## plot3.R
## Date: 2014-12-07
#################################

library(lubridate)

## Read data
data <- read.csv("household_power_consumption.txt", 
                 header=T, 
                 sep=';', 
                 na.strings="?")

## Define date format
data$Date <- dmy(data$Date)

## Filter required Dates
r<-range(as.Date("2007-02-01"),as.Date("2007-02-02"))
data <- data[as.Date(data$Date) %in% r,]

## define time with date using lubridate ymd_hms function
datetime <- ymd_hms(paste(data$Date,data$Time))

## create plot function
create_plot <- function(){
  with(data, {plot(Sub_metering_1 ~ datetime,
                  ylab = "Energy sub metering",
                  xlab = "",
                  type="l",
                  col = "black")
  lines(Sub_metering_2 ~ datetime,col = "red")
  lines(Sub_metering_3 ~ datetime,col = "blue")
  })
 legend("topright", lty = 1, col=c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}

## plot graph into png file
png(file = "plot3.png")
create_plot()
dev.off()