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


## Not run: 
require(dynatopmodel)
data("brompton")

# Upslope area and wetness index for Brompton catchment
layers <- build_layers(brompton$dem)
#属于sp的plot
sp::plot(layers, main=c("Elevation AMSL (m)", "Upslope area (log(m^2/m))", "TWI ((log(m^2/m))"))

## End(Not run)


data(brompton)

tab <- build_routing_table(brompton$dem,
                           chans=brompton$reaches,
                           breaks=5)
barplot(tab[,2]*100, xlab="Mean flow distance to outlet (m)",
        ylab="Network Width %", names.arg=tab[,1])


require(dynatopmodel)

data(brompton)

chans <- build_chans(brompton$dem, drn=brompton$drn, chan.width=2)

layers <- addLayer(brompton$dem, 2000-brompton$flowdists)
disc <- discretise(layers, cuts=c(flowdists=10), chans=chans, area.thresh=0.5/100)
rm(chans)
rm(layers)
View(write.table(disc$groups, sep="\t", row.names=FALSE))


data(brompton)

x11()
with(brompton$storm.run, disp_output(evap=ae*1000,qobs=qobs*1000,
                                     qsim=qsim*1000, rain=rain*1000,
                                     max.q=2, cex.main=1, col.axis="slategrey", las.time=1))

par <- get.disp.par(graphics.show=TRUE,
                    graphics.interval=6)

new_guid(n = 1, sep = "-", max = 1e+05)
data(brompton)
NSE(brompton$storm.run$qsim, brompton$storm.run$qobs)



require(dynatopmodel)
data(brompton)

# Examine the November 2012 event that flooded the village (see Metcalfe et al., 2017)
sel <- "2012-11-23 12:00::2012-12-01"
# Precalculated discretisation
disc <- brompton$disc
groups <- disc$groups
rain <- brompton$rain[sel]
# to 15 minute intervals
rain <- disaggregate_xts(rain, dt = 15/60)
# Reduce PE, seems a bit on high side and resulted in a weighting factor for the rainfall
pe <- brompton$pe[sel]/2
qobs <- brompton$qobs[sel]

# Here we apply the same parameter values to all groups.
# we could also consider a discontinuity at the depth of subsurface drains (~1m)
# or in areas more remote from the channel that do not contribute fast subsurface
# flow via field drainage
groups <- disc$groups
groups$m <- 0.0044
# Simulate impermeable clay soils
groups$td <-  33
groups$ln_t0 <- 1.15
groups$srz_max <- 0.1
qobs <- brompton$qobs[sel]
qt0 <- as.numeric(qobs[1,])
# initial root zone storage - almost full due to previous event
groups$srz0 <- 0.98
# Quite slow channel flow, which might be expected with the shallow and reedy
# low bedslope reaches with very rough banks comprising the major channel
groups$vchan <- 400
groups$vof <- 50
# Rain is supplied at hourly intervals: convert to 15 minutes
rain <- disaggregate_xts(rain, dt = 15/60)
weights <- disc$weights
# Output goes to a new window
graphics.off()
x11()

# Initial discharge from the observations
qt0 <- as.numeric(qobs[1,])

# Run the model across the November 2012 storm event
# using a 15 minute interval
run <- run.dtm(groups=groups,
               weights=weights,
               rain=rain,
               pe=pe,
               qobs=qobs,
               qt0=qt0,
               routing=brompton$routing,
               graphics.show=TRUE, max.q=2.4)


require(dynatopmodel)

data(brompton)

with(brompton$storm.run, time_at_peak(qsim))
??qsim

require(dynatopmodel)

data(brompton)

with(brompton$storm.run, time_to_peak(rain, qsim))


require(dynatopmodel)
data(brompton)

a.atb <- upslope.area(brompton$dem, atb=TRUE)
sp::plot(a.atb, main=c("Upslope area (log(m^2/m))", "TWI log(m^2/m)"))
require(dynatopmodel)
data("brompton")

chan.rast <- build_chans(dem=brompton$dem, drn=brompton$drn, buff=5, chan.width=2)
# show it
sp::plot(chan.rast[[1]], col="green", legend=FALSE)
