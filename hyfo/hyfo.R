############水文处理相关R包#####################
install.packages("hyfo")
##水文与气候预测
library(hyfo)

data(tgridData)

# 需要使用 loadNcdf方法读取netcdf 文件作为list
#getPreciBar
b1 <- getPreciBar(tgridData, method = 4)
b2 <- getPreciBar(tgridData, method = 'meanMonthly',info = TRUE)



# getPreciBar_comb
b1 <- getPreciBar(tgridData, method = 2, output = 'ggplot', name = 'b1')
b2 <- getPreciBar(tgridData, method = 3, output = 'ggplot', name = 'b2')
getPreciBar_comb(b1, b2)


# getSpatialMap
data(tgridData)
getSpatialMap(tgridData, method = 'meanAnnual')
getSpatialMap(tgridData, method = 'winter')


getSpatialMap(tgridData, method = 'winter', catchment = testCat)

file <- system.file("extdata", "point.txt", package = "hyfo")
point <- read.table(file, header = TRUE, sep = ',' )
getSpatialMap(tgridData, method = 'winter', catchment = testCat, point = point)


# getSpatialMap_mat 差异绘图
a1 <- getSpatialMap(tgridData, method = 'mean', output = 'ggplot',name = 'a1')
a2 <- getSpatialMap(tgridData, method = 'max', output = 'ggplot',name = 'a2')
a3 <- getSpatialMap(tgridData, method = 'winter', output = 'ggplot', name = 'a3')
a4 <- getSpatialMap(tgridData, method = 'summer', output = 'ggplot', name = 'a4')
a5 <- a2 - a1
getSpatialMap_mat(a5)

# getSpatialMap_comb
getSpatialMap_comb(a3, a4)

# plotTS
View(testdl[1])
testdl[1]
plotTS(testdl[1])
plotTS(testdl[[1]], x = 'xxx', y = 'yyy', title = 'aaa')


# plotTS_comb
a1 <- plotTS(testdl[[1]], output = 'ggplot', name = 1)
a2 <- plotTS(testdl[[2]], output = 'ggplot', name = 2)

plotTS_comb(a1, a2)
plotTS_comb(list = list(a1, a2), y = 'y axis', nrow = 2)


#getAnnual
#datalist is provided by the package as a test.
data(testdl)
a <- getAnnual(testdl)
#set minRecords to control the calculation of annual rainfall.
b <- getAnnual(testdl, output = 'mean', minRecords = 350)
c <- getAnnual(testdl, output = 'mean', minRecords = 365)

a1 <- extractPeriod(testdl, comm = TRUE)
a2 <- list2Dataframe(a1)
getAnnual(a2)

a3 <- fillGap(a2)
getAnnual(a3)





#getLMom
dis <- seq(1, 100)
dis
getLMom(dis)

# getMoment
getMoment(dis)

# getMeanPreci
getMeanPreci(tgridData)


# Generate timeseries datalist. Each data frame consists of a Date and a value.

AAA <- data.frame(
  # date column
  Date = seq(as.Date('1990-10-28'),as.Date('1997-4-1'),1),
  # value column
  AAA = sample(1:100,length(seq(as.Date('1990-10-28'),as.Date('1997-4-1'),1)), repl = TRUE))

BBB <- data.frame(
  Date = seq(as.Date('1993-3-28'),as.Date('1999-1-1'),1), 
  BBB = sample(1:100,length(seq(as.Date('1993-3-28'),as.Date('1999-1-1'),1)), repl = TRUE))

CCC <- data.frame(
  Date = seq(as.Date('1988-2-2'),as.Date('1996-1-1'),1), 
  CCC = sample(1:100,length(seq(as.Date('1988-2-2'),as.Date('1996-1-1'),1)), repl = TRUE)) 

list <- list(AAA, BBB, CCC)# dput() and dget() can be used to save and load list file.

list_com <- extractPeriod(list, commonPeriod = TRUE)

# list_com is the extracted datalist.
str(list_com)
datalist_com1 <- extractPeriod(list_com, startDate = '1994-1-1', endDate = '1995-10-1')


#datalist is provided by the package as a test.
data(testdl)
a <- getAnnual(testdl)
#set minRecords to control the calculation of annual rainfall.
b <- getAnnual(testdl, output = 'mean', minRecords = 350)
c <- getAnnual(testdl, output = 'mean', minRecords = 365)


