# Create plot
plot(df$Time, df$Global_active_power, 
     type = 'l', 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
# Copy plot to a PNG file & then close PGN device off 
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
