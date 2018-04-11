install.packages("RObsDat")
install.packages("RSQLite")
install.packages("RMySQL")
# Data Management for Hydrology and Beyond Using the Observations Data Model
##水文数据管理
library(zoo)
library(RObsDat)
library(RSQLite)
library(DBI)
library(RMySQL)
help( options)
getDefaultDB()
addCV("VariableName", "test", "Test entry to check the possibility to add a term to a vocabulary.")
getMetadata("VariableName", Term="test")


#connect to MySQL database
require("RObsDat")
require("RMySQL")
m <- dbDriver("MySQL")
con <- dbConnect(m, dbname = "ssm_crud",
                 host="localhost",
                 user = "root", password = "1234")
sqhandler <-  new("odm1_1Ver", con=con)
options(odm.handler=sqhandler)
dbDisconnect(con)

addSite(Code="test", Name="Virtual test site", x=-5, y=46,
        LatLongDatum="WGS84", Elevation=1500, State="Germany")


library(xts)
library(spacetime)

example.data <- xts(1:40, seq(as.POSIXct("2014-01-01", tz="UTC"), 
                              as.POSIXct("2014-02-09", tz="UTC"), length.out=40))
example.data[40] <- 30
example.data[35] <- 22

addDataValues(example.data[1:20], Site="Virtual test site", Variable="test_dist",  
              Source="Madeup", QualityControlLevel="test_ok")


#connect to standard database
getDefaultDB()
#add data
addOffsetType(Units="cm", Description="Above Ground Level")
getMetadata(table="OffsetType", Description="Ground Level")


