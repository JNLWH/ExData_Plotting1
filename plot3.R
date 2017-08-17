# Create plot
with(df, 
     plot(Time, Sub_metering_1, 
          type = "l", 
          xlab = "", 
          ylab="Energy sub metering"))
with(df, 
     lines(Time, Sub_metering_2, 
           col="red"))
with(df, 
     lines(Time, Sub_metering_3, 
           col="blue"))
legend("topright", lty = 1, 
       col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Copy plot to a PNG file & then close PGN device off 
dev.copy(png, file = "plot3.png") 
dev.off()
