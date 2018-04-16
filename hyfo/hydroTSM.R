install.packages("hydroTSM")
library(xts)

library(hydroTSM)



## Loading the SanMartino daily precipitation data (1921-1990)
data(SanMartinoPPts)
x <- SanMartinoPPts
View(x)
# Amount of years in 'x' (needed for computing the average)
nyears <- length( seq(from=time(x[1]), to=time(x[length(x)]), by="years") )

## Average annual precipitation for the 70 years period. 
# It is necessary to divide by the amount of years to obtain the average annual value, 
# otherwise it will give the total precipitation for all the 70 years.
annualfunction(x, FUN=sum, na.rm=TRUE) / nyears


######################
## Ex1: Loading the DAILY precipitation, maximum and minimum air temperature at 
##      station Maquehue Temuco Ad (Chile)
data(MaquehueTemuco)
pcp <- MaquehueTemuco[, 1]
tmx <- MaquehueTemuco[, 2]
tmn <- MaquehueTemuco[, 3]

## Plotting the climograph
m <- climograph(pcp=pcp, tmx=tmx, tmn=tmn, na.rm=TRUE)



## Ex1: Loading the DAILY precipitation data at SanMartino
data(SanMartinoPPts)
x <- SanMartinoPPts
View(x)
## Daily to Annual
daily2annual(x, FUN=sum, na.rm=TRUE)

## Sequence of daily dates between "1961-01-01" and "1961-12-31" ##
dip("1961-01-01", "1961-12-31")

## Number of days between "1961-01-01" and "1965-06-30", 
## but using "%d-%m-%Y" as date format.
dip("01-01-1961", "30-06-1965", date.fmt= "%d-%m-%Y", out.type = "nmbr")

############
## Loading the DAILY precipitation data at SanMartino
data(SanMartinoPPts)
x <- SanMartinoPPts
View(x)
## Winter (DJF) values of precipitation for each year of 'x'
dm2seasonal(x, FUN=sum, season="DJF")


## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- window(SanMartinoPPts, end=as.Date("1930-12-31"))

## Plotting the daily ts only, and then automatic 'x' axis
plot(x, xaxt = "n", xlab="Time")
drawTimeAxis(x) 


## Plotting the daily ts only, and then monthly ticks in the 'x' axis, 
## with annual labels.
plot(x, xaxt = "n", xlab="Time")
drawTimeAxis(x, tick.tstep="years") 

## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- SanMartinoPPts

## Average amount of wet days in each month (for this example, this means days 
## with precipitation larger than 0.1mm) 
dwdays(x, thr=0.1)

## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- SanMartinoPPts

## Not run: 
## Days with information per year
dwi(x)

## Days with information per month per year.
dwi(x, out.unit="mpy")

## End(Not run)

###########
## Not run: 
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Months with information per year in the 9 first stations of 'EbroPPtsMonthly'
a <- dwi(EbroPPtsMonthly[,1:10], out.unit="years", dates=1)
View(EbroPPtsMonthly)
View(a)
## Before plotting the results in 'a', and just for obtaining a more interesting
## plot, 70 random numbers (between 1 and 11) are introduced in 'a'
a[sample(length(a), size = 70)] <- rep(1:11, length=70)

## Plotting the amount of months with information per year in each station
matrixplot(a, var.type="Days", main="Number of months with info per year")

## End(Not run)

### Loading temperature data ##
data(SanMartinoPPts)
x <- SanMartinoPPts

## Extracting all the values belonging to February (FEB=2)
extract(x, trgt=2)

## Extracting all the values belonging to February (FEB=2) and April (APR=4)
extract(x, trgt=c(2,4))

## Extracting all the values belonging to the year 1970
extract(x, trgt=1970)

## Extracting all the values belonging to the years 1970 and 1972
extract(x, trgt=c(1970,1972))

## Extracting all the values belonging to the autumn
extract(x, trgt="SON")


## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)

## Daily Flow Duration Curve
fdc(OcaEnOnaQts)

###################
# Getting the streamflow values corresponding to 5 and 95% of time equalled or 
# exceeded (and also the first streamflow value in 'x' just for verification)
x  <- OcaEnOnaQts

