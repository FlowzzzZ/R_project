install.packages("getMet")
# Get Meteorological Data for Hydrological Modeling
library(topmodel)
library(parallel)
library(DEoptim)
library(EcoHydRology)
library(jsonlite)
library(getMet)

help(wq)

##EcoHydRology, jsonlite


##EcoHydRology
###复杂的生态水文交互模型


###jsonlite
###R对象与JSON相互转化

startDate = '2000-12-28'
endDate = '2000-12-29'
genSWATdates(startDate=startDate, endDate=endDate)