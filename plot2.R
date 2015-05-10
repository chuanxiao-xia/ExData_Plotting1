## set working directory
setwd("C:/cxia/learning/Data Science Specialization/Exploratory Data Analysis")

##load data
epc_data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",
                     na.strings="?",stringsAsFactors=FALSE)
epc_data2 <- epc_data[(epc_data$Date=="1/2/2007")|(epc_data$Date=="2/2/2007"),]
epc_data2$DateTime <- paste(epc_data2$Date, epc_data2$Time)
epc_data2$DateTime <- strptime(epc_data2$DateTime, "%d/%m/%Y %H:%M:%S")


##plot 2
png(file="plot2.png",width=480,height=480)
with(epc_data2, plot(DateTime,Global_active_power,
                     ylab="Global Active Power (kilowatts)",
                     xlab="",
                     type="l"
                     ))
dev.off()