# First streamflow value (x1=42.1 m3/s)
x1 <- x[1]

# Daily FDC for 'x'
y <- fdc(x)

# value of the FDC for x1 (y1=0.002739726)
y1 <- y[1]

# Performing cubic (or Hermite) spline interpolation of 'x' and 'y'
f <- splinefun(y,x)

# Getting the (known) streamflow value for 'y1'
f(y1) # 42.1 m3/s, equal to the known 'x1'

# Streamflow values corresponding to 5 and 95% of time equalled or exceeded
f(c(.05, .95))

###################
## Getting 
data(OcaEnOnaQts)

## Daily Flow Duration Curve
fdc(OcaEnOnaQts)


## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
q <- OcaEnOnaQts

# Creating a fictitious lower uncertainty band
lband <- q - min(q, na.rm=TRUE)

# Giving a fictitious upper uncertainty band
uband <- q + mean(q, na.rm=TRUE)

# Plotting the flow duration curve corresponding to 'q', with two uncertainty bounds
fdcu(q, lband, uband)

############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Loading the gis data
data(EbroPPgis)    

## Putting the measurements of the first row of 'EbroPPtsMonthly' into their 
## corresponding spatial location given by 'x.gis'
require(sp)
x.spt <- gists2spt(x.ts=EbroPPtsMonthly[1,], x.gis=EbroPPgis, X="EAST_ED50", 
                   Y="NORTH_ED50", na.rm=FALSE, sname="ID")

## Plotting the measured values (only the first row of 'EbroPPtsMonthly') at their 
## corresponding spatial location
spplot(x.spt, zcol="value")

## Sequence of hours between "1961-01-01 00:00" and "1961-01-10 00:00", giving the
## starting and ending date/time objects with hours and skipping the minutes (default)
hip("1961-01-01 00", "1961-12-31 00")

## Sequence of hours between "1961-01-01 00:00" and "1961-01-10 00:00", giving the
## starting and ending date/time objects only with hours and minutes(skipping the minutes)
hip("1961-01-01 00:00", "1961-12-31 00:00", date.fmt="%Y-%m-%d %H:%M")

## Number of hours between the 10:00 AM of "1961-Jan-02" and the 11:00 AM of "1961-Jan-01", 
## using "%d/%m/%Y" as date/time format.
hip("01/01/1961 10", "02/01/1961 11", date.fmt= "%d/%m/%Y %H", out.type = "nmbr")


## Loading the gis data
data(EbroPPgis)

## Loading the shapefile with the subcatchments
data(EbroCatchmentsCHE)

## Projection for the Subcatchments file
# European Datum 50, Zone 30N
require(sp)
p4s <- CRS("+proj=utm +zone=30 +ellps=intl +units=m +no_defs")

## Selecting the first day of 'EbroPPtsMonthly' for all the stations.
# The first column of 'EbroPPtsMonthly' has the dates
x.ts <- as.numeric(EbroPPtsMonthly[1, 2:ncol(EbroPPtsMonthly)])

## Setting the name of the gauging stations
names(x.ts) <- colnames(EbroPPtsMonthly[1,2:ncol(EbroPPtsMonthly)])

##################################################
## 1) IDW interpolation and plot
## Probably you will need to resize your window 
## Not run: 
x.idw <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
                    X="EAST_ED50", Y="NORTH_ED50", sname="ID", bname="CHE_BASIN_NAME",
                    type= "both",
                    subcatchments= EbroCatchmentsCHE,
                    cell.size= 3000, 
                    ColorRamp= "Precipitation",	
                    main= "IDW Precipitation on the Ebro")

## End(Not run)

## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Visualizing the correlation among the monthly precipitation values 
## of the first 3 gauging stations in 'EbroPPtsMonthly'. 
## The first column of 'EbroPPtsMonthly' has the dates.
hydropairs(EbroPPtsMonthly[,2:4])


#############
## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)

## 3 ts, 3 boxplots and 3 histograms
hydroplot(OcaEnOnaQts, FUN=mean, ylab= "Q", var.unit = "m3/s")

## only the original time series
hydroplot(OcaEnOnaQts, pfreq="o")

## only the year 1962 of the original time series
hydroplot(OcaEnOnaQts, pfreq="o", from="1962-01-01", to="1962-12-31")

