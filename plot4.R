## set working directory
setwd("C:/cxia/learning/Data Science Specialization/Exploratory Data Analysis")

##load data
epc_data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",
                     na.strings="?",stringsAsFactors=FALSE)
epc_data2 <- epc_data[(epc_data$Date=="1/2/2007")|(epc_data$Date=="2/2/2007"),]
epc_data2$DateTime <- paste(epc_data2$Date, epc_data2$Time)
epc_data2$DateTime <- strptime(epc_data2$DateTime, "%d/%m/%Y %H:%M:%S")


##plot 4
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(epc_data2, plot(DateTime,Global_active_power,
                     ylab="Global Active Power",
                     xlab="",
                     type="l")
)

with(epc_data2, plot(DateTime,Voltage,
                     ylab="Voltage",
                     xlab="datetime",
                     type="l")
)

with(epc_data2, plot(DateTime,Sub_metering_1,
                     ylab="Energy sub metering",
                     xlab="",
                     type="l")
)
with(epc_data2, lines(DateTime,Sub_metering_2,col="red"))
with(epc_data2, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
                                                       "Sub_metering_2",
                                                       "Sub_metering_3"),
       lty=1)

with(epc_data2, plot(DateTime,Global_reactive_power,
                     ylab="Global_reactive_power",
                     xlab="datetime",
                     type="l")
)
dev.off()
