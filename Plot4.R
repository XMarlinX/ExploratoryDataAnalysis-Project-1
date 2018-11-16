# Calculate memory requirement in megabytes
#  Memory Required = (Rows * Columns * 8) / 2 ^ 20
MemoryRequirement <- (2075259 * 9) / 2^20
MemoryRequirement
if (MemoryRequirement <100){ print("Memory OK")} else {print ("Need more memory")}
# Read data file into data frame
Data <- read.table ("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
# Look at dataframe
head(Data)
str(Data)
# Look at how Date is formatted
head(Data$Date)
# Exract data for target dates: 1/2/2007 and 2/2/2007
Data <- subset(Data, Date == "1/2/2007" | Date == "2/2/2007")
# Convert Data$Global_active_power from factor to nueric
Data$Global_active_power <- as.numeric(Data$Global_active_power)
# Convert Sub_metering_1 and Sub_metering_2 from character to numeric
Data$Sub_metering_1 <- as.numeric(Data$Sub_metering_1)
Data$Sub_metering_2 <- as.numeric(Data$Sub_metering_2)
# Convert other data from charater to numeric
Data$Voltage <- as.numeric(Data$Voltage)
Data$Global_reactive_power <- as.numeric(Data$Global_reactive_power))
## Convert Data$Date from character to date
#Data$Date <- as.Date (Data$Date, format = "%d/%m/%Y")
## Convert time from character to time
#Data$Time <- format (Data$Time, format = "%h:$m:$S")
# Convert metering data from character to numeric
# Setup source into two rows and two columns
DateTime <- strptime( paste (Data$Date, Dae$Time, sep = " "), %d/%m/%Y %H:%M:%S)
par ( mfrow = c(2,2))
## Generate initial plots
plot(DateTime, Data$Global_active_power, type = "l", ylab = "Global ActivePower(kilowatts)", xlab = "")   
plot(Data$Voltage, type = "l", ylab = "Voltage", xlab ="datetime")
plot(Data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
## Add data for Sub_metering_2
lines (Data$Sub_metering_2, type = "l", col = "red")
##Add data for Sub_metering_3
lines (Data$Sub_metering_3, type = "l", col = "blue")
## Add legend
legend ("topright", legend = c ("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c ("black", "red", "blue"), lty = 1)
plot(Data$Global_reactive_power, type = "l", ylab = "Global Recative Power(kilowatts)", xlab = "datetime") 
#Copy screen display to png file
dev.copy(png, "Plot4.png")
#Close graphics device
dev.off()
  