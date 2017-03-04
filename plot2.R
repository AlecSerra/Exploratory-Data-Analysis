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
png(filename = "plot2.png")
#Sorry, my computer is in Catalan language by default, so the days displayed are in Catalan
#dj = Thu, dv = Fri, ds = Sat
with(ERC,plot(DateTime,Global_active_power,type="n", xlab="",ylab="Global Active Power (kilowatts)"))
with(ERC,lines(DateTime,Global_active_power))
dev.off()