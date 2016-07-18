#Loading package sqldf
library(sqldf)

#Reading data from provided text file
elecdata <- read.csv.sql("./data/household_power_consumption.txt"
                       , sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                       , header = TRUE
                       , sep = ";"
                       );

elecdata [elecdata == "?"] = NA;

#Setting output to PNG file
png("plot1.png", width = 480, height = 480)

#Ploting histogram
hist(as.numeric(elecdata$Global_active_power)
     , main  = "Global Active Power"
     , xlab = "Globar Active Power (kilowatts)"
     , col = "RED");

#Sending output to the file
dev.off()