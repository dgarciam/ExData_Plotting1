## Setting Working Dirs

workingDir = ("C:/Users/Dan/Documents/edhpc")
setwd(workingDir)

gfxData = read.csv("household_power_consumption.txt",sep=";",na.strings="?") ##Reading the Data
gfxData$Date = as.Date(gfxData$Date, format = "%d/%m/%Y") ##Converting the Dates
gfxData = subset(gfxData, Date >= "2007-02-01" & Date <= "2007-02-02") ##Subsetting desires dates
gfxData$FullDate = as.POSIXct(paste(as.Date(gfxData$Date),gfxData$Time)) ##Adding Dates and Times for some Plots

library(datasets)
hist(gfxData$Global_active_power,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") #Drawing Plot

#Write to File. FileType = PNG
dev.copy(png, file = "plot1.png")
dev.off()
