install.packages("waterData")
# An R Package for Retrieval, Analysis, and Anomaly Calculation of Daily Hydrologic Time Series Data
install.packages("data.table")
library(waterData)
library(data.table)
help(data)
# plotAnoms
#Function to import daily hydrologic time series data given a USGS streamgage identification number.
q05054000.85 <- importDVs("05054000", sdate="1985-01-01", edate="2010-09-30")
#Function to calculate short-, medium-, and long-term hydrologic anomalies
anoms05054000 <- compAnom(q05054000.85, which=3)
#参考帮助文档的Value
plotAnoms(anoms05054000)


# plotParam
# Function to plot hydrologic times series. Will plot more than one site at a time.
#这里 用data加载数据，但是却显示无法找到exampleWaterData对象
data(exampleWaterData)
plotParam(misQ05054000, code="00060", stat="00003", logscale=TRUE)
plotParam(misQ05054000, code=attributes(misQ05054000)$code, 
        stat=attributes(misQ05054000)$stat, logscale=TRUE)

# misQ05054000
plot(misQ05054000$dates, misQ05054000$val, type="l", log="y", 
     ylab="Streamflow, in cubic feet per second", 
     xlab="", yaxs='i', xaxs='i', 
     xlim=c(as.Date("2000-01-01"), as.Date("2012-01-01")), ylim=c(10,50000), 
     yaxt="n")
View(misQ05054000)

data(exampleWaterData)
summaryStats(pH05082500, staid="05082500")

staInfo <- siteInfo("05054000")
staInfo