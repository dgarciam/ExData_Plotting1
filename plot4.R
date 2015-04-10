## Setting Working Dirs

workingDir = ("C:/Users/Dan/Documents/edhpc")
setwd(workingDir)

gfxData = read.csv("household_power_consumption.txt",sep=";",na.strings="?") ##Reading the Data
gfxData$Date = as.Date(gfxData$Date, format = "%d/%m/%Y") ##Converting the Dates
gfxData = subset(gfxData, Date >= "2007-02-01" & Date <= "2007-02-02") ##Subsetting desires dates
gfxData$FullDate = as.POSIXct(paste(as.Date(gfxData$Date),gfxData$Time)) ##Adding Dates and Times for some Plots

library(datasets)

par(mfrow = c(2,2),mar=c(4,4,2,0.5))

# Draws 1st Graphs
plot(gfxData$Global_active_power ~ gfxData$FullDate,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)") 

# Draws 2nd Graphs
plot(gfxData$Voltage ~ gfxData$FullDate, type = "l",xlab = "datetime",ylab = "Voltage")

#Draws 3rd Graphs
plot(gfxData$Sub_metering_1 ~ gfxData$FullDate,type = "l",xlab = "", ylab = "Energy sub metering") #Base Plot
points(gfxData$Sub_metering_2 ~ gfxData$FullDate,type = "l",col = "red") #Second Graph 
points(gfxData$Sub_metering_3 ~ gfxData$FullDate,type = "l",col = "blue") #Third Graph
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1,lwd=1,bty="n",cex=0.75,pt.cex=0.7)

#Draws 4th Graph
plot(gfxData$Global_reactive_power ~ gfxData$FullDate,type = "l",xlab = "datetime", ylab = "Global_reactive_power")

#Write to File. FileType = PNG
dev.copy(png, file = "plot4.png")
dev.off()
