#obtain the field
file <- "household_power_consumption.txt"
#Loading the data and prepare it for the plotting
ERC <- read.table(file = file, header = TRUE, sep = ";", na.string = "?")
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
ERC <- subset(ERC, as.Date(Date,'%d/%m/%Y') %in% d1:d2)
ERC$DateTime <- paste(ERC$Date, ERC$Time, sep = " ")
ERC$DateTime <- strptime(ERC$DateTime, format = '%d/%m/%Y %H:%M:%S')
#Inizialize the png funtion and plotting
png(filename = "plot3.png")
#Sorry, my computer is in Catalan language by default, so the days displayed are in Catalan
#dj = Thu, dv = Fri, ds = Sat
with(ERC,plot(DateTime,Sub_metering_1,type="n", xlab = "", ylab = "Energy sub metering"))
with(ERC,points(DateTime,Sub_metering_2,type="n"))
with(ERC,points(DateTime,Sub_metering_3,type="n"))
with(ERC,lines(DateTime,Sub_metering_1))
with(ERC,lines(DateTime,Sub_metering_2, col="red"))
with(ERC,lines(DateTime,Sub_metering_2, col="red"))
with(ERC,lines(DateTime,Sub_metering_3, col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"),lwd = c(2.5,2.5,2.5))
dev.off()