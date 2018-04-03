install.packages("hydrostats")
# : Hydrologic Indices for Daily Time Series Data
library(hydrostats)
library(parallel)
library(DEoptim)
library(EcoHydRology)
library(jsonlite)


help(hydrostats)

##stats, utils, graphics


###（系统）stats
###统计包

###（系统）utils
###公用功能集合

###（系统）graphics
###绘图包

data(Acheron)
Acheron<-ts.format(Acheron)
plot(Acheron[,"Date"],Acheron[,"Q"],type="l", xlab="Date",ylab="Discharge (ML/day)")
# baseflows
baseflows(Acheron,a=0.975, ts="mean")
baseflows(Acheron,a=0.975, ts="annual")
head(baseflows(Acheron,a=0.975, ts="daily"))

# Cooper
data(Cooper)
Cooper<-ts.format(Cooper)

Colwells(Cooper, s=5)
Colwells(Cooper, boundaries="equal", s=11)
Colwells(Cooper, boundaries="log_class_size", s=11)
Colwells(Cooper, boundaries="weighted_log_class_size", s=11)

Colwells(Cooper, boundaries="Gan", from=1,by=1, s=4)
Colwells(Cooper, boundaries="Gan", from=0.25,by=0.25, s=9)

Colwells(Cooper, boundaries="Gan", from=0.25,by=0.25, s=9, indices.only=TRUE)
#CTF
CTF(Cooper)
# daily.cv
daily.cv(Cooper)

days<-c(366,1,365,1,366)
years<-c("1968","1975","1983","1990","2004")
day.dist(days=days, years=years)
days<-c(170,180,1,365,170)
day.dist(days=days, years=years)


flood.length.max(Cooper, threshold = 50000, ind.days = 5)

high.spell.lengths(Cooper, threshold=50000)
