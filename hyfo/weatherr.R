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

