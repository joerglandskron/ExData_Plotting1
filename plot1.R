##Coursera
##Data Science Specialization Signature Track
##Exploratory Data Analysis
##
##Programming Assignment 1
##plot1.R

#This is only for my own computer
#WorkingDirectory <- "Q:/Eigenes/Joerg/Buero/Coursera/Data Science Specialization/4-Exploratory Data Analysis/Programming Assignments/PA1"
#setwd(WorkingDirectory)

#Define filenames of data-input-file (datfile) and graphic-output-file (outfile)
#The data-input-file should be stored unzipped in the current Working Directory with origin filename
datfile <- "./household_power_consumption.txt"
outfile <- "plot1.png"

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

#Draw histogram (plot#1)
hist(dat$Global_active_power,
     main="Global Active Power",
     ylab="Frequency",
     xlab="Global Active Power (kilowatts)",
     col="red")

#Close device
dev.off()