## seasonal plots
## Not run: 
hydroplot(OcaEnOnaQts, pfreq="seasonal", FUN=mean, stype="default")

## custom season names (let's assume to be in the Southern Hemisphere)
hydroplot(OcaEnOnaQts, pfreq="seasonal", FUN=mean, 
          stype="default", season.names=c("Summer","Autumn", "Winter","Spring"))

## End(Not run)

#############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Plotting the monthly and annual values of precipitation at station "P9001", 
## stored in 'EbroPPtsMonthly'.
sname2plot(EbroPPtsMonthly, sname="P9001", var.type="Precipitation", dates=1, 
           pfreq="ma")

## Plotting seasonal precipitation at station "P9001"
par(mar=c(5.1, 4.1, 4.1, 2.1))

sname2plot(EbroPPtsMonthly, sname="P9001", FUN=sum, dates=1, pfreq="seasonal", 
           stype="default")

## Not run: 
# Loading the DEM
require(rgdal)
data(EbroDEM1000m)
dem <- EbroDEM1000m

# Plotting the DEM
require(sp)
spplot(dem, scales=list(draw=TRUE, y=list(rot=90)))

# Computing and plotting the hypsometric curve
hypsometric(dem)

# If the raster file has more than 1 band, and the elevation data are in a 
# band different from 1:
dem$ELEVATION <- EbroDEM1000m$band1 # dummy example
hypsometric(dem, band= 2)
hypsometric(dem, band= "ELEVATION") # same as before, but user-friendly

## End(Not run)
## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Computing xmin and the range of 'x'
xmin <- min(x, na.rm=TRUE)
r <- diff(range(x, na.rm=TRUE))

## Standarized variable
s <- stdx(x)

## Inverse of the standarized variable
si <- istdx(s, xmin, xrange=r)

## 'si' and 'x' should be the same
summary(x-si)


## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Daily to Monthly ts
m <- daily2monthly(x, FUN=mean, na.rm=FALSE)

# Plotting the monthly values
plot(m, xlab="Time")

## Plotting the annual moving average in station 'x'
lines(ma(m, win.len=12), col="blue")


## Loading the SanMartino precipitation data
data(SanMartinoPPts)

# Selecting only the values up to Dec/1960
x <- window(SanMartinoPPts, end=as.Date("1960-12-31"))

## Daily zoo to monthly zoo
m <- daily2monthly(x, FUN=sum, na.rm=TRUE)

# Creating a data.frame with monthly values per year in each column
M <- matrix(m, ncol=12, byrow=TRUE)
colnames(M) <- month.abb
rownames(M) <- unique(format(time(m), "%Y"))

# Plotting the monthly precipitation values from 1921 to 1960.
# Useful for identifying dry/wet months
matrixplot(M, ColorRamp="Precipitation", 
           main="Monthly precipitation at San Martino st., [mm/month]")


mip("1961-01-01", "1961-12-31")

#####################
## Ex1: Loading the DAILY precipitation data at SanMartino
data(SanMartinoPPts)
x <- SanMartinoPPts

## Daily to Annual
daily2annual(x, FUN=sum, na.rm=TRUE)


## Loading daily streamflows (3 years) at the station 
## Oca en Ona (Ebro River basin, Spain)
data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Mean monthly streamflows at station 'x'
monthlyfunction(x, FUN=mean, na.rm=TRUE)


## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Loading the gis data
data(EbroPPgis)

## Loading the shapefile with the subcatchments
data(EbroCatchmentsCHE)

## Projection for the Subcatchments file
require(sp)
p4s <- CRS("+proj=utm +zone=30 +ellps=intl +units=m +no_defs")

## Field name in 'x.gis' with the ID of the station
sname <- "ID"
## Field name in 'x.gis'with the name of the catchment to which each station belongs
bname <- "CHE_BASIN_NAME"
## Field name in 'x.gis' with the Easting spatial coordinate
X     <- "EAST_ED50" 
## Field name in 'x.gis' with the Northing spatial coordinate
Y     <- "NORTH_ED50" 
## Field name in 'x.gis' with the Elevation
elevation <- "ELEVATION" 



