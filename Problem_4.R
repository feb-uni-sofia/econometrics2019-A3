inc <- read.csv('https://firebasestorage.googleapis.com/v0/b/uni-sofia.appspot.com/o/courses%2Feconometrics2019%2Fassignments%2Fassignment4%2Fincome_and_education_sim.csv?alt=media&token=71af68ad-1ea2-4cb6-9c2c-fa711b5ba9a9')
str(inc)

## a)
table(inc$education)

## 31 persons in the sample have no diploma

## b)

inc <- within(inc, {
  ## Rescale income (easier to read values)
  income <- income / 1000
})

## c)
boxplot(income ~ education, data = inc)

## d)
fit <- lm(income ~ education, data = inc)
summary(fit)

## The model includes an intercept and three indicator (dummy)
## variables for every category of education except "College" which
## serves as the reference category.

## The intercept equals the population average income of 
## persons with a college degree
## The estimated intercept equals 256.85 thousand dollars (annual income)
## and is equal to the sample mean of the income for this group

## The coefficients for the indicator variables correspond to
## differences between population (group) averages
## E.g. the coefficient for Graduate degree is equal to the difference 
## between the (populaiton) average income of persons with a graduate
## degreen and the (population) average income of persons with a college
## degree

## The _estimates_ of the coefficients correspond to differences 
## between group sample means.

## Complare the coefficient estimates with the group sample means:

mean(inc[inc$education == 'No diploma', "income"])
mean(inc[inc$education == 'High school', "income"])
mean(inc[inc$education == 'College degree', "income"])
mean(inc[inc$education == 'Graduate degree', "income"])

## e)
fit0 <- lm(income ~ 1, data = inc)

anova(fit0, fit)

## The value of the F-statistic is 19.034
## and the p-value of the test is 4.735e-11 < 0.05
## so we reject the null hypothesis at the 95% significance
## level (5% error probability)

## Note that this test is also available in the last line
## of the regression output (see summary(fit))

## f)
## Multiple R^2 = 0.2003. About 20% of the variation of income
## can be attributed to differences in education level.

## g)
## First we calculate the quantiles of the 
## appropriate t-distribution

qt(0.025, df = 232 - 4)
qt(0.975, df = 232 - 4)

## CI educationGraduate degree (beta_gr)
176.56 - 1.97 * 47.92
176.56 + 1.97 * 47.92

## CI educationHigh school (beta_hs)
-170.77 - 1.97 * 55.13
-170.77 + 1.97 * 55.13

## CI educationNo diploma (beta_nd)
-164.93 - 1.97 * 63.71
-164.93 + 1.97 * 63.71

## The confidence interval for beta_gr is [82.15, 270.96]
## which is far from the confidence intervals for
## beta_hs [-279.37, -62.16] and beta_nd [-290.43, -39.42]
## This indicates that beta_gr is greater than beta_nd and beta_hs.

## The confidence intervals for beta_hs and beta_nd overlap
## which __suggests__ that the coefficients __may__ be equal. Please note
## that overlapping confidence intervals generally do NOT __imply__ that 
## the coefficients are equal.
## An appropriate approach would be to test the hypothesis beta_nd = beta_hs
## (not discussed in class).
