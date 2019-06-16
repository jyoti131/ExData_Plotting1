library(datasets)
library(dplyr)
HPC<-read.delim("household_power_consumption.txt",sep=";")
HPC$Date<-as.Date(HPC$Date,format="%d/%m/%Y")
png(filename="plot1.png",width=480,height=480)
HPC_Sub<-subset(HPC,HPC$Date =="2007-02-01"|HPC$Date =="2007-02-02" )
head(HPC_Sub)
hist(as.numeric(HPC_Sub$Global_active_power),plot=TRUE,col="red",main="Global Active power",xlab="Global Active Power(kilowatts")
dev.off()


           