plot2 <- function() {
  
  # in case if there is no file in current directory download it.
  if(!file.exists("household_power_consumption.txt")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile="household_power_consumption.zip")
    unzip('household_power_consumption.zip')
  }
  
  # read file and subset only required dates
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
  
  # generate a full date data from date data and time data
  fullDateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

  # Open a device to plot
  png("plot2.png", 480, 480)
  
  # plot dependancy of active power from date time
  plot(fullDateTime, 
       data$Global_active_power, 
       xlab="", 
       ylab="Global Active Power (killowatts)", 
       type="l")
  
  # close plotting device
  dev.off()
}

plot2()