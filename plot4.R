# ******** READ FILE *******
setwd("/home/inigo/ExploratoryDataAnalysis/Project1")
d1 = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# date conversion
d1$DateD = as.Date(d1$Date,"%d/%m/%Y")
# filter 2007-02-01 and 2007-02-02
d1 = subset(d1, DateD == "2007-02-01" | DateD == "2007-02-02")
# datetime conversion
d1$DateTime = strptime(paste(d1$Date," ",d1$Time), format = "%d/%m/%Y %H:%M:%S")

# ******** PLOT4 ********
# arrange two rows and two columns
par(mfrow=c(2,2))
#4.1
plot(d1$DateTime,d1$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#4.2
plot(d1$DateTime,d1$Voltage,type="l",xlab="datetime",ylab="Voltage")
#4.3
plot(d1$DateTime,d1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(d1$DateTime,d1$Sub_metering_2,col="red")
lines(d1$DateTime,d1$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), border="white",lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
#4.4
plot(d1$DateTime,d1$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#png
dev.copy(png, file="plot4.png")
dev.off()
