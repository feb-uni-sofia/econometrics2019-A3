inc <- read.csv('https://firebasestorage.googleapis.com/v0/b/uni-sofia.appspot.com/o/courses%2Feconometrics2019%2Fassignments%2Fassignment4%2Fincome_and_education_sim.csv?alt=media&token=71af68ad-1ea2-4cb6-9c2c-fa711b5ba9a9')
str(inc)

inc <- within(inc, {
  ## Rescale income (easier to read values)
  income <- income / 1000
})

table(inc$education)

mean(inc[inc$education == 'No diploma', "income"])
mean(inc[inc$education == 'High school', "income"])
mean(inc[inc$education == 'College degree', "income"])
mean(inc[inc$education == 'Graduate degree', "income"])

fit <- lm(income ~ education, data = inc)
summary(fit)
