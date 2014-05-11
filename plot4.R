# setwd to ExData_Plotting1 folder

# variables for zipped file name and txt file name
zipfile <- "exdata-data-household_power_consumption.zip"
txtfile <- "household_power_consumption.txt"

# read unzipped file
# headerfile is used to determine column names
# hpcdata3 specifically reads rows from dates 2007-02-01 and 2007-02-02
headerfile <- read.table(unz(zipfile, txtfile),nrows=1, sep = ";", header = TRUE)
hpcdata3 <- read.table(unz(zipfile, txtfile), sep = ";", skip = 66637, 
                       nrows = 2880, na.strings = "?", 
                       col.names = colnames(headerfile))

# Date and Time columns are merged and converted to datetime format
hpcdata3$datetime <- paste(hpcdata3$Date, hpcdata3$Time, sep=",")
hpcdata3$datetime <- strptime(hpcdata3$datetime, format="%d/%m/%Y,%H:%M:%S")

# plot is saved as a png file
png(file = "plot4.png",width=480,height=480,units="px",bg = "transparent")
# Four base plots in one graph
par(mfrow = c(2, 2),mar = c(4, 4, 3, 2), oma = c(0, 0, 2, 0))
plot(hpcdata3$datetime, hpcdata3$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
plot(hpcdata3$datetime, hpcdata3$Voltage, type="l",
     xlab="datetime",ylab="Voltage")
plot(hpcdata3$datetime, hpcdata3$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(hpcdata3$datetime, hpcdata3$Sub_metering_2, type="l", col="red")
lines(hpcdata3$datetime, hpcdata3$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black","red", "blue"), lty=1, cex=0.9, bty="n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(hpcdata3$datetime, hpcdata3$Global_reactive_power, type="l",
     xlab="datetime",ylab="Global_reactive_power")
dev.off()