#读取text文件
household_power_consumption <- read.csv("C:/Users/Administrator/Desktop/datasciencecoursera/household_power_consumption.txt", header=TRUE, sep=";")
# 转换编码格式
Sys.setlocale("LC_TIME","English")
#转换日期格式
household_power_consumption$Date<-as.Date(household_power_consumption$Date,'%d/%m/%Y')
#按日期筛选数据
startday <- as.Date("2007-02-01")
endday <- as.Date("2007-02-02")
new<-household_power_consumption[which(household_power_consumption$Date >= startday & household_power_consumption$Date <= endday),]
#转换数据类型
new$Global_active_power<-as.numeric(new$Global_active_power)
new$Sub_metering_1<-as.numeric(new$Sub_metering_1)
new$Sub_metering_2<-as.numeric(new$Sub_metering_2)
new$Sub_metering_3<-as.numeric(new$Sub_metering_3)
new$Voltage<-as.numeric(new$Voltage)
new$Global_reactive_power<-as.numeric(new$Global_reactive_power)
#合并time和date
new$dateTime = paste(new$Date, new$Time)
new$dateTime <- strptime(new$dateTime, "%Y-%m-%d %H:%M:%S")
#画图
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(new$dateTime, new$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(new$dateTime, new$Voltage, type="l", xlab="dateTime", ylab="Voltage ")
plot(new$dateTime, new$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(new$dateTime, new$Sub_metering_2, col="red")
lines(new$dateTime, new$Sub_metering_3, col="blue")
plot(new$dateTime, new$Global_reactive_power, type="l", xlab="dateTime",ylim = c(0,0.5), ylab="Global_reactive_power")
dev.off()