plot3 <- function()
{
  require(data.table)
  data <- fread("household_power_consumption.txt",  na.strings = "?", sep=";", colClasses = "character")[Date == "1/2/2007" | Date == "2/2/2007",]
  
  date <- paste(data$Date, data$Time)
  date <- strptime(date, "%d/%m/%Y %H:%M:%S")
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$Voltage <- as.numeric(data$Voltage)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  
  
  # for saving plot as PNG
  png('plot3.png')
  
  plot(date, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(date, data$Sub_metering_1, col="black")
  lines(date, data$Sub_metering_2, col="red")
  lines(date, data$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=c(1,1,1))
  
  # for saving plot as PNG
  dev.off()
  
  # for debugging, output data
  #data
}

