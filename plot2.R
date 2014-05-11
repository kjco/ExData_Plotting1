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
png(file = "plot2.png",width=480,height=480,units="px",bg = "transparent")
# Global active power is plotted again datetime as line graph (aka type="l")
plot(hpcdata3$datetime, hpcdata3$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
