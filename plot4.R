##Coursera
##Data Science Specialization Signature Track
##Exploratory Data Analysis
##
##Programming Assignment 1
##plot4.R

#This is only for my own computer
#WorkingDirectory <- "N:/Eigenes/Joerg/Buero/Coursera/Data Science Specialization/4-Exploratory Data Analysis/Programming Assignments/PA1"
#setwd(WorkingDirectory)

#Change weekday-names from German to English
#This is OS-dependent (here: Windows 7)
#If this is not working on your computer, change correspondingly or try to comment it out
Sys.setlocale("LC_TIME", "English")

#Define filenames of data-input-file (datfile) and graphic-output-file (outfile)
#The data-input-file should be stored unzipped in the current Working Directory with origin filename
datfile <- "./household_power_consumption.txt"
outfile <- "plot4.png"

#Load data
classes=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
dat <- read.table(datfile, 
                  sep=";", 
                  dec=".", 
                  colClasses=classes, 
                  comment.char="", 
                  header=TRUE, 
                  na.strings="?", 
                  stringsAsFactors=FALSE)

#Transform Time- and Date columns from character to POSIXlt and Date datatypes
dat$Time <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#Subset data to two days
dat <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")

#Open png- graphics-file-device
png(filename = outfile,
    width = 480,
    height = 480)

#Draw plot#4
#Define multiple plot area of two columns and two rows
par(mfrow = c(2,2))

#Draw graph#1
plot(x=dat$Time,
     y=dat$Global_active_power,
     ylab="Global Active Power",
     xlab="",
     type="l") 

#Draw graph#2
plot(x=dat$Time,
     y=dat$Voltage,
     ylab="Voltage",
     xlab="datetime",
     type="l")          

#Draw graph#3
#graph#3 consists of three lines representing the variables Sub_metering 1-3 and a legend
plot(x=dat$Time,
     y=dat$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="l",
     col="black")

lines(x=dat$Time,
     y=dat$Sub_metering_2,
     type="l",
     col="red")

lines(x=dat$Time,
      y=dat$Sub_metering_3,
      type="l",
      col="blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n",    #no border
       cex = 0.9)    #slightly smaller text

#Draw graph#4
plot(x=dat$Time,
     y=dat$Global_reactive_power,
     ylab="Global_reactive_power",
     xlab="datetime",
     type="l")  

#Close device
dev.off()


