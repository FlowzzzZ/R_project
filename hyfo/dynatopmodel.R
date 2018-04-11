install.packages("dynatopmodel")
## Implementation of the Dynamic TOPMODEL Hydrological Model
library(dynatopmodel)
library(deSolve)
library(zoo)
library(xts)
library(sp)
library(raster)
library(lubridate)
library(topmodel)
library(grDevices)
library(help = "grDevices")
library(stats)
library(utils)
library(tools)
library(help = "tools")
help(dynatopmodel)
# deSolve, maptools, rgdal, rgeos, zoo, xts, sp, raster,
# lubridate, topmodel, methods, grDevices, stats, utils,
# graphics, tools

###deSolve
###微分代数方程dae,常微分方程ode和偏微分方程pde的初值问题


###maptools
###操作和读取地图信息的工具集


###rgdal
###操作和读取地图信息的工具集



###rgeos
###通过C语言API，对几何图形进行拓扑学操作，是一种图形引擎的接口
###判断两个几何形状之间关系和对两个几何形状进行操作以形成新的几何形状的库



###zoo
###给不规则时间序列赋予相应的索引###



###xts
###创建一个可扩展的时间序列对象


###sp
###为S4级空间数据提供方法


###raster
###创建图层对象，可由多种文件类型创建

###lubridate
###对时间序列进行操作，如比较，筛选


###topmodel
###topmodel模型，是半分布式水文模型。

###（系统）methods
###面向S3的函数或者类的列表


###（系统）grDevices
###绘图包

###（系统）stats
###统计包

###（系统）utils
###公用功能集合

###（系统）graphics
###绘图包

###（系统）tools
###R包开发
par <- get.disp.par(graphics.show=TRUE,
                    graphics.interval=6)
par

data("brompton")

# Generate time series at hourly and 15 minute intervals
pe.60 <- approx.pe.ts("2012-01-01", "2012-12-31", dt=1)
pe.60 

pe.15 <- approx.pe.ts("2012-01-01", "2012-12-31", dt=0.25)



require(dynatopmodel)
data("brompton")

obs <- aggregate_obs(list("rain"=brompton$rain, "pe"=brompton$pe), dt=15/60)
View(rain)

data("brompton")

rain <- aggregate_xts(brompton$rain, dt=15/60)
