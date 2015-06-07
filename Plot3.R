powerdata <- read.csv("household_power_consumption.txt", sep =";", header=TRUE)
febdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007") ,]
class(febdata$Global_active_power)
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power ))
class(febdata$Global_active_power)
febdata$Date <- as.Date(febdata$Date, format = "%d/%m/%Y")
table(weekdays(febdata$Date))


class(febdata$Date)
febdata$Date <- as.Date(febdata$Date, format = "%d/%m/%Y")
table(weekdays(febdata$Date))

library(lubridate)

febdata$dt <- ymd_hms(paste(febdata$Date, febdata$Time))
class(febdata$dt)


class(febdata$Sub_metering_1)
febdata$Sub_metering_1 <- as.numeric(as.character(febdata$Sub_metering_1 ))
febdata$Sub_metering_2 <- as.numeric(as.character(febdata$Sub_metering_2 ))
febdata$Sub_metering_3 <- as.numeric(as.character(febdata$Sub_metering_3 ))

plot(febdata$dt, febdata$Sub_metering_1, type= "n", xlab="", ylab="Energy Sub metering")
lines(febdata$dt, febdata$Sub_metering_1, col="black")
lines(febdata$dt, febdata$Sub_metering_2, col="red")
lines(febdata$dt, febdata$Sub_metering_3, col="blue")
legend("topright",pch="_" ,col = c("black", "red", "blue"),pt.cex=1, cex=0.5,legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ) )


dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()




