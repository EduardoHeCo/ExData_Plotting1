#Plot 4

if(!file.exists("./data")){dir.create("./data")}
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

hhpc<-read.table("./data/household_power_consumption.txt",sep=";",header=T,
                  stringsAsFactors=FALSE,dec=".")

hhpc<-subset(hhpc,hhpc$Date %in% c("1/2/2007","2/2/2007"))

hhpc$Global_active_power<- as.numeric(hhpc$Global_active_power)
dtime<-strptime(paste(hhpc$Date,hhpc$Time,sep=""),"%d/%m/%Y%H:%M:%S") 

hhpc$Sub_metering_1<- as.numeric(hhpc$Sub_metering_1)
hhpc$Sub_metering_2<- as.numeric(hhpc$Sub_metering_2)
hhpc$Sub_metering_3<- as.numeric(hhpc$Sub_metering_3)
hhpc$Voltage<- as.numeric(hhpc$Voltage)
hhpc$Global_reactive_power<- as.numeric(hhpc$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(hhpc,{
  plot(dtime,hhpc$Global_active_power, type = "l", ylab = "Global Active Power")
  plot(dtime,hhpc$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(dtime,hhpc$Sub_metering_1,type="l",ylab="Energy sub metering")
  lines(dtime,hhpc$Sub_metering_2,col='Red')
  lines(dtime,hhpc$Sub_metering_3,col='Blue')
  legend("topright",col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2)
  plot(dtime,hhpc$Global_reactive_power,type="l",xlab="datetime",ylab="Energy sub metering")
  
})
dev.off()






