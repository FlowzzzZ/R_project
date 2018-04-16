install.packages("weatherr")
# : Tools for Handling and Scrapping Instant Weather Forecast Feeds
library(ggplot2)
library(ggmap)
library(lubridate)
library(RJSONIO)

library(XML)
library(baidumap)
options(baidumap.key = 'pzsxVTAgQsSAXfolToTgqpdUebRTgZib')
library(weatherr)

##ggele无法访问服务器
ggele(lat=22.39643,lon=114.1095)

p <- getBaiduMap(c(116.39565, 39.92999))
ggmap(p)
ggele(lat=22.39643,lon=114.1095)
## Not run: 
# Get exact time location forecast of Hong Kong
locationforecast(lat=22.39643,lon=114.1095)
View(locationforecast(lat=22.39643,lon=114.1095))
# Get time interval location forecast of Malta
locationforecast(lat=35.9375,lon=14.37542,exact=FALSE)
# Get exact time location forecast of Cape Town, South Africa with timezone 'Africa/Johannesburg'
locationforecast(location='Cape Town, South Africa', tz='Africa/Johannesburg')

## End(Not run)

