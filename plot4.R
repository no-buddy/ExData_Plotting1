# read data
data <- read.csv("household_power_consumption.txt", sep=";",
	na.strings=rep("?",5), colClasses=c("character", "character",
	"numeric", "numeric", "numeric", "numeric", "numeric", "numeric",
	"numeric"))

# get only the ones we need
data_s <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

# add data+time column
data_s$dt <- strptime(paste(data_s$Date,data_s$Time),
	format="%d/%m/%Y %H:%M:%S")

# setting locale for printing days in English language
Sys.setlocale("LC_TIME", "C")

# setting layout
par(mfcol=c(2,2))

# print to png... making it transparent as on example graphs
png(filename="plot4.png", units="px", height=480, width=480, bg="transparent")

# setting layout
par(mfcol=c(2,2))

# plot the data 1
plot(data_s$dt, data_s$Global_active_power, type="l", bg="transparent", xlab="", ylab="Global Active Power")

# plot the data 2
plot(data_s$dt, data_s$Sub_metering_1, type="l", bg="transparent", xlab="", ylab="Energy sub metering")
lines(data_s$dt, data_s$Sub_metering_2, col="red")
lines(data_s$dt, data_s$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, bty="n")

# plot the data 3
plot(data_s$dt, data_s$Voltage, type="l", bg="transparent", xlab="datetime", ylab="Voltage")

# plot the data 4
plot(data_s$dt, data_s$Global_reactive_power, type="l", bg="transparent", xlab="datetime", ylab="Global_reactive_power")

# close png
dev.off()
