################################################################################
# R script sysstat26_01_en.r for the practice "Statistical Analysis of Systems"
#####

## The '#' symbol is the comment character in R: Everything in a line
## following '#' is ignored during execution.

## Execute the following commands by always entering
## in a line and then pressing Control+Enter or the Run button.

## You can also select the section (one line, multiple lines) you want to run 
## and then press Control+Enter or click the Run button.

## Help in R
help(sum)       # Help for predefined function 'sum'
?sum            # the same as 'help(sum)'

## R as calculator
1+1       # Adding
2*3       # Multiplying
3/2       # Dividing
3^2       # Exponentiation
(1+2)*3   # Set parentheses
1.3*2     # The dot acts as a decimal point.
pi        # The constant 3.141592...
pi/4      # Calculating with the constant
1/0       # Inf = Infinity
0/0       # NaN = Not a Number: Placeholder or error message
pi[2]     # NA = Not Available: Placeholder or error message

## Variables
a <- 2*3        # create a variable a and assign a value at the same time
a               # display the value of the variable a
a^2             # calculate with the variable ...
b <- a^2        # ... and assign the result to another variable
Baum <- "Eiche" # The value of a variable can also be a character string ... 
Baum                 
w.wert <- TRUE  # ... or a truth value (or even more complex).
w.wert

## Functions
log(2.7182818) # the natural logarithm
log(16,2)      # the logarithm of 16 to the base 2
objects()      # Display all existing variables and objects.

BspFunktion <- function(a,b) { # two arguments 'a' and 'b'
  w <- 5*a+b                   # what this function always does with its arguments
  return(w)                    # return value
}
BspFunktion(1,0)
BspFunktion(2,2)

BspFunktion <- function(a=0,b=0) {  
  w <- 5*a+b
  return(w)                    
}
BspFunktion()
BspFunktion(1)                 # first argument is set to 1

## Loops
for(i in 1:10) print(i^2)
for( name in c("I", "want", "to", "go", "home!") ) {
  cat(name,"\n")
}
while(rnorm(1) < 1) print("hallo")

## Conditions
if(rnorm(1) > 0) {
  print("rnorm generated a positive value.")
} else {
  print("rnorm generated a negative value.")
} 

## Vectors
x <- c(1, 2, 3, 4, 5) # 'c' comes from concatenate.
x
y <- exp(x)-2         # 'exp' (= "e to the power of") is applied to each entry of x.
y
y[2]                  # second element of y
y[2] <- 1             # assign a value to the second element of y

rep(1,5)           # repetition
1:5                # the same as c(1, 2, 3, 4, 5)
seq(1,20,by=4)     # sequence with spacing by=4
seq(1,20,length=5) # sequence with length=5 elements at equal intervals

x <- 1:30/10
length(x)         # number of elements of x
x[1:10]           # the first ten elements of x
x[c(1,10,15)]     # the elements at position 1, 10 ,15
x[c(10,1,15)]     # the same elements in a different order
x[ x > 2.5 ]      # all elements of x that are > 2.5
x > 2.5           # vector of truth values
x[-(1:10)];       # all elements except elements 1 to 10

## Matrices
x <- c(1,2,3,4)
matrix(x,nrow=2,ncol=2) # elements arranged in columns
matrix(x,2,2,byrow = T) # elements arranged in rows
A <- matrix(1:15,3)
B <- matrix(1:3,3,5)
B

A + B         # element-wise sum
A * B         # element-wise multiplication
A %*% t(B)    # matrix product, t(B) is the transposed matrix of B

dim(B)  # dimension (number of rows or columns)
NROW(B) # number of rows
NCOL(B) # number of columns
A[,1]   # first column
A[1,]   # first row
A[3,1]  # first element of the third row

cbind(c(1,2), c(3,4))   # combine by column
rbind(c(1,2), c(3,4))   # combine by row

## Lists
course.info <- list(students = c("Sandra", "Karl", "Thomas", "Nadine"),
                    nr.of.exercises = 15, 
                    rooms = c("Seminar room","PC-Pool"))
course.info$rooms        
course.info[[3]]
course.info$students[2]

## Random numbers
rnorm(10)       # Generates 10 random numbers for the N(0,1) distribution (standard normal distribution)
qnorm(0.975)    # 97.5 % quantile of the standard normal distribution
pnorm(0)        # (cumulative) distribution function 
dnorm(0)        # probability density function
# 'rnorm' is composed of 'r' and 'norm'.
# 'r' stands for random number generation, 'norm' is the name of the distribution.
# Accordingly, 'q' stands for quantile, 'p' for distribution function and 'd' for density function.
# This principle also applies to other distributions, e.g:
# 'unif' stands for uniform distribution -> 'runif' generates random numbers for uniform distribution
# 'exp' stands for exponential distribution -> 'rexp' generates random numbers for exponential distribution

