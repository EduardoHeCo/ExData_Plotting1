#Plot_2

if(!file.exists("./data")){dir.create("./data")}
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

hhpc<-read.table("./data/household_power_consumption.txt",sep=";",header=T,
                  stringsAsFactors=FALSE,dec=".")

hhpc<- subset(hhpc, hhpc$Date %in% c("1/2/2007","2/2/2007"))


hhpc$Global_active_power<- as.numeric(hhpc$Global_active_power)


dtime<-strptime(paste(hhpc$Date,hhpc$Time,sep=""),"%d/%m/%Y%H:%M:%S") 

png("plot2.png", width = 480, height = 480)
plot(dtime,hhpc$Global_active_power,type="l",ylab="Global Active Power(kilowatts)")
dev.off()














