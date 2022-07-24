
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
#画直方图
png("plot2.png", width=480, height=480, units="px")
hist(new$Global_active_pow,col ="red" ,xlab ="Global active pow(kilowatt)" ,main ="Global active pow",ylim = c(0,1200) )
dev.off()