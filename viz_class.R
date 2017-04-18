# Viz course

require(stats) 

#
# Cooking up data
#

# We start simple. We first cook up some 1D data using randomly generated data.
# Poisson distribution (for counts)
d1<-rpois(10000, 5)
# Normal distribution (contunous variable)
d2<-rnorm(10000,mean = 0, sd = 1)

# Let's cook up some 2D data
x<-seq(0,50,length=100)
y<-.5*x + rnorm(100,mean=0,sd=1)
d3 <- data.frame(x=x,y=y)
y<-.5*x + rnorm(100,mean=0,sd=1)*x*0.5
d4 <- data.frame(x=x,y=y)

# And simmer some 3D data
x <- seq(-10, 10, length= 30)
y <- x
f <- function(x, y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
d5 <- data.frame(x=x,y=y,z=I(z))


#
# Simple 1D data exploration
#

# Let's try simple plotting
plot(d1)
plot(d2)
# This plots all the points as a function of the order in the sequence. 
# Does'nt really make any sense, but we can see that the numbers from the
# poisson distribution is integers, whereas the normal distribution is continous.

# We can instead plot the histigram of the data and see the distribution
hist(d1)
hist(d2)

# We can also increase the number of "intervals" where we or the histogram.
hist(d1,breaks=100)
hist(d2,breaks=100)

#
# Simple 2D data exploration
#

plot(d3)
# Try to fit a line to the data
f3<-line(d3)
lines(d3$x,fitted(f3))

plot(d4)
f4<-line(d4)
lines(d4$x,fitted(f4))

#
# Simple 3D plot example
#


#ok, lets look at the values
names(d5)
plot(d5$x)
plot(d5$y)
hist(d5$z)

# 3D plot
persp(d5$x, d5$y, d5$z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 120, shade = 0.75, ticktype = "detailed",
      xlab = "X", ylab = "Y", zlab = "Z")