## Statistics
x <- rnorm(20)                        
y <- rnorm(20,mean=2,sd=2)            # 20 random numbers for the N(2,4) distribution
mean(x)                               # empirical mean
mean(y)
sd(x)                                 # empirical standard deviation
sd(y)
var(x)                                # empirical variance
var(y)
z <- 2*(0.5*x + sqrt(0.75)*rnorm(20))
cov(x,z)                              # empirical covarianz of x and z
cor(x,z)                              # empirical correlation coefficient

## Basic plots
hist(rnorm(100))       # histogram
plot(x,z)              # scatterplot
xx <- seq(-3,3,by=0.1)
plot(xx,dnorm(xx),type="l",main="Density fct. of N(0,1) distr.",xlab="x",ylab="f(x)")

## Files
getwd()                              # current working directory of R
setwd("C:/myPath")                   # sets the working directory to the folder "C:/myPath"
# where 'myPath' is a subdirectory of the hard disk "C" selected by you  

A <- matrix(rnorm(20),4,5)
write.table(A,file="AMatrix.txt",row.names=FALSE,col.names=FALSE) # Saving
AA <- read.table("AMatrix.txt")      # Reading
class(AA)                            # Type 'data.frame'
AA <- as.matrix(AA)                  # Converting to the type 'matrix'
class(AA)

save(course.info,file="ci.RData")    # Saving in .RData format
remove(course.info)                  # Deleting the course.info object
course.info                          # Displaying
load(file="ci.RData")                # Reading
course.info                          # Displaying


########################################
# Task 1
###

# In this task, we consider a normally distributed random variable 
# with expected value mu and variance sigma^2 as the population.
mu <- 5
sigma <- 2

n <- 100                             # sample size

X <- rnorm(n=n,mean=mu,sd=sigma)     # Generation of n=100 random numbers for normal distribution N(mu,sigma^2) 
# with expected value mu and variance sigma^2

mean(X)                              # empirical mean (generally not equal to mu)
var(X)                               # empirical variance (generally not equal to sigma^2)

# In the following, a function 'getEmp' is defined which first generates n random numbers for the N(mu,sigma^2) 
# distribution (i.e. a sample of size n) and then returns a vector consisting of their empirical mean and their 
# empirical variance.
# 'n', 'mu', 'sigma' and 'i' are the input parameters of this function, 
# where 'i' is a kind of sample number that simplifies the following.
getEmp <- function(n,mu,sigma,i=0) { 
  X <- rnorm(n=n,mean=mu,sd=sigma)   
  return(c(mean(X),var(X)))          
} 

# We use the 'getEmp' function with the parameters selected above. (Since a default value has already been 
# specified for 'i' in the function definition, we do not necessarily have to assign a value to 'i').
# In the function call 'getEmp(n=n,...)', the first 'n' stands for the input parameter 'n' of 'getEmp', 
# while the second 'n' is the variable of the same name that we defined above with 'n=100'.
getEmp(n=n,mu=mu,sigma=sigma)                   # empirical mean and empirical variance for one sample
getEmp(n=n,mu=mu,sigma=sigma)                   # the same for another sample

# In the following, we want to use 'getEmp' several times and save typing. You could use a for loop to do this, 
# for example. However, the 'apply' commands are more practical and also faster in R. 
# 'sapply' applies the function specified in the second argument ('FUN') to a vector of desired values for one 
# argument (here sample number 'i'); all other input parameters of this function are specified below.
sapply(1:10,FUN=getEmp,n=n,mu=mu,sigma=sigma) # call of getEmp for i=1:10, return contains the empirical means 
# in the first line, the empirical variances in the second line

# After these preparations, 100 samples are generated for each of the following sample sizes 
# n=10, n=100, n=1000 and mean values and variances are estimated:
mv10 <- sapply(1:100,getEmp,n=10,mu=mu,sigma=sigma)
mv100 <- sapply(1:100,getEmp,n=100,mu=mu,sigma=sigma)
mv1000 <- sapply(1:100,getEmp,n=1000,mu=mu,sigma=sigma)

