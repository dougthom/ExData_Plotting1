plot1 <- function()
{
  require(data.table)
  data <- fread("household_power_consumption.txt",  na.strings = "?", sep=";", colClasses = "character")[Date == "1/2/2007" | Date == "2/2/2007",]
  #data$Date <- strptime(data$Date, format ="%d/%m/%Y")
  
  #date is fucked?!?!??
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$Voltage <- as.numeric(data$Voltage)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  
  # for saving plot as PNG
  png('plot1.png')
  
  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ylim=c(0,1200))
  
  # for saving plot as PNG
  dev.off()
  
  # for debugging, output data
  #data
}

