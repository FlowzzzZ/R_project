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
