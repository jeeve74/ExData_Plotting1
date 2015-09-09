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
png(filename="./plot1.png",width=480,height=480,units="px")
hist(power.data$GlobalActivePower,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

## clean up the memory and close off the graphic device
bb <- rm(list=ls())
bb <- dev.off()