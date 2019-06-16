library(datasets)
library(dplyr)
HPC<-read.delim("household_power_consumption.txt",sep=";")
HPC$Date<-as.Date(HPC$Date,format="%d/%m/%Y")

HPC_Sub<-subset(HPC,HPC$Date =="2007-02-01"|HPC$Date =="2007-02-02" )
HPC_Sub$datetime<-paste(HPC_Sub$Date,HPC_Sub$Time)
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot((as.POSIXct(HPC_Sub$datetime)),HPC_Sub$Global_active_power,type="l",main="",xlab="",ylab="Global Active pOwer(kilowatts)")

plot((as.POSIXct(HPC_Sub$datetime)),HPC_Sub$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")
plot((as.POSIXct(HPC_Sub$datetime)),HPC_Sub$Sub_metering_1,type="l",main="",xlab="",ylab="Energy Sub metering")
lines((as.POSIXct(HPC_Sub$datetime)),HPC_Sub$Sub_metering_2,type="l",col="red")
lines((as.POSIXct(HPC_Sub$datetime)),HPC_Sub$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),fill=c("black","red","blue"),bty="n",cex=0.7)

plot((as.POSIXct(HPC_Sub$datetime)),HPC_Sub$Global_reactive_power,type="l",main="",xlab="",ylab="Global_Reactive_power")
dev.off()
