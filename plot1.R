#obtain the field
file <- "household_power_consumption.txt"
#Loading the data and prepare it for the plotting
ERC <- read.table(file = file, header = TRUE, sep = ";", na.string = "?")
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
ERC <- subset(ERC, as.Date(Date,'%d/%m/%Y') %in% d1:d2)
png(filename = "plot1.png")
hist(ERC$Global_active_power,col="red", main = "Active Global Power", xlab = "Active Global Power (kilowatts)")
dev.off()