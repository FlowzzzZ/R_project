install.packages("lfstat")
library(lfstat)
data(ngaruroro)
View(ngaruroro)
#Full period
hydrograph(ngaruroro)
#Hydrological year 1981 and 1982 with annual minima
hydrograph(ngaruroro, startdate = 1981, enddate = 1982, amin = TRUE)
#From 01/01/1981 to 31/03/1981
hydrograph(ngaruroro, startdate = "01/01/1981", enddate = "31/03/1981")
#Log - yaxis
hydrograph(ngaruroro, startdate = "01/01/1981", enddate =
             "31/03/1981",log = "y")

data(ngaruroro)
ng <- as.xts(ngaruroro)

year <- water_year(time(ng), origin = "Sept")
ng10 <- ng[year %in% 1991:2000, ]

# computes the annual minima (AM)
apply.seasonal(ng10, varying = "yearly", origin = 9)


data(ngaruroro)
n1 <- subset(ngaruroro, year %in% 1985:1989)
n2 <- subset(ngaruroro, year %in% 1990:1995)
dmcurve(n1,n2, namex = "'Ngaruroro 1985 - 1989'", namey = "'Ngaruroro 1990
- 1995'")

data(ngaruroro)
fdc(ngaruroro,year = 1991)

y <- rnorm(10)
pp <- gringorten(y)
pp

plot(pp ~ y, ylim = c(0, 1))


data(ngaruroro)
multistationsreport(ngaruroro, indices = c("meanflow", "MAM7"))

seventies <- subset(ngaruroro, hyear %in% 1970:1979)
eighties <- subset(ngaruroro, hyear %in% 1980:1989)
nineties <- subset(ngaruroro, hyear %in% 1990:1999)

multistationsreport(seventies, eighties, nineties)

data(ray)
r <- find_droughts(ray, threshold = 0.02)
plot(ray,type = "dygraph")

plot(r["1970::1970", ], step = FALSE)


data(ngaruroro)
sbplot(ngaruroro)
#Starting with january
sbplot(ngaruroro, hyearorder = FALSE)

## Not run: 
data(ngaruroro)
#To few points identified as peak flood discharge
recessionplot(ngaruroro, peaklevel = .5, start = 1991, end = 1991)

#To many
recessionplot(ngaruroro, peaklevel = .999, start = 1991, end = 1991)

#Good choice?
recessionplot(ngaruroro, peaklevel = .92, start = 1991, end = 1991)

#Getting peakdays for 1991
peak <- recessionplot(ngaruroro, peaklevel = .92, plot = FALSE)
rain1991 <- subset(ngaruroro, subset = hyear == 1991 && peak, select = c(day, month, year))
## End(Not run)


x <- c(-2, 3)
curve(sin, -2*pi, 2*pi, xname = "t")
trace_value(x, sin(x), digits = c(0, 1))


data(ray)
ray <- as.xts(ray)

# calculate baseflow and plot it
ray$baseflow <- baseflow(ray$discharge)
ray96 <- ray[format(time(ray), "%Y") == "1996", ]
plot(ray96$discharge, type = "l")
lines(ray96$baseflow, col = 2)

# aggregated base flows for river Ray
# these are mean flow totals per day, not per year as written
# in Tallaksen and van Lanen (2004)
round(colSums(ray96[, c("discharge", "baseflow")]), 2)


data(ngaruroro)
BFI(ngaruroro)
BFI(ngaruroro, breakdays = c("01/11","01/05"))
BFI(ngaruroro, year = 1991)
bfplot(ngaruroro, year = 1991)



C



data("ngaruroro")
ng <- as.xts(ngaruroro)

# yearly minima
minima <- apply.yearly(ng$discharge, min, na.rm = TRUE)

# fit a Weibull distribution
fit <- evfit(x = as.vector(minima), distribution = "wei")

# compute return periods
minima$rp <- round(ev_return_period(minima, fit), 2)

print(minima)
plot(discharge ~ rp, data = minima,
     xlab = "Flow in m^3/s", ylab = "Return period in years")


data(ray)
ray <- as.xts(ray)["1970::1979", ]
r <- find_droughts(ray)
head(r)
summary(r)


plot(r)

data(ray)
ray <- as.xts(ray)["1970::1970", ]

# currently discharges are in cubic metres per second
flowunit(ray)


y <- rnorm(10)
pp <- CC(y)
pp

plot(pp ~ y, ylim = c(0, 1))



data(ngaruroro)
hyear_start(ngaruroro)


ma(1:10, n = 3, sides = 2)

ma(1:10, n = 3)  


data(ngaruroro)
MAM(ngaruroro)
MAM(ngaruroro, year = 1991:1995) #Taking values from 1991 to 1995 (1991,1992,...,1995)


data(ngaruroro)
meanflow(ngaruroro)
meanflow(ngaruroro, breakdays = c("01/11","01/05"))
meanflow(ngaruroro, year = 1991)


data(ray)
r <- find_droughts(ray, threshold = 0.02)
plot(r["1970::1970", ])

plot(r["1970::1970", ], step = FALSE)



data(ngaruroro)
ng <- as.xts(ngaruroro)
ng <- ng["1986::1990", ]

drought <- find_droughts(ng)


ic <- pool_ic(drought)
summary(ic)

ma <- pool_ma(drought)
summary(ma)

sp <- pool_sp(drought)
summary(sp)
plot(sp)


data(ngaruroro)

#Toy example to get some more "rivers"
seventies <- subset(ngaruroro, hyear %in% 1970:1979)
eighties <- subset(ngaruroro, hyear %in% 1980:1989)
nineties <- subset(ngaruroro, hyear %in% 1990:1999)

rfaplot(list(seventies,eighties,nineties), n=3)



data("ngaruroro")
y <- tyears(ngaruroro, dist = "wei", event = 100, plot = TRUE)
rp <- c(1.42, 5, 10)
rpline(y, return.period = rp, suffix = c("a", "m\u00B3"))


data(ngaruroro)
sbplot(ngaruroro)
#Starting with january
sbplot(ngaruroro, hyearorder = FALSE)




data(ngaruroro)
Q95(ngaruroro)


data(ngaruroro)
hyear_start(ngaruroro)
plot(ngaruroro)


hyear_start(ray)


data(ngaruroro)
#Start of the hydrological year (01/12) is taken as second breakday
seasindex(ngaruroro)


data(ngaruroro)
#Start of the hydrological year (01/12) is taken as second breakday
seasratio(ngaruroro, breakdays = "01/07")

#Two breakdays
seasratio(ngaruroro, breakdays = c("01/03","01/09"))


## Not run: 
data(ngaruroro)
seglenplot(ngaruroro)
## End(Not run)

attr(ray, "lfobj")


data(ngaruroro)
#Default: no unit
bfplot(ngaruroro, year = 1991)

#The plot does not change, just the y-label does!
setlfunit("m^3/s")
bfplot(ngaruroro,year = 1991)

#Some possible labels:

setlfunit("scriptscriptstyle(frac(m^3,s))")


data(ray)
ray <- as.xts(ray)["1970::1970", ]
r <- find_droughts(ray, threshold = 0.02)
summary(r)      # minor events got filtered


data(ngaruroro)
streamdefplot(ngaruroro, year = 1991)


data("ngaruroro")
rp <- c(1.3, 3, 5, 35)
sumD <- tyearsS(ngaruroro, event = rp, dist = "wei",
                variable = "d", aggr = sum)
sumD
summary(sumD)

data("ngaruroro")
thr1 <- vary_threshold(ng, varying = "weekly", fun = mean, na.rm = TRUE)
plot(thr1)


# generating monthly sequence
x <- seq(from = as.Date("1992-01-01"),
         by = "months", length.out = 12)

# specifying the beginning with a decimal number
water_year(x, origin = 10)

