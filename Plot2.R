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
# Convert Data$Date from character to date
Data$Date <- as.Date (Data$Date, format = "%d/%m/%Y")
# Convert time from character to time
Data$Time <- format (Data$Time, format = "%h:$m:$S")
# Generate plot
 plot(Data$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "") 
#The above code has proper lines and y axis but x axis is numeric not weekday.
# The code below produces no lines but proper y and x axis.
#plot(Data$Date, Data$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")                
# Copy screen display to png file
dev.copy(png, "Plot2.png")
#Close graphics device
dev.off()
  