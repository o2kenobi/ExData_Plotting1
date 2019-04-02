library(lubridate)
library(data.table)

#---get data
#zfile="exdata_data_household_power_consumption.zip" 
#pfile<-unzip(zfile)    #<--(uncomment these 2 lines if use the zip file)
pfile<-"household_power_consumption.txt"
dt  <- fread(pfile,sep=";")
sdt <- subset(dt, Date=="1/2/2007" | Date=="2/2/2007")       #<--get subset
sdt[,"datetime"]<-dmy_hms(paste(sdt$Date,sdt$Time,sep=" "))  #<--add a col w/ date/time
dim(sdt)      #--> just a quick check
names(sdt)    #--> check new col

#---make plot in png device
png(file="plot1.png",width = 480, height = 480)

hist(as.numeric(sdt$Global_active_power),col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
