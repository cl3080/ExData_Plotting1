url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile = '~/Desktop/DS/week1.zip')
unzip("~/Desktop/DS/week1.zip")

###read data
data<-read.table(text=grep("^[1,2]/2/2007",readLines("~/Desktop/DS/household_power_consumption.txt"),value=TRUE),
                 sep=";", col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 na.strings="?")

###convert date and time
dataTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data_withtime<-cbind(data,dataTime)

###plot one by one
png(filename = "~/Desktop/DS/plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data_withtime$dataTime,data_withtime$Global_active_power,ylab="Global Active Power",
                        xlab=" ", col="black",type="l")
plot(data_withtime$dataTime,data_withtime$Voltage,ylab="Voltage",
     xlab="datetime ", col="black",type="l")
plot(data_withtime$dataTime,data_withtime$Sub_metering_1,type='l',col='black',
     ylab='Energy sub metering', xlab = ' ' )
lines(data_withtime$dataTime,data_withtime$Sub_metering_2,type = 'l', col='red')
lines(data_withtime$dataTime,data_withtime$Sub_metering_3,type = 'l',col='blue')
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty="solid", bty="n")
plot(data_withtime$dataTime,data_withtime$Global_reactive_power,ylab="Global_reactive_power",
     xlab="datetime ", col="black",type="l")
dev.off()