#######
## Selecting Jan/1961 (first row) of 'EbroPPtsMonthly' in all the stations
x.ts <- as.numeric(EbroPPtsMonthly[1, 2:ncol(EbroPPtsMonthly)])

## Setting the name of the stations
names(x.ts) <- colnames(EbroPPtsMonthly[ ,2:ncol(EbroPPtsMonthly)])


########
## IDW interpolation and plot (Jan/61)
x.idw <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
                    X=X, Y=Y, sname=sname, bname=bname, elevation=elevation, 
                    type= "cells", #'both'
                    subcatchments= EbroCatchmentsCHE, p4s= p4s, 
                    cell.size= 3000, nmax= 50,
                    ColorRamp= "Precipitation",
                    main= "IDW Mean Annual Precipitation on the Ebro, Jan/1961")

## Storing the interpolated values
x.idw@data["Jan1961"]   <- x.idw@data["var1.pred"]
x.idw@data["var1.pred"] <- NULL
x.idw@data["var1.var"]  <- NULL


## Selecting the Jul/1961 of 'EbroPPtsMonthly' for all the stations
x.ts <- as.numeric(EbroPPtsMonthly[7, 2:ncol(EbroPPtsMonthly)])

## Setting the name of the stations
names(x.ts) <- colnames(EbroPPtsMonthly[ , 2:ncol(EbroPPtsMonthly)])

## Not run: 
## IDW interpolation and plot (Jul/1961)
x.idw2 <- hydrokrige(x.ts= x.ts, x.gis=EbroPPgis, 
                     X=X, Y=Y, sname=sname, bname=bname, elevation=elevation,
                     type= "cells", #'both'
                     subcatchments= EbroCatchmentsCHE, p4s= p4s, 
                     cell.size= 3000, nmax= 50,
                     ColorRamp= "Precipitation",
                     main= "IDW Mean Annual Precipitation on the Ebro, Jul/1961")

# Adding the interpolated value for Jul/1961 to 'x.idw'
x.idw@data["Jul1961"] <- x.idw2@data["var1.pred"]


## Plotting in the same graph the 2 interpolated fields
mspplot(x=x.idw, 
        subcatchments=EbroCatchmentsCHE, 
        IDvar=NULL, p4s, 
        col.nintv=50, 
        main="IDW Monthly Precipitation on the Ebro River basin, [mm]",
        stations.plot=FALSE,
        arrow.plot=TRUE, arrow.offset=c(900000,4750000), arrow.scale=20000,
        scalebar.plot=TRUE, sb.offset=c(400000,4480000), sb.scale=100000)	

## End(Not run)




## Loading the SanMartino precipitation data
data(SanMartinoPPts)

# Selecting only the values up to Dec/1960
x <- window(SanMartinoPPts, end=as.Date("1960-12-31"))

## Daily zoo to monthly zoo
m <- daily2monthly(x, FUN=sum, na.rm=TRUE)

# Creating a data.frame with monthly values per year in each column
M <- matrix(m, ncol=12, byrow=TRUE)
colnames(M) <- month.abb
rownames(M) <- unique(format(time(m), "%Y"))

# Plotting the monthly precipitation values from 1921 to 1960.
# Useful for identifying dry/wet months
matrixplot(M, ColorRamp="Precipitation", 
           main="Monthly precipitation at San Martino st., [mm/month]")




## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Daily to Monthly ts
m <- daily2monthly(x, FUN=mean, na.rm=FALSE)
m
ma(m, win.len=12)
# Plotting the monthly values
plot(m, xlab="Time")

## Plotting the annual moving average in station 'x'
lines(ma(m, win.len=12), col="blue")
rep(1:4, 2)
help(rep)
obs <- c(1, NA, 3, 4, NA, 5)
sim <- rep(2, 6)

## Filling in the missing values in 'x' with the corresponding values in 'sim'
infillxy(x=obs, sim)


data(EbroPPtsMonthly)
smry(EbroPPtsMonthly[,2:8])


diy(1961, out.type = "nmbr")


## Loading the DAILY precipitation data at SanMartino
data(SanMartinoPPts)
x <- SanMartinoPPts

## Winter (DJF) values of precipitation for each year of 'x'
dm2seasonal(x, FUN=sum, season="DJF")


