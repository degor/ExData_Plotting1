plot1 <- function() {
  
  # in case if there is no file in current directory download it.
  if(!file.exists("household_power_consumption.txt")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile="household_power_consumption.zip")
    unzip('household_power_consumption.zip')
  }
  
  # read file and subset only required dates
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
  
  # Open a device to plot
  png("plot1.png", 480, 480)
  
  # Plot histogram of frequences of active power
  hist(data$Global_active_power, 
       main = "Global Active Power", 
       xlab = "Global Active Power (killowatts)", 
       ylab = "Frequency",
       col  ="red")
  
  # close plotting device
  dev.off()
}

plot1()