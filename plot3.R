plot3 <- function() {
  
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
  png("plot3.png", 480, 480)

  # plot dependency of first sub metering from date time and additional information on map.
  plot (fullDateTime, 
        data$Sub_metering_1, 
        xlab="",
        ylab="Energy sub metering", 
        type="l",
        col="black")
  
  # plot additional dipendency of second sub metering
  lines(fullDateTime, 
        data$Sub_metering_2, 
        col="red")
  
  # plot additional dipendency of third sub metering
  lines(fullDateTime, 
        data$Sub_metering_3, 
        col="blue")
  
  # create a legend for map.
  legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"))

  # close plotting device
  dev.off()
}

plot3()