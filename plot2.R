#################################
## Exploratory Data Analysis
## Course Project 1
## plot2.R
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
  with(data, plot(Global_active_power ~ datetime,
                  ylab = "Global Active Power (kilowats)",
                  xlab = "",
                  type="l"
                  ))
}

## plot graph into png file
png(file = "plot2.png")
create_plot()
dev.off()