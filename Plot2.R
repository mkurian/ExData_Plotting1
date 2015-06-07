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


plot(febdata$dt, febdata$Global_active_power, type= "n", xlab="", ylab="Global Active Power(kilowatts)")
lines(febdata$dt, febdata$Global_active_power)
