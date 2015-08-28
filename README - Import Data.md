## Importing the data

The code to download and extract the zip file is:
## ------ Begin: Extract ------------------------------------------------------------------
fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileURL, destfile = './EPC.zip')
unzip('household_power_consumption.zip')
## ------ End: Extract --------------------------------------------------------------------
