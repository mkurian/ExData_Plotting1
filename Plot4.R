powerdata <- read.csv("household_power_consumption.txt", sep =";", header=TRUE)
febdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007") ,]
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power ))
febdata$Date <- as.Date(febdata$Date, format = "%d/%m/%Y")
library(lubridate)
febdata$dt <- ymd_hms(paste(febdata$Date, febdata$Time))
febdata$Sub_metering_1 <- as.numeric(as.character(febdata$Sub_metering_1 ))
febdata$Sub_metering_2 <- as.numeric(as.character(febdata$Sub_metering_2 ))
febdata$Sub_metering_3 <- as.numeric(as.character(febdata$Sub_metering_3 ))
class(febdata$Voltage)
febdata$Voltage <- as.numeric(as.character(febdata$Voltage ))
febdata$Global_reactive_power <- as.numeric(as.character(febdata$Global_reactive_power ))




par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(febdata$dt, febdata$Global_active_power, type= "n", xlab="", ylab="Global Active Power")
lines(febdata$dt, febdata$Global_active_power)

plot(febdata$dt, febdata$Voltage, type= "n", xlab="dateTime", ylab="Voltage")
lines(febdata$dt, febdata$Voltage)

plot(febdata$dt, febdata$Sub_metering_1, type= "n", xlab="", ylab="Energy Sub metering")
lines(febdata$dt, febdata$Sub_metering_1, col="black")
lines(febdata$dt, febdata$Sub_metering_2, col="red")
lines(febdata$dt, febdata$Sub_metering_3, col="blue")
#legend("topright",pch="_" ,col = c("black", "red", "blue"),legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ) )

plot(febdata$dt, febdata$Global_reactive_power, type= "n", xlab="dateTime", ylab="Global_reactive_power")
lines(febdata$dt, febdata$Global_reactive_power)



dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()


