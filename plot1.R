#################################
## Exploratory Data Analysis
## Course Project 1
## plot1.R
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

## Create plot function
create_plot <- function(){
  par(col = "red")
  with(data, hist(Global_active_power,
                  col= "red",
                  main = "Global Active Power",
                  xlab = "Global Active Power (kilowats)",
                  ylab = "Frequency" ))
}

## plot graph into png file
png(file = "plot1.png")
create_plot()
dev.off()
