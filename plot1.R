setwd("D:/Dropbox/COURSERA/EXPLORATORY DATA ANALYSIS/WEEK 1/PROJECT_1")
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep=";", na.strings = "?", dec=".", stringsAsFactors = FALSE)
#data$Date <- strftime(strptime(data$Date, format ="%e/%m/%Y"), format = "%d/%m/%Y")
data$Date <- as.Date(data$Date, format = "%e/%m/%Y")
power <- subset(data, Date > "2007-01-31")
power <- subset(power, Date < "2007-02-03")
png(filename = "ExData_Plotting1\\plot1.png")
hist(power$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()