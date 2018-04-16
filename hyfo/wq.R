install.packages("wq")
##Exploring Water Quality Monitoring Data
library(ggplot2)
library(knitr)

library(wq)
help(aggregate)

###graphics, grDevices, methods, stats, ggplot2 (>= 1.0), knitr(>= 1.1), reshape2, zoo

# plotTs
sfbayChla
chl <- sfbayChla[, 1:4]
plotTs(chl, dot.size = 1.5, ylab = 'Chl-a', strip.labels = paste('Station',
                                                                 substring(colnames(chl), 2, 3)), ncol = 1, scales = "free_y")

# plotTsAnom ?

plotTsAnom(chl, ylab = 'Chl-a', strip.labels = paste('Station',
                                                       substring(colnames(chl), 2, 3)), ncol = 1, scales = "free_y")


# plotTsTile ?
chl27 = sfbayChla[, 's27']
plotTsTile(chl27, legend.title = 'Chl log-anomaly')

# layerMean
z = c(1,2,3,5,10)  # 5 depths
x = matrix(rnorm(30), nrow = 5)  # 6 variables at 5 depths
layerMean(cbind(z, x))

#meanSub
z1=c(1,2,3,5)
z1
meanSub(z,z1)


#eof
# Create an annual matrix time series
chla1 <- aggregate(sfbayChla, 1, mean, na.rm = TRUE)
chla1 <- chla1[, 1:12]  # remove stations with missing years
# eofNum (see examples) suggests n = 1
e1 <- eof(chla1, 1)
eofNum(chla1)
eofPlot(e1, type = 'coef')
eofPlot(e1, type = 'amp')


# phenoAmp
y <- sfbayChla[, 's27']
phenoAmp(y) # entire year
phenoAmp(y, c(1, 6)) # i.e., Jan-Jun only, which yields results for more years
plot(sfbayChla[, 1:10], main = "SF Bay Chl-a")

plot(y)

# phenoPhase
y <- sfbayChla[, 's27']
p1 <- phenoPhase(y)
p1
phenoPhase(y, c(3, 10))

# plotSeason
chl27 <- sfbayChla[, 's27']
plotSeason(chl27, num.era = c(1978, 1988, 1998, 2008), ylab = 'Stn 27 Chl-a')
plotSeason(chl27, num.era = 3, same.plot = FALSE, ylab = 'Stn 27 Chl-a')
plotSeason(chl27, "by.month", ylab = 'Stn 27 Chl-a')














dates <- as.Date(c("1996-01-01", "1999-12-31", "2004-02-29", "2005-03-01"))
date2decyear(dates)

decyear2date(c(1996.0014, 1999.9986, 2004.1626, 2005.1630))


monthNum(y)

y = Sys.time()
years(dates)


z = c(1,2,3,5,10)  # 5 depths
x = matrix(rnorm(30), nrow = 5)  # 6 variables at 5 depths
layerMean(cbind(z, x))


y <- mts2ts(sfbayChla, seas = 2:4)
plot(y, type = 'n')
abline(v = 1978:2010, col = 'lightgrey')
lines(y, type = 'h')
y

showClass("WqData")

sfb <- wqData(sfbay, c(1,3,4), 5:12, site.order = TRUE, type = "wide", 
              time.format = "%m/%d/%Y")
# Summarize the data
summary(sfb)

chl27 = sfbayChla[, 's27']
plotTsTile(chl27, legend.title = 'Chl log-anomaly')

c27 <- sfbayChla[, 's27']
seaKen(tsSub(c27))  # Aug and Dec missing the most key data
seaKen(tsSub(c27, seas = c(1:6, 9:11)))

y <- decompTs(sfbayChla[, 's27'])
y
plot(y, nc=1, main="")


chl27 <- sfbayChla[, 's27']
plotSeason(chl27, num.era = c(1978, 1988, 1998, 2008), ylab = 'Stn 27 Chl-a')
plotSeason(chl27, num.era = 3, same.plot = FALSE, ylab = 'Stn 27 Chl-a')
plotSeason(chl27, "by.month", ylab = 'Stn 27 Chl-a')



leapYear(seq(1500, 2000, 100))

chl27 <- sfbayChla[, 's27']
monthCor(chl27)

y <- mts2ts(sfbayChla, seas = 2:4)
plot(y, type = 'n')
abline(v = 1978:2010, col = 'lightgrey')
lines(y, type = 'h')

# data from Pettitt (1979, Table 1):
y <- c(-1.05, 0.96, 1.22, 0.58, -0.98, -0.03, -1.54, -0.71, -0.35, 0.66, 0.44,
       0.91, -0.02, -1.42, 1.26, -1.02, -0.81, 1.66, 1.05, 0.97, 2.14, 1.22, -0.24,
       1.60, 0.72, -0.12, 0.44, 0.03, 0.66, 0.56, 1.37, 1.66, 0.10, 0.80, 1.29, 0.49,
       -0.07, 1.18, 3.29, 1.84)
pett(y) # K=232, p=0.0146, change-point=17, the same results as Pettitt

tsp(chl27)
chl27 <- round(chl27, 1)
ts2df(chl27, mon1 = 10, addYr = TRUE)
ts2df(chl27, mon1 = 10, addYr = TRUE, omit = TRUE)



# Create new WqData object
sfb <- wqData(sfbay, c(1, 3:4), 5:12, site.order = TRUE,
              time.format = "%m/%d/%Y", type = "wide")

# Find means in the 0-10 m layer
y <- tsMake(sfb, focus = 's27', layer = c(0, 10))
plot(y, main = 'Station 27')


x <- sfbayChla
seasonTrend(x)
seasonTrend(x, plot = TRUE, ncol = 4)

sfb1 <- subset(sfbay, depth == 1 & stn == 32)
dox.pct <- with(sfb1, 100 * dox/oxySol(temp, sal))
summary(dox.pct)



y <- sfbayChla
y1 <- interpTs(y, gap=1)  # interpolate single-month gaps only
y2 <- aggregate(y1, 1, mean, na.rm=FALSE)
mannKen(y2)
mannKen(y2, plot=TRUE) # missing data means missing trend estimates
mannKen(y2, plot=TRUE, xlim = c(0.1, 0.25))
mannKen(y2, plot=TRUE, type='relative', order = TRUE, pval = .001,
        xlab = "Relative trend")
legend("topleft", legend = "p < 0.001", pch = 19, bty="n")


chl <- sfbayChla # monthly chlorophyll at 16 stations in San Francisco Bay
seaKen(sfbayChla[, 's27']) # results for a single series at station 27
seaKen(sfbayChla) # results for all stations
seaKen(sfbayChla, plot=TRUE, type="relative", order=TRUE)
chl27 <- sfbayChla[, 's27']
seaRoll(chl27)
seaRoll(chl27, plot = TRUE)

x <- sfbayChla[, 's27']
trendHomog(x)






