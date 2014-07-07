# ******** READ FILE *******
setwd("/home/inigo/ExploratoryDataAnalysis/Project1")
d1 = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# date conversion
d1$DateD = as.Date(d1$Date,"%d/%m/%Y")
# filter 2007-02-01 and 2007-02-02
d1 = subset(d1, DateD == "2007-02-01" | DateD == "2007-02-02")
# datetime conversion
d1$DateTime = strptime(paste(d1$Date," ",d1$Time), format = "%d/%m/%Y %H:%M:%S")

# ******** PLOT1 ********
hist(d1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
