# Read in data file and convert date and time column to appropriate classes.

power <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?', colClasses=c('character','character',rep('numeric',7)))
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$DateTime <- strptime(paste(power$Date, power$Time), format='%Y-%m-%d %H:%M:%S')

# Subset data to 2007-02-01 and 2007-02-02

power_subset <- power[power$Date == '2007-02-01' | power$Date == '2007-02-02',]

# Create PNG file
png('plot1.png', height=480, width=480)

# Make plot 1: the histogram of global active power
hist(power_subset$Global_active_power, 
     col='red', 
     xlab='Global Active Power (kilowatts)', 
     ylab='Frequency',
     main='Global Active Power')

# Close PNG device.
dev.off()