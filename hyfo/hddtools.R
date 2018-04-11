
install.packages(c('rnrfa', 'Hmisc', 'gdata'))
##水文数据管理
# Hydrological Data Discovery Tools
library(rgdal)
library(hddtools)
help(install.packages)

stationID <- catalogueData60UK()$stationID[1]
Morwick <- tsData60UK(stationID = stationID)
View(Morwick)
Morwick <- tsData60UK(stationID = stationID, plotOption = TRUE)
Adaitu <- tsGRDC(stationID = "1577602")
Adaitu <- tsGRDC(stationID = catalogueGRDC()$grdc_no[1000],
                 plotOption = TRUE)

stationID <- catalogueMOPEX()$stationID[1]
BroadRiver <- tsMOPEX(stationID = stationID)
BroadRiver <- tsMOPEX(stationID = stationID, plotOption = TRUE)

Data60UK_catalogue_all <- catalogueData60UK()
View(Data60UK_catalogue_all)

## Not run: 
# Retrieve the whole catalogue
Data60UK_catalogue_all <- catalogueData60UK()

# Filter the catalogue based on a bounding box
areaBox <- raster::extent(-4, -2, +52, +53)
Data60UK_catalogue_bbox <- catalogueData60UK(areaBox)

# Filter the catalogue based on an ID
Data60UK_catalogue_ID <- catalogueData60UK(columnName = "stationID",
                                           columnValue = "62001")

## End(Not run)

GRDC_catalogue_all <- catalogueGRDC()
MOPEX_catalogue_all <- catalogueMOPEX()
SEPA_catalogue_all <- catalogueSEPA()


View(SEPA_catalogue_all)
