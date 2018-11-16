# Calculate memory requirement in megabytes
#  Memory Required = (Rows * Columns * 8) / 2 ^ 20
MemoryRequirement <- (2075259 * 9) / 2^20
MemoryRequirement
if (MemoryRequirement <100){ print("Memory OK")} else {print ("Need more memory")}
# Read data file into data frame
Data <- read.table ("household_power_consumption.txt", header = TRUE, sep =";")
# Look at dataframe
head(Data)
str(Data)
# Exract data for target dates: 1/1/2007 and 2/2/2007
Data <- subset(Data, Date == "1/2/2007" | Date == "2/2/2007")
# Convert Data$Global_active_power from factor to nueric
Data$Global_active_power <- as.numeric(Data$Global_active_power)
# Generate histogram
 hist(Data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col="red")
# Copy screen display to png file
dev.copy(png, "Plot1.png")
#Close graphics device
 dev.off()
  