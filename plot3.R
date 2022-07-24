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
new$Sub_metering_1<-as.numeric(new$Sub_metering_1)
new$Sub_metering_2<-as.numeric(new$Sub_metering_2)
new$Sub_metering_3<-as.numeric(new$Sub_metering_3)
#合并time和date
new$dateTime = paste(new$Date, new$Time)
new$dateTime <- strptime(new$dateTime, "%Y-%m-%d %H:%M:%S")
#画折线图
png("plot3.png", width=480, height=480, units="px")
plot(new$dateTime, new$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
 lines(new$dateTime, new$Sub_metering_2, col="red")
 lines(new$dateTime, new$Sub_metering_3, col="blue")
dev.off()