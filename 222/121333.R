
library(shiny)
runExample("01_hello")
library(shiny)
runExample("02_text")
runExample("03_reactivity")
help(plotOutput)
paste(1:12)
paste(month.abb, "is the", nth, "month of the year.")

R
inst("leaflet")
library(devtools)
install_github('badbye/baidumap')

library(leaflet)
library(baidumap)
library(rjson)
q <- getBaiduMap('北京大学', width=600, height=600, zoom=18, scale = 2, messaging=FALSE)
ggmap(q) #绘制地图


library(baidumap)
library(rjson)

## 获取“北京大学”的坐标
m <- getCoordinate('北京大学')
fromJSON(m) 

options(baidumap.key = 'pzsxVTAgQsSAXfolToTgqpdUebRTgZib')
getCoordinate('北京大学')  #json格式
getCoordinate('北京大学')
help(leaflet)

getLocation(c(118.12845, 24.57232),formatted = T)


help(addTiles)
library(leaflet)
m <- leaflet()
m%>%addTiles()