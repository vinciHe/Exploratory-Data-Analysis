
#��ȡtext�ļ�
household_power_consumption <- read.csv("C:/Users/Administrator/Desktop/datasciencecoursera/household_power_consumption.txt", header=TRUE, sep=";")
# ת�������ʽ
Sys.setlocale("LC_TIME","English")
#ת�����ڸ�ʽ
household_power_consumption$Date<-as.Date(household_power_consumption$Date,'%d/%m/%Y')
#������ɸѡ����
startday <- as.Date("2007-02-01")
endday <- as.Date("2007-02-02")
new<-household_power_consumption[which(household_power_consumption$Date >= startday & household_power_consumption$Date <= endday),]
#ת����������
new$Global_active_power<-as.numeric(new$Global_active_power)
#�ϲ�time��date
new$dateTime = paste(new$Date, new$Time)
new$dateTime <- strptime(new$dateTime, "%Y-%m-%d %H:%M:%S")
#������ͼ
png("plot2.png", width=480, height=480, units="px")
plot(new$dateTime, new$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()