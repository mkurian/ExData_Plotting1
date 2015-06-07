powerdata <- read.csv("household_power_consumption.txt", sep =";", header=TRUE)
febdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007") ,]
class(febdata$Global_active_power)
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power ))
class(febdata$Global_active_power)
hist(febdata$Global_active_power, col="red", xlab = "Global Active Power(kilowatts) ", main = "Global Active Power")
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()