# Presentation of the results for the mean values
# Boxplots
boxplot(mv10[1,],mv100[1,],mv1000[1,],xlab="Sample size",ylab="Empirical mean",names=c("n=10","n=100","n=1000"))
abline(h=mu,col=2)
# mean squared deviation from the theoretical expected value (mean squared error, MSE)
c(mean((mv10[1,]-mu)^2),mean((mv100[1,]-mu)^2),mean((mv1000[1,]-mu)^2)) 
# -> By approximately what factor does the MSE improve with increasing n?

# Presentation of the results for the variances
# Boxplots
boxplot(mv10[2,],mv100[2,],mv1000[2,],xlab="Sample size",ylab="Empirical variances",names=c("n=10","n=100","n=1000"))
abline(h=sigma^2,col=2)
# mean squared deviation from the theoretical variance (mean squared error, MSE)
c(mean((mv10[2,]-sigma^2)^2),mean((mv100[2,]-sigma^2)^2),mean((mv1000[2,]-sigma^2)^2)) 
# -> By approximately what factor does the MSE improve with increasing n?


########################################
# Task 2
###

# In this task we look at a time series of monthly CO2 values:
co2                                  # the data (monthly CO2 values)
?co2                                 # metadata for the data set

# The 'plot' command can be used to generate a display as a linked time series:
plot(co2)                            
# -> What two obvious observations can be made here?

# In the following, we save the data set in the form of a vector in the variable 'Z':
Z <- c(co2)                     

# For a vector 'V' of consecutive values, the following function determines 
# the empirical correlation of the values with time interval 'm' (months):
getCorr <- function(V,m) {           
  n <- length(V)                     
  return(cor(V[1:(n-m)],V[(1+m):n]))
}

# we apply 'getCorr' to the co2 dataset:
getCorr(Z,1)                         # Correlation of CO2 values at one-month intervals
getCorr(Z,2)                         # Correlation of CO2 values at two-month intervals
n <- length(Z)
plot(Z[1:(n-1)],Z[2:n],xlab="Values",ylab="Values one month later")    # scatter plot, one month apart
plot(Z[1:(n-2)],Z[3:n],xlab="Werte",ylab="Values two months later")    # scatter plot, two months apart
# The high correlation in each case (values very close to 1) is not surprising here, 
# as there is obviously a strong deterministic dependency of the values in the sense 
# of an annual increase (trend) as well as a seasonal fluctuation within a year. 
# It is therefore common practice in time series analysis to first estimate the trend 
# and the seasonal component and then subtract them from the time series.

# We therefore first estimate the trend and the seasonal component:
fit <- stl(co2, s.window="period")

# The following plot shows the data, the seasonal component, the trend and the 
# residual values = data - trend - seasonal component:
plot(fit)

# The question now is whether there is still a dependency/correlation of values from neighboring months 
# after deducting the trend and seasonal component. In the following, we therefore only consider 
# the time series of these residual components:
Zrest <- c(fit$time.series[,"remainder"])
n <- length(Zrest)

# First, we look at directly neighboring months:
plot(Zrest[1:(n-1)],Zrest[2:n],xlab="Residuals",ylab="Residuals one month later")    # scatter plot, one month apart 
getCorr(Zrest,1)                           # correlation of residual values at one-month intervals

# Since the correlation is no longer as close to 1 as before, 
# we perform a statistical test for correlation 0:
t1 <- cor.test(Zrest[1:(n-1)],Zrest[2:n])  # test for uncorrelatedness
t1                                         # output of the test
t1$p.value                                 # p-value
# Since the p-value is obviously significantly smaller than usual alpha values such as 0.05 or 0.01, 
# the estimated correlation value is therefore significantly different from 0.
# This means that the residual values at monthly intervals are actually correlated with each other 
# (and therefore not independent).

# We now look at residual values at two-month intervals:
plot(Zrest[1:(n-2)],Zrest[3:n],xlab="Residuals",ylab="Residuals two months later")    # scatter plot, two months apart 
getCorr(Zrest,2)                           # correlation of residual values at two-month intervals
t2 <- cor.test(Zrest[1:(n-2)],Zrest[3:n])  # test for uncorrelatedness
t2                                         # output of the test
t2$p.value                                 # p-value
# For this time interval, the p-value is now greater than 0.05, which is why it can be assumed 
# that the residual values at two-month intervals are not correlated with each other.

# Conclusion: Even after adjusting for the trend and seasonal components, there is obviously 
# a significant correlation between the CO2 values at intervals of one month, which should 
# be taken into account when modeling the time series.
