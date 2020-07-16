#Plot 3

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

png("plot3.png", width = 480, height = 480)
with(hhpc,{
  plot(dtime,hhpc$Sub_metering_1, type="l",
       ylab="Energy sub metering")
  lines(dtime,hhpc$Sub_metering_2,col='Red')
  lines(dtime,hhpc$Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)
dev.off()