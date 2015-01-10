# read data
data <- read.csv("household_power_consumption.txt", sep=";",
	na.strings=rep("?",5), colClasses=c("character", "character",
	"numeric", "numeric", "numeric", "numeric", "numeric", "numeric",
	"numeric"))

# get only the ones we need
data_s <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

# print to png... making it transparent as on example graphs
png(filename="plot1.png", units="px", height=480, width=480, bg="transparent")

# plot the data
hist(data_s$Global_active_power, xlab="Global Active Power (kilowatts)",
	col="red", main="Global Active Power", bg="transparent")

# close png
dev.off()
