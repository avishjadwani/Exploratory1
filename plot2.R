#I have downloaded the file provided on  Course link and unziped it in a desired folder
#NOw, I will check for the working library
getwd()
#[1] "C:/Users/Monika/Documents"
#Since it is not the desired folder I will change it 
setwd("C:/Users/Monika/Desktop/Week4/explore")
#checking
getwd()
# All set [1] "C:/Users/Monika/Desktop/Week4/explore"
#Now I will read the txt file using read.table to read the file
mydata<-read.table("household_power_consumption.txt", header=T, sep = ";")
#checking head() gives first 6 values
head(mydata)
#checking names using names()
names(mydata)
#[1] "Date"  "Time"  "Global_active_power" "Global_reactive_power" [5] "Voltage" 
#"Global_intensity"      "Sub_metering_1" "Sub_metering_2" [9] "Sub_metering_3"
# As suggested by the document we have to use strptime() so lets look what is in it
?strptime
#Date-time Conversion Functions to and from Character strptime(x, format, tz = "")
#current format of date is dd/mm/yyyy we have to convert it to yyyy-mm-dd 
#It is also suggested by the instructor that we should concat date and time
#lets do it

datetime<-paste(mydata$Date, mydata$Time, sep = " ")
#I will add this datetime as a column to our dataset ie. mydata
mydata$dt<-datetime
#Checking
head(mydata)
#NOw giving a proper format to dt
mydata$dt<-strptime(mydata$dt, "%d/%m/%Y %H:%M:%S")
#Checking
mydata$dt
#Now I will filter data to read values of only 1 and 2 feb
startdate<-which(mydata$dt==strptime("2007-02-01","%Y-%m-%d"))
enddate<-which(mydata$dt==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
filtereddata<-mydata[startdate:enddate,]
#Checking
head(filtereddata)
#all set . The data set is ready now 
# Beginining with plots
#plot 2
#OMG after lot of googling I got that we can make line graph with plot function 
# using type="l" > It is not 1 it is letter l(L) 
plot(filtereddata$dt, as.numeric(as.character(filtereddata$Global_active_power)),type="l",ylab="Global Active Power (Kilowatts)", xlab="")
