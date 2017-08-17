# Create grid
par(mfrow = c(2, 2))
# Create 4 plots
with(df, {
        plot(df$Time, df$Global_active_power, 
             type = 'l', 
             xlab = "", 
             ylab = "Global Active Power")
        plot(df$Time, df$Voltage, 
             type = 'l', 
             xlab = "datetime", 
             ylab = "Voltage")
        plot(Time, Sub_metering_1, 
             type = "l", 
             xlab = "", 
             ylab="Energy sub metering")
        lines(Time, Sub_metering_2, col="red")
        lines(Time, Sub_metering_3, col="blue")
        legend("topright", lty = 1, 
               col = c("black","blue", "red"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               cex = 0.5, pt.cex=cex)
        plot(df$Time, df$Global_reactive_power, 
             type = 'l', 
             xlab = "datetime", 
             ylab = "Global_reactive_power")
})
# Copy plot to a PNG file & then close PGN device off 
dev.copy(png, file = "plot4.png") 
dev.off()
