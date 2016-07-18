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
png("plot41.png", width = 480, height = 480);

par(mfrow = c(2, 2))
#Ploting

#Plot 1
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Global_active_power
            , type = "l"
            , xlab = ""
            , ylab = "Global Active Power"
     )
)

#Plot 2
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Voltage
            , type = "l"
            , xlab = "datetime"
            , ylab = "Voltage"
     )
)


#Plot 3
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Sub_metering_1
            , type = "n"
            , xlab = ""
            , ylab = "Energy sub metering"
     )
)
par(new = TRUE)
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Sub_metering_1
            , type = "l"
            , xlab = ""
            , ylab = ""
            #, axes = FALSE
            )
)
par(new = TRUE)
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Sub_metering_2
            , type = "l"
            , xlab = ""
            , ylab = ""
            #, axes = FALSE
            , col = "Red"
            , ylim = range(elecdata$Sub_metering_1)
            )
)
par(new = TRUE)
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Sub_metering_3
            , type = "l"
            , xlab = ""
            , ylab = ""
            , axes = FALSE
            , col = "Blue"
            , ylim = range(elecdata$Sub_metering_1)
            )
)

legend(x = "topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col = c('Black','Red','Blue')
       , lwd = c(1, 1, 1)
       , bty = "n"
       )

#Plot 4
with(elecdata
     , plot(strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S")
            , elecdata$Global_reactive_power
            , type = "l"
            , xlab = "datetime"
            , ylab = "Global_reactive_power"
     )
)

#Sending output to the file
dev.off()