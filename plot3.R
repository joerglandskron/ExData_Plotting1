##Coursera
##Data Science Specialization Signature Track
##Exploratory Data Analysis
##
##Programming Assignment 1
##plot3.R

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
outfile <- "plot3.png"

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

#Draw plot#3
#Initialize with plot of first graph of variable Sub_metering_1
plot(x=dat$Time,
     y=dat$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="l",
     col="black")

#Add graph of variable Sub_metering_2
lines(x=dat$Time,
     y=dat$Sub_metering_2,
     type="l",
     col="red")

#Add graph of variable Sub_metering_3
lines(x=dat$Time,
      y=dat$Sub_metering_3,
      type="l",
      col="blue")

#Add legend
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

#Close device
dev.off()


