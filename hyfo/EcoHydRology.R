install.packages("EcoHydRology")
library(EcoHydRology)
data(OwascoInlet)
head(OwascoInlet)
hydrograph(OwascoInlet)

RainHeat(20,0.01)

#########	Look at a dataset for Owasco Lake in NY:
data(OwascoInlet)
summary(OwascoInlet)

##	Get an approximation for baseflow using a 3 pass filter:
bfs<-BaseflowSeparation(OwascoInlet$Streamflow_m3s, passes=3)

##	You can check out how this looks with the hydrograph function:
hydrograph(input=OwascoInlet,streamflow2=bfs[,1])
hydrograph(OwascoInlet)