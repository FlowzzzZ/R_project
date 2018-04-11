install.packages("hydrostats")
# : Hydrologic Indices for Daily Time Series Data
library(hydrostats)
library(parallel)
library(DEoptim)
library(EcoHydRology)
library(jsonlite)


help(ts.format)

##stats, utils, graphics


###（系统）stats
###统计包

###（系统）utils
###公用功能集合

###（系统）graphics
###绘图包
data(Cooper)
Cooper<-ts.format(Cooper)

head(hydro.year(Cooper))
head(hydro.year(Cooper, year.only=TRUE))


years<-c("1968","1975","1983","1990","2004")
get.days(years)

data(Acheron)
Acheron<-ts.format(Acheron)
View(Acheron)
plot(Acheron[,"Date"],Acheron[,"Q"],type="l", xlab="Date",ylab="Discharge (ML/day)")
# baseflows
baseflows(Acheron,a=0.975, ts="mean")
baseflows(Acheron,a=0.975, ts="annual")
head(baseflows(Acheron,a=0.975, ts="daily"))

# Cooper
data(Cooper)
Cooper<-ts.format(Cooper)
View(Cooper)
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



data(Cooper)
cooper<-ts.format(Cooper)
ann.cv(Cooper)

data(Cooper)
Cooper<-ts.format(Cooper)

daily.cv(Cooper)

days<-c(365,365,365,365,366)
years<-c("1968","1975","1983","1990","2004")
day.dist(days=days, years=years)


days<-c(170,180,1,365,170)
day.dist(days=days, years=years)

data(Cooper)
Cooper<-ts.format(Cooper)

flood.length.max(Cooper, threshold = 50000, ind.days = 5)

data(Cooper)
Cooper<-ts.format(Cooper)

high.spell.lengths(Cooper, threshold=50000)

data(Cooper)
Cooper<-ts.format(Cooper)

high.spells(Cooper, quant=0.9)

high.spells(Cooper, quant=0.9, ann.stats=FALSE, plot=FALSE)

high.spells(Cooper, quant=0.9, ann.stats=FALSE, ignore.zeros=TRUE)

high.spells(Cooper, quant=0.9, ann.stats=FALSE, ignore.zeros=TRUE, hydro.year=TRUE)


data(Cooper)
Cooper<-ts.format(Cooper)

low.spell.lengths(Cooper, threshold=50000)

data(Cooper)
Cooper<-ts.format(Cooper)

low.spells(Cooper, quant=0.1)

low.spells(Cooper, quant=0.1, hydro.year=TRUE)


data(Cooper)
Cooper<-ts.format(Cooper)
ann.cv(Cooper)


data(Cooper)
Cooper<-ts.format(Cooper)

seasonality(Cooper, monthly.range=TRUE)

x <- as.POSIXct(c("01/01/43","01/01/68","01/01/69","01/01/99","01/01/04"), format="%d/%m/%y")
x
four.digit.year(x, year=1968)
