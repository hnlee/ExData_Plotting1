# Read in data file and convert date and time column to appropriate classes.

power <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?', colClasses=c('character','character',rep('numeric',7)))
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$DateTime <- strptime(paste(power$Date, power$Time), format='%Y-%m-%d %H:%M:%S')

# Subset data to 2007-02-01 and 2007-02-02

power_subset <- power[power$Date == '2007-02-01' | power$Date == '2007-02-02',]

# Create PNG file
png('plot3.png', height=480, width=480)

# Make plot 3: Sub metering over time
plot(y=power_subset$Sub_metering_1, 
     x=power_subset$DateTime,
     type='l',
     xlab='Datetime',
     ylab='Energy sub metering')
lines(y=power_subset$Sub_metering_2,
      x=power_subset$DateTime,
      col='red')
lines(y=power_subset$Sub_metering_3,
      x=power_subset$DateTime,
      col='blue')
legend(x='topright',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black','red','blue'), lty=1)

# Close PNG device.
dev.off()