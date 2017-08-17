library(data.table)
library(sqldf)
# downlaod zip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,
              destfile='power.zip',
              method="curl", # for OSX / Linux 
              mode="wb") # "wb" means "write binary," and is used for binary files
unzip(zipfile = "power.zip")
# extract needed rows only and close connection
df <- read.csv.sql("household_power_consumption.txt", 
                   sql = "select * from file where Date in ('1/2/2007','2/2/2007')", 
                   header = TRUE, 
                   sep = ";")
close(file("household_power_consumption.txt"))
# converting Date and Time to correct type
df$Date = as.Date(df$Date, '%d/%m/%Y')
df$Time = strptime(paste(df$Date,df$Time), '%Y-%m-%d %H:%M:%S')
# Create plot
hist(df$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
# Copy plot to a PNG file & then close PGN device off 
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
