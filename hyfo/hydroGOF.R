install.packages("hydroGOF")
library(hydroGOF)
# Looking at the difference between r2 and br2 for a case with systematic 
# over-prediction of observed values
obs <- 1:10
sim1 <- 2*obs + 5
sim2 <- 2*obs + 25

# The coefficient of determination is equal to 1 even if there is no one single 
# simulated value equal to its corresponding observed counterpart
r2 <- (cor(sim1, obs, method="pearson"))^2 # r2=1

# 'br2' effectively penalises the systematic over-estimation
br2(sim1, obs) # br2 = 0.3684211
br2(sim2, obs) # br2 = 0.1794872

ggof(sim1, obs)
ggof(sim2, obs)

obs <- 1:10
sim <- 2:11

## Not run: 
ggof(sim, obs)

## End(Not run)

sim <- 1:10
obs <- 1:10
gof(sim, obs)


# Example1: basic ideal case
obs <- 1:10
sim <- 1:10
KGE(sim, obs)

obs <- 1:10
sim <- 2:11
KGE(sim, obs)


sim <- 2:11
obs <- 1:10
## Not run: 
plot2(sim, obs)

# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Selecting only the daily values belonging to the year 1961
obs <- window(obs, end=as.Date("1961-12-31"))

# Generating the lower and upper uncertainty bounds
lband <- obs - 5
uband <- obs + 5

## Not run: 
plotbands(obs, lband, uband)

# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Selecting only the daily values belonging to the year 1961
obs <- window(obs, end=as.Date("1961-12-31"))

# Generating the lower and upper uncertainty bounds
lband <- obs - 5
uband <- obs + 5

## Not run: 
plot(obs, type="n")
plotbandsonly(lband, uband)
points(obs, col="blue", cex=0.6, type="o")

## End(Not run)

obs <- 1:10
sim <- 1:10
mae(sim, obs)

obs <- 1:10
sim <- 2:11
mae(sim, obs)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the mean absolute error for the "best" case
mae(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new mean absolute error
mae(sim=sim, obs=obs)



sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new mean error
me(sim=sim, obs=obs)


data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the mean squared error for the "best" case
mse(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new mean squared error
mse(sim=sim, obs=obs)


# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the normalized root mean squared error for the "best" (unattainable) case
nrmse(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new normalized root mean squared error
nrmse(sim=sim, obs=obs)


# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970

data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the root mean squared error for the "best" (unattainable) case
rmse(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new root mean squared error
rmse(sim=sim, obs=obs)


data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the linear correlation for the "best" case
rPearson(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new correlation value
rPearson(sim=sim, obs=obs)


obs <- 1:10
sim <- 1:10
pbias(sim, obs)

obs <- 1:10
sim <- 2:11
pbias(sim, obs)


## Not run: 
sim <- 1:10
obs <- 1:10
pbiasfdc(sim, obs)

sim <- 2:11
obs <- 1:10
pbiasfdc(sim, obs)


obs <- 1:10
sim <- 1:10
cp(sim, obs)

obs       <- 1:10
sim[2:10] <- obs[1:9]
cp(sim, obs)

obs <- 1:10
sim <- 1:10
d(sim, obs)

obs <- 1:10
sim <- 2:11
d(sim, obs)

obs <- 1:10
sim <- 1:10
KGE(sim, obs)

obs <- 1:10
sim <- 2:11
KGE(sim, obs)


obs <- 1:10
sim <- 1:10
md(sim, obs)

obs <- 1:10
sim <- 2:11
md(sim, obs)


sim <- 1:10
obs <- 1:10
mNSE(sim, obs)

sim <- 2:11
obs <- 1:10
mNSE(sim, obs)

obs <- 1:10
sim <- 1:10
NSE(sim, obs)

obs <- 1:10
sim <- 2:11
NSE(sim, obs)



x <- 1:10
lband <- x - 0.1
uband <- x + 0.1
pfactor(x, lband, uband)

lband <- x - rnorm(10)
uband <- x + rnorm(10)
pfactor(x, lband, uband)



obs <- 1:10
sim <- 1:10
rd(sim, obs)

obs <- 1:10
sim <- 2:11
rd(sim, obs)



x <- 1:10
lband <- x - 0.1
uband <- x + 0.1
rfactor(x, lband, uband)

lband <- x - rnorm(10)
uband <- x + rnorm(10)
rfactor(x, lband, uband)


sim <- 1:10
obs <- 1:10
rNSE(sim, obs)

sim <- 2:11
obs <- 1:10
rNSE(sim, obs)


sim <- 1:10
obs <- 1:10
rSD(sim, obs)

sim <- 2:11
obs <- 1:10
rSD(sim, obs)


sim <- 1:10
obs <- 1:10
rsr(sim, obs)

sim <- 2:11
obs <- 1:10
rsr(sim, obs)


obs <- 1:10
sim <- 1:10
ssq(sim, obs)

obs <- 1:10
sim <- 2:11
ssq(sim, obs)


sim <- 1:5
obs <- c(1, NA, 3, NA, 5)
valindex(sim, obs)


obs <- 1:10
sim <- 1:10
VE(sim, obs)

obs <- 1:10
sim <- 2:11
VE(sim, obs)
