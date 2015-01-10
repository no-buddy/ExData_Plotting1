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

# setting locale for printing days in english
Sys.setlocale("LC_TIME", "C")

# print to png... making it transparent as on example graphs
png(filename="plot2.png", units="px", height=480, width=480, bg="transparent")

# plot the data
plot(data_s$dt, data_s$Global_active_power, type="l", bg="transparent", xlab="", ylab="Global Active Power (kilowatts)")

# close png
dev.off()
