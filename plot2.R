setwd("D:/Dropbox/COURSERA/EXPLORATORY DATA ANALYSIS/WEEK 1/PROJECT_1")
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep=";", na.strings = "?", dec=".", stringsAsFactors = FALSE)
#data$Date <- strftime(strptime(data$Date, format ="%e/%m/%Y"), format = "%d/%m/%Y")
data$Date <- as.Date(data$Date, format = "%e/%m/%Y")
power <- subset(data, Date > "2007-01-31")
power <- subset(power, Date < "2007-02-03")

Sys.setlocale("LC_TIME", "C")
#power$Date <- strftime(power$Date, format = "%a")
power$Time <- as.POSIXct(paste(power$Date, power$Time))

png(filename = "ExData_Plotting1\\plot2.png")
with(power, plot(Time, 
                 Global_active_power, 
                 type = "l", 
                 xlab = "", 
                 ylab = "Global Active Power (kilowatts)"))
dev.off()