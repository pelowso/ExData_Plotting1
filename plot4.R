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

png(filename = "ExData_Plotting1\\plot4.png")
par(mfrow=c(2,2))

with(power, plot(Time, 
                 Global_active_power, 
                 type = "l", 
                 xlab = "", 
                 ylab = "Global Active Power"))
with(power, plot(Time, 
                 Voltage, 
                 type = "l", 
                 xlab = "datetime", 
                 ylab = "Voltage"))
with(power, plot(Time, 
                 Sub_metering_1, 
                 type = "n", 
                 xlab = "", 
                 ylab = "Energy sub metering"))
with(power, points(Time, Sub_metering_1, type = "l", col = "black"))
with(power, points(Time, Sub_metering_2, type = "l", col = "red"))
with(power, points(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", 
       lwd = 1,
       bty="n",
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(power, plot(Time, 
                 Global_reactive_power, 
                 type = "l", 
                 xlab = "datetime", 
                 ylab = "Global_reactive_power"))


dev.off()