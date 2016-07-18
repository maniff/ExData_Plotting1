#Loading package sqldf
library(sqldf)

#Reading data from provided text file
elecdata <- read.csv.sql("household_power_consumption.txt"
                       , sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                       , header = TRUE
                       , sep = ";"
                       );

elecdata [elecdata == "?"] = NA;

#Setting output to PNG file
png("plot2.png", width = 480, height = 480);

#Ploting
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Global_active_power
     , type = "l"
     , xlab = ""
     , ylab = "Global Active Power (Killowatts)")
);

#Sending output to the file
dev.off()