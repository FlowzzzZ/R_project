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









