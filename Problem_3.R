## Read the data
invoices <- read.delim('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/invoices.txt')
str(invoices)


## a)
plot(invoices$Invoices, invoices$Time)

## b)

fit <- lm(Time ~ Invoices, data = invoices)

## c)
summary(fit)

## The estimated regression equation is
## Time_hat = 0.6417099 + 0.0112916 Invoices
## Thus we estimate an average daily startup-time (fixed costs)
## of 0.6417099 hours and expected cost for 
## proceessing one additional invoice at 0.0112916 hours

## d)
## Under the assumptions of the regression model (normally distributed
## error term with zero mean and constant variance):
## 
## (beta0_hat - beta0) / s.e.(beta0_hat) ~ t(n - 2)
## The degrees of freedom of the distribution of the 
## test statistic equal the number of observations n = 30 minus
## the number of estimated coefficients (2)
## The 0.025 and the 0.975 quantiles of this distribution are

qt(0.025, df = 30 - 2)
## and 
qt(0.975, df = 30 - 2)

## The CI has lower and upper limits as follows:

0.6417099 - 2.048407 * 0.1222707
0.6417099 + 2.048407 * 0.1222707

## e)
plot(invoices$Invoices, invoices$Time)
abline(a = 0.6417099, b = 0.0112916)

## f)
0.6417099 + 0.0112916 * 130

## or alternatively using predict
predict(fit, newdata = data.frame(Invoices = 130))

## g)
predict(fit, newdata = data.frame(Invoices = 130), se.fit = TRUE)

2.109624 - 2 * 0.0602081
2.109624 + 2 * 0.0602081

## h)
## H_0: beta1 = 0.01
## H_1: beta1 != 0.01

tStat <- (0.0112916 - 0.01) / 0.0008184
tStat

## Critical values at 95% significance level (5% error probability)

qt(0.025, df = 30 - 2)
qt(0.975, df = 30 - 2)

## The test statistic lies between the critical values
## therefore we cannot reject H0 at the 95% significance level

## i)
## Multiple R^2 for this regression model is 0.8718.

## j)
## Beta0 in this model corresponds to the expected work time per day.

## k)
fit0 <- lm(Time ~ 1, data = invoices)
summary(fit0)

## The estimate of beta0 in this model equals the sample mean of Time
mean(invoices$Time)

## The standard error of the coefficient estimate is 0.1652
## This equals the standard deviation of the sample mean

sqrt(var(invoices$Time) / 30)

## l)
plot(invoices$Invoices, invoices$Time)
abline(h = mean(invoices$Time))

