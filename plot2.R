###download files
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


png(filename = "~/Desktop/DS/plot2.png", width = 480, height = 480, units = "px")
with(data_withtime,plot(dataTime,Global_active_power,ylab="Global Active Power (kilowatts)",
     xlab=" ", col="black",type="l"))
dev.off()