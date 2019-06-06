childiq <- read.csv('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/childiq.csv')
str(childiq)

## a)

kidScoreWithHs <- childiq$kid_score[childiq$mom_hs == 1]
averageScoreWithHs <- mean(kidScoreWithHs)
kidScoreNoHs <- childiq$kid_score[childiq$mom_hs == 0]
averageIqNoHs <- mean(kidScoreNoHs)

## b)

fit <- lm(kid_score ~ mom_hs, data = childiq)
summary(fit)

## c)
## Read the value of the test statistic from the regression output

## tStat = 5.069
## The p-value of the test is 5.96e-07 and is lower than 0.05 so we
## reject the null hypothesis at a 95% significance level (5% error probability)

## An equivalent way to perform the test (with an equal variance assumption)
## is:

t.test(kidScoreWithHs, kidScoreNoHs, var.equal = TRUE)


## d) Estimated regression equation (line)

## kid_score_i = 77.548 + 11.771 mom_hs_i 

## f) 
## Instead of proving the statement in the question we
## illustrate its validity by looking at the coefficient estimates
## compare the estimate of beta1 (the coefficient for mom_hs_i)
## with the difference of the sample means: 
## compare (averageIqNoHs, averageScoreWithHs)

## g)
## We illustrate the statement by fitting a model 
## that only includes a constant. 

fit0 <- lm(kid_score ~ 1, data = childiq)
summary(fit0)

## Compare the estimate of beta0 with the overall sample mean
mean(childiq$kid_score)
