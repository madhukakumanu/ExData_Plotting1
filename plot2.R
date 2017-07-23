setwd("D:\\Learning\\Coursera\\Data_Scientist\\Assignments\\Month4_Week1")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile="household_power_consumption.zip"
message("Downloading data")
download.file(fileURL, destfile=zipfile)
unzip(zipfile, exdir="D:\\Learning\\Coursera\\Data_Scientist\\Assignments\\Month4_Week1")

## Reading Data from downloaded file into R
message("reading household_power_consumption.txt data")
hh.power.table <- read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")


# Household power consumption for Feb. 1 and 2, 2007 only
# as.Date() functions giving too many problems so using as.character function
hh.filteredDS <- hh.power.table[as.character(hh.power.table$Date) %in% c("1/2/2007", "2/2/2007"),]
# Concatante Date and Time variables
hh.filteredDS$Date <- as.Date(hh.filteredDS$Date, format = '%d/%m/%Y')
hh.filteredDS$dateTime = as.POSIXct(paste(hh.filteredDS$Date, hh.filteredDS$Time))

# Below command plots Histogram graph on the screen
png("plot1.png", width = 480,height=480)
plot(hh.filteredDS$dateTime,hh.filteredDS$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

setwd("D:\\Learning\\Coursera\\Data_Scientist\\Assignments")



