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