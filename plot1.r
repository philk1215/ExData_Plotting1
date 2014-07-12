x <- read.table("PwrData.txt", header=TRUE, sep=";")#reads formatted table
hx <- hist(x$Global_active_power, breaks=15, plot=F)#initializes histogram
png('plot1.png')#name the png file
plot(hx, col=2,xlab="Global Active Power (kilowatts)",main="Global Active Power")#plots histogram
dev.off()#saves file
