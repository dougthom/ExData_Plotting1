plot2 <- function()
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
  png('plot2.png')

  plot(date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power Consumption (kilowatts)")
  
  # for saving plot as PNG
  dev.off()
  
  # for debugging, output data
  #data
}

