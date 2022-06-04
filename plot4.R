hpc_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
dt1 <- as.Date('01/02/2007', '%d/%m/%Y')
dt2 <- as.Date('02/02/2007', '%d/%m/%Y')
hpc_data_sel <- hpc_data[which(as.Date(hpc_data$Date, '%d/%m/%Y') == dt1 | as.Date(hpc_data$Date, '%d/%m/%Y') == dt2), ]
head(hpc_data_sel)
hpc_data_sel$date_time <- strptime(paste(hpc_data_sel$Date, hpc_data_sel$Time), '%d/%m/%Y %H:%M:%S')
par(mfrow = c(2,2), mar = c(2, 2, 2, 2))

plot(hpc_data_sel$date_time, hpc_data_sel$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")

plot(hpc_data_sel$date_time, hpc_data_sel$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")

plot(hpc_data_sel$date_time, hpc_data_sel$Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = "")
lines(hpc_data_sel$date_time, hpc_data_sel$Sub_metering_1, type = 'l')
lines(hpc_data_sel$date_time, hpc_data_sel$Sub_metering_2, type = 'l', col = 'red')
lines(hpc_data_sel$date_time, hpc_data_sel$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", pch = '-', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(hpc_data_sel$date_time, hpc_data_sel$Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab = "datetime")