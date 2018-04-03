install.packages("geotopbricks")
# An R Plug-in for the Distributed Hydrological Model GEOtop
##水文数据管理

library(zoo)
library(stringr)
library(geotopbricks)

help(OPS)

file <- system.file("rendena100/SnowDepthMapFile-2014-MA-mean-winter-2013-2014.asc",
                    package="geotopbricks")
snow <- raster(file)

min <- 0 # snow depth expressed in millimeters
max <- 2500 # snow depth expressed in millimeters

colors <- terrain.colors(1000)

color.bar.raster(x=snow,col=colors,digits=2)
color.bar.raster(x=snow,col=colors,min=min,max=max,digits=2)
library(stringr)
library(zoo)
library(geotopbricks)
f <- system.file("doc/examples/example.plot.GeotopRasterBrick.R",package="geotopbricks")
source(f)