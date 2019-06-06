## Problem set 3
## Problem 1

## a)
xgrid <- seq(from = -6, to = 6, by =0.2)

## X ~ N(0, 1)
## Y ~ N(1, 2)

## b, c and d)
## Computes the density function of the standard normal
## distribution for each value in xgrid

densityX <- dnorm(xgrid, mean = 0, sd = 1)

## Computes the value of the density function of
## a normal distribution with mean 1 and standard
## deviation sqrt(2) (i.e. variance equal to 2)

densityY <- dnorm(xgrid, mean = 1, sd = sqrt(2))

## Create an empty plot
plot(
  xgrid,
  densityX,
  type = "n"
)


## Draw lines in the plot with
## x-coordinates equal to xgrid and y-coordinates
## equal to densityX
lines(
  xgrid, 
  densityX
)

## Draw lines for the density of Y
lines(
  xgrid, 
  densityY,
  col = "red"
)

## e)

## P(X < -1)
pnorm(-1)

## P(Y > 2)
1 - pnorm(2, mean = 1, sd = sqrt(2))

## P(-1 < X < 1)
pnorm(1) - pnorm(-1)

## f)
## P(X < ???) = 0.05
qnorm(0.05)

## P(Y < ???) = 0.05
qnorm(0.05, mean = 1, sd = sqrt(2))

## g)
## P(X < ???) = 0.975
qnorm(0.975)

## P(Y < ???) = 0.975
qnorm(0.975, mean = 1, sd = sqrt(2))

## h)
## NOTE: the results below will be different
## after every run of the rnorm function here
## (we are selecting _random_ smaples)

x <- rnorm(n = 10, 0, 1)
y <- rnorm(n = 10, 1, sqrt(2))

## i)
mean(x)

## j)
tStat <- (mean(x) - 0) / sqrt(var(x) / 10)
tStat

## Critical values (95% significance level <=> 5% error probability)
qt(0.025, df = 10 - 1)
qt(0.975, df = 10 - 1)

## Compare the value of the test-statistic
## with the critical values
## You reject the null hypothesis at the 95% significance
## level if the test-statistic is greater than the upper
## critical value or if it is less than the lower critical
## value

## Alternatively, you can use the t.test function
## to perform the test
t.test(x)

## k)
mean(y)

## l)
t.test(y)
