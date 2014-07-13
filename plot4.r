x <- read.table("PwrData.txt", header=TRUE, sep=";")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))#set 4 charts
#First Chart
plot(x$Global_active_power,ylab="Global Active Power",type="n")
lines(x$Global_active_power, main = "Global Active Power")
#2nd Chart
plot(x$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(x$Voltage)
#3rd Chart
plot(x$Sub_metering_1,xlab="Date",ylab="Energy sub metering",type="n")
legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(x$Sub_metering_1, main = "Global Active Power")
lines(x$Sub_metering_2, main = "Global Active Power",col="red")
lines(x$Sub_metering_3, main = "Global Active Power",col="blue")
#4th Chart
plot(x$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(x$Global_reactive_power)
