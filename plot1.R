## set working directory
setwd("C:/cxia/learning/Data Science Specialization/Exploratory Data Analysis")

##load data
epc_data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",
                     na.strings="?",stringsAsFactors=FALSE)
epc_data2 <- epc_data[(epc_data$Date=="1/2/2007")|(epc_data$Date=="2/2/2007"),]
epc_data2$DateTime <- paste(epc_data2$Date, epc_data2$Time)
epc_data2$DateTime <- strptime(epc_data2$DateTime, "%d/%m/%Y %H:%M:%S")

##plot 1
png(file="plot1.png",width=480,height=480)
hist(epc_data2$Global_active_power,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)",col="red")
dev.off()
