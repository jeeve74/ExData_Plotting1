# set directory to folder where file is locationed (household_power_consumption.txt)
power.directory <- "C:/github/ExData_Plotting1"
setwd(power.directory)

# read from source file 
power.class <- c(rep("character",2),rep("numeric",7))
power.data <- read.table("household_power_consumption.txt",header=TRUE,
        sep=";",na.strings="?",colClasses=power.class)

# limit the data to 2 days 
power.data <- power.data[power.data$Date=="1/2/2007" | power.data$Date=="2/2/2007",]

# setup a Datetime column
Datetime <- as.POSIXct(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"))
power.data <- transform(power.data, Date = as.Date(Date,format="%d/%m/%Y") )
power.data <- cbind(power.data,Datetime)

# tidy up the data
power.columns <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity",
        "SubMetering1","SubMetering2","SubMetering3","Datetime")
colnames(power.data) <- power.columns

# setup the png file and create graphic
png(filename="./plot4.png",width=480,height=480,units="px",bg="white")

# setup 4 quadrants
par(mfcol=c(2,2))

# plot graph upper left
plot(power.data$Datetime, power.data$GlobalActivePower, type="l",
    xlab="", ylab="Global Active Power (kilowatts)" )

# plot graph lower left
plot(power.data$Datetime, power.data$SubMetering1, type="l",
     xlab="", ylab="Energy sub metering", col="black" )
lines(power.data$Datetime, power.data$SubMetering2, type="l", col="red" )
lines(power.data$Datetime, power.data$SubMetering3, type="l", col="blue" )
legend("topright",pch=c("_"), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot graph upper right
plot(power.data$Datetime, power.data$Voltage, type="l",
     xlab="datetime", ylab="Voltage" )

# plot graph lower rightright
plot(power.data$Datetime, power.data$GlobalReactivePower, type="l",
     xlab="datetime", ylab="Global_reactive_power" )

## clean up the memory and close off the graphic device
bb <- rm(list=ls())
bb <- dev.off()