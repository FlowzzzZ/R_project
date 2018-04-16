#hydroTSM
library(hydroTSM)
library(hydroGOF)
library(ggplot2)
library(hyfo)
library(RODBC)
install.packages("broom")
library(zoo)
library(weatherr)
library(forecast)
library(ggfortify)
library(broom)
broom
#############
##读取数据##
data(OcaEnOnaQts)


channel = odbcConnect("zhchdata", uid = "root", pwd = "1234") #读取数据库




#月数据
MonthData <- sqlQuery(
  channel,
  "select avg(rz) as data ,DATE_FORMAT(test_w.tm,'%Y-%m-%d') as days from test_w where DATE_FORMAT(test_w.tm,'%Y-%m')='2015-01' 
  and stcd='12910540' group by days"
  )




#####################################hydroTSM#########################################################

#转换数据格式
MonthData<-zoo(MonthData$data, order.by=as.Date(as.character(MonthData$days)))

hydroplot(OcaEnOnaQts,FUN=mean,var.unit = "mm",ptype="ts+boxplot", 
          main="hydroplot",xlab = "日期",ylab = "流量",tick.tstep="months",lab.tstep="days",
          col = "black")


#####################################hyfo#########################################################
MonthData1 <- as.data.frame(MonthData1)
MonthData2 <- as.data.frame(MonthData2)
plotTS(MonthData1,MonthData2, plot = 'norm')
plotTS(MonthData1,plot = 'norm')

#####################################wq#########################################################

data(testdl)

a <- testdl[[1]]
View(a)
# Choose example from "1994-2-4" to "1996-1-4"
b <- getHisEnsem(a, example = c('1994-2-4', '1996-1-4'))

# Default interval is one year, can be set to other values, check help for information.

# Take 7 months as interval
b <- getHisEnsem(a, example = c('1994-2-4', '1996-1-4'), interval = 210, plot = 'cum') 
# Take 30 days as buffer
b <- getHisEnsem(a, example = c('1994-2-4', '1996-1-4'), interval = 210, buffer = 30)


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/










#日数据（转换为zoo）
DayData<- sqlQuery(
  channel,
  "select DATE_FORMAT(test_w.tm,'%Y-%m-%d %H:%i:%S') as hours , avg(rz) as data from test_w where DATE_FORMAT(test_w.tm,'%Y-%m-%d %i:%S')='2015-01-01 00:00' 
  and stcd='12910540' group by hours"
)

DayData<-zoo(DayData$data, order.by=as.POSIXct(as.character(DayData$hours)))
View(DayData)

hydroplot(DayData,FUN=mean,ptype="ts", pfreq="o",var.unit = "mm",
          main="hydroplot",xlab = "日期",ylab = "流量",
          col = "black")

DayData$hours<- as.POSIXct(as.character(DayData$hours))
plotTS(DayData,plot = 'norm')






#多图融合(不成功)
MonthData1 <- sqlQuery(
  channel,
  "select DATE_FORMAT(test_w.tm,'%Y-%m-%d') as days, avg(rz) as data from test_w where DATE_FORMAT(test_w.tm,'%Y-%m')='2015-01' 
  and stcd='12910540' group by days"
)
MonthData2 <- sqlQuery(
  channel,
  "select DATE_FORMAT(test_w.tm,'%Y-%m-%d') as days, avg(rz) as data from test_w where DATE_FORMAT(test_w.tm,'%Y-%m')='2015-01' 
  and stcd='21010080' group by days"
)

MonthData <- merge(
  MonthData1,
  MonthData2,
  by = "days",
  all.x = TRUE,
  all.y = TRUE
  
)
MonthData = melt(MonthData, id = "days")





######################################################预测##################################
######## Time series biascorrection
########

MonthData <- sqlQuery(
  channel,
  "select avg(rz) as data ,DATE_FORMAT(test_w.tm,'%Y-%m-%d ') as days from test_w where stcd='12910540 ' group by days"
)
str(MonthData)




aa<-zoo(MonthData$data, order.by=as.Date(as.character(MonthData$days)))



aadiff <- diff(aa, differences=1)
Acf(aadiff,lag.max = 50)
Pacf(aadiff)
auto.arima(aadiff,trace=T)

airarima1 <- arima(aa,order=c(0,1,1))

airarima2 <- forecast(airarima1,10)


autoplot(airarima2,xlab="aaaaa")


fit <- ets(aa,model = "ANN")

qq <- forecast(fit,5)
tidy(airarima1)
str(airarima1)
autoplot(qq)





################################################################################################
#先取得数据，再进行日期合并
DayData<- sqlQuery(
  channel,
  "select DATE_FORMAT(test_w.tm,'%Y-%m-%d %H:%i:%S') as hours , avg(rz) as data from test_w where DATE_FORMAT(test_w.tm,'%Y-%m')='2015-01' 
  and stcd='12910540' group by hours"
)
aa<-zoo(DayData$data, order.by=as.POSIXct(as.character(DayData$hours)))



aadiff <- diff(aa, differences=1)
Acf(aadiff)
Pacf(aadiff)
auto.arima(aadiff,trace=T)

airarima1 <- arima(aa,order=c(0,1,3))

airarima2 <- forecast(airarima1,200)


autoplot(airarima2,xlab="aaaaa",include="20")

fit <- arima(lh, order = c(1, 0, 0))
tidy(fit)
glance(fit)


require(graphics)
(fit1 <- arima(presidents, c(1, 0, 0)))
nobs(fit1)
tsdiag(fit1)
(fit3 <- arima(presidents, c(3, 0, 0)))  # smaller AIC
tsdiag(fit3)
BIC(fit1, fit3)
## compare a whole set of models; BIC() would choose the smallest
AIC(fit1, arima(presidents, c(2,0,0)),
    arima(presidents, c(2,0,1)), # <- chosen (barely) by AIC
    fit3, arima(presidents, c(3,0,1)))

## An example of ARIMA forecasting:

autoplot(predict(fit3, 3))