filePath <- system.file("extdata", "tnc.nc", package = "hyfo")
varname <- getNcdfVar(filePath)    
nc <- loadNcdf(filePath, varname)

data(tgridData)
# Since the example data, has some NA values, the process will include some warning #message, 
# which can be ignored in this case.



# Then we will use nc data as forecasting data, and use itself as hindcast data,
# use tgridData as observation.

biasFactor <- getBiasFactor(nc, tgridData)

data(testdl)

a <- testdl[[1]]

# Choose example from "1994-2-4" to "1996-1-4"


b1<- getHisEnsem(a, example = c('1995-2-4', '1996-1-4'), plot = 'cum', output = 'ggplot',
                 name = 1)

b2 <- getHisEnsem(a, example = c('1995-4-4', '1996-3-4'), plot = 'cum', output = 'ggplot',
                  name = 2)

getEnsem_comb(b1, b2)
getEnsem_comb(list = list(b1, b2), nrow = 2)

data(testdl)
a <- extractPeriod(testdl, commonPeriod = TRUE)
a1 <- list2Dataframe(a)
a2 <- fillGap(a1)
a3 <- fillGap(a1, corPeriod = 'monthly')


b <- read.table(text = '        Date  AAA  BBB  CCC  DDD  EEE
49 1999-12-15 24.8 21.4 25.6 35.0 17.4
50 1999-12-16   NA  0.6  1.5  6.3  2.5
51 1999-12-17   NA 16.3 20.3  NA 19.2
52 1999-12-18   13  1.6 NA  6.3  0.0
53 1999-12-19   10 36.4 12.5 26.8 24.9
54 1999-12-20   NA  0.0  0.0  0.2  0.0
55 1999-12-21  0.2  0.0  0.0  0.0  0.0
56 1999-12-22  0.0  0.0  0.0  0.0  0.0')
b
b1 <- fillGap(b)

b1

getAnnual_dataframe(tgridData)


filePath <- system.file("extdata", "tnc.nc", package = "hyfo")
# Then if you don't know the variable name, you can use \code{getNcdfVar} to get variable name
varname <- getNcdfVar(filePath)
nc <- loadNcdf(filePath, varname)
a <- getFrcEnsem(nc)
a

data <- list(c(1,1,1),c(2,2,2))
bind <- 'rbind'
checkBind(data,bind)


#use internal data as an example.
folder <- file.path(path.package("hyfo"), 'extdata')
# file may vary with different environment, it if doesn't work, use local way to get
# folder path.

a <- collectData(folder, fileType = 'csv', range = c(10, 20, 1,2))

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/

#use internal data as an example.
file <- system.file("extdata", "1999.csv", package = "hyfo")
folder <- strsplit(file, '1999')[[1]][1]
a <- collectData_csv_anarbe(folder)

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/



#use internal data as an example.

## Not run: 
file <- system.file("extdata", "1999.csv", package = "hyfo")
folder <- strsplit(file, '1999')[[1]][1]
a <- collectData_txt_anarbe(folder)

## End(Not run)

#connect to standard database
#this also retrieves the controlled vocabularies from the CUAHSI server
getDefaultDB()

#retrieve meta data
View(getMetadata(table="VariableName"))

# Daily to monthly
data(testdl)
TS <- testdl[[2]] # Get daily data
str(TS)
TS_new <- resample(TS, method = 'day2mon')

# Monthly to daily
TS <- data.frame(Date = seq(as.Date('1999-9-15'), length = 30, by = '1 month'), 
                 runif(30, 3, 10))
TS_new <- resample(TS, method = 'mon2day')

#' # First load ncdf file.
filePath <- system.file("extdata", "tnc.nc", package = "hyfo")
varname <- getNcdfVar(filePath)    
nc <- loadNcdf(filePath, varname)

nc_new <- resample(nc, 'day2mon')


#open internal file
file <- system.file("extdata", "testCat.shp", package = "hyfo")
catchment <- shp2cat(file)


filePath <- system.file("extdata", "tnc.nc", package = "hyfo")


# Then if you don't know the variable name, you can use \code{getNcdfVar} to get variable name
varname <- getNcdfVar(filePath)

nc <- loadNcdf(filePath, varname)

# Then write to your work directory

nc1 <- downscaleNcdf(nc, year = 2006, lon = c(-2, -0.5), lat = c(43.2, 43.7))
nc2 <- downscaleNcdf(nc, year = 2005, month = 3:8, lon = c(-2, -0.5), lat = c(43.2, 43.7))
View(nc1)