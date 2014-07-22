# Coursera Data Scientist Track-Exploratory Data Analysis
# Assignment 1 part 1

## Check if a directory Data exists and if not, create one
if (!file.exists("Data")) {
  dir.create("Data")
}
# data url and destination of file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileDest <- "./Data/household_power_consumption.zip"

# download and unzip the files
download.file(url, destfile = fileDest, method = "curl", mode = "wb")
unzip("./Data/household_power_consumption.zip", exdir = "./Data/")

# use SQL to only pull data from 1/2/2007 to 2/2/2007 and assign to PwrData
library(sqldf)
myFile <- "./Data/household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
pwrData <- read.csv.sql(myFile, mySql, header = TRUE, sep = ";")
# combine Date and Time into a single variable
pwrData$dateTime <- as.POSIXct(strptime(paste(pwrData$Date, pwrData$Time), 
                                        "%d%m%Y %H:%M:%S"))

# start a PNG device
png("plot1.png", width = 480, height = 480, bg = "transparent")

# make the histogram
hist(pwrData$Global_active_power, col = "red", ylim = c(0, 1200), 
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()