data(OcaEnOnaQts)
d <- OcaEnOnaQts
sfreq(d)


## Loading the SanMartino daily precipitation data (1921-1990)
data(SanMartinoPPts)
View(SanMartinoPPts)
x <- SanMartinoPPts

# Amount of years in 'x' (needed for computing the average)
nyears <- length( seq(from=time(x[1]), to=time(x[length(x)]), by="years") )

## Average annual precipitation for the 70 years period. 
# It is necessary to divide by the amount of years to obtain the average annual value, 
# otherwise it will give the total precipitation for all the 70 years.
annualfunction(x, FUN=sum, na.rm=TRUE) / nyears


#####################
### verification ####
# Daily to annual
a <- daily2annual(x, FUN=sum, na.rm=TRUE)

# Mean annual value
mean(a)

##############################
##############################
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)
x <- EbroPPtsMonthly

## Dates of 'x'
dates <- as.Date(x[,1])


## Computation of the average annual precipitation
## Not run: 

## Transforming 'x' into a zoo object
z <- zoo( x[, 2:ncol(x)], dates)

# Amount of years in 'x' (needed for computing the average)
nyears <- yip(from=start(z), to=end(z), out.type="nmbr" )

## Average annual precipitation, for the first 5 stations in 'x'
annualfunction(z[ ,1:5], FUN=sum)/nyears


## End(Not run)


## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- window(SanMartinoPPts, end=as.Date("1930-12-31"))

## Plotting the daily ts only, and then automatic 'x' axis
plot(x, xaxt = "n", xlab="Time")
drawTimeAxis(x) 



data(SanMartinoPPts)
x <- SanMartinoPPts

## Average amount of wet days in each month (for this example, this means days 
## with precipitation larger than 0.1mm) 
dwdays(x, thr=0.1)


data(OcaEnOnaQts)
x <- OcaEnOnaQts
xmin <- min(x, na.rm=TRUE)
r <- diff(range(x, na.rm=TRUE))
s <- stdx(x)
si <- istdx(s, xmin, xrange=r)
View(si)


data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Mean monthly streamflows at station 'x'
monthlyfunction(x, FUN=mean, na.rm=TRUE)


data(EbroPPtsMonthly)

# Getting the name of each gauging station.
names <- colnames(EbroPPtsMonthly)

# Removing the initial letter 'P' of the name of each gauging station.
rm1stchar(names)


data(SanMartinoPPts)
x <- SanMartinoPPts

# Amount of years
nyears <- yip(from=start(x), to=end(x), out.type="nmbr")

## Mean annual precipitation.
# It is necessary to divide by the amount of years to obtain the mean annual value, 
# otherwise it will give the total precipitation for all the 70 years
seasonalfunction(x, FUN=sum, na.rm=TRUE) / nyears


data(EbroPPtsMonthly)

## Plotting the monthly and annual values of precipitation at station "P9001", 
## stored in 'EbroPPtsMonthly'.
sname2plot(EbroPPtsMonthly, sname="P9001", var.type="Precipitation", dates=1, 
           pfreq="ma")


data(KarameaAtGorgeQts)
x <- KarameaAtGorgeQts
View(x)
# Sub-daily to monthly ts
subdaily2annual(x, FUN=mean, na.rm=TRUE)


data(KarameaAtGorgeQts)
x <- KarameaAtGorgeQts

# Plotting the hourly streamflow values
plot(x)

## sub-daily to Daily
d <- subdaily2daily(x, FUN=sum, na.rm=TRUE)

# Plotting the daily streamflow values
plot(d)


# Sub-daily to monthly ts
subdaily2monthly(x, FUN=mean, na.rm=TRUE)

data(KarameaAtGorgeQts)
x <- KarameaAtGorgeQts

## Mean winter (DJF) values of streamflow for each year of 'x'
dm2seasonal(x, FUN=mean, season="DJF")
subdaily2seasonal(x, FUN=mean, season="DJF") # same as above

t <- dip("1961-01-01", "1961-12-31")
time2season(t)

t <- mip("1961-01-01", "1961-12-31")
time2season(t)
time2season(t, out.fmt="seasons")

yip("1961-01-01", "1961-12-31")
