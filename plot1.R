# setwd to ExData_Plotting1 folder

# variables for zipped file name and txt file name
zipfile <- "exdata-data-household_power_consumption.zip"
txtfile <- "household_power_consumption.txt"

# read unzipped file
# headerfile is used to determine column names
# hpcdata2 specifically reads rows from dates 2007-02-01 and 2007-02-02
headerfile <- read.table(unz(zipfile, txtfile),nrows=1, sep = ";", header = TRUE)
hpcdata2 <- read.table(unz(zipfile, txtfile), sep = ";", skip = 66637, 
                       nrows = 2880, na.strings = "?", 
                       col.names = colnames(headerfile))

#plot is saved as a png file
png(file = "plot1.png",width=480,height=480,units="px",bg = "transparent")
#Global active power is plotted as a histogram
hist(hpcdata2$Global_active_power, col="red",
     xlab ="Global Active Power (kilowatts)",
     ylab ="Frequency",
     main = "Global Active Power",
     yaxt="n", cex.axis =1.0, cex.lab=1.0, cex.main=1.2)
# y axis is removed and reformatted as shown below
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200,200), cex.axis = 1.0)
dev.off()