crime <- read.delim('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/crime.csv', stringsAsFactors = FALSE)
str(crime)


fit1 <- lm(C ~ HS, data = crime)
summary(fit1)

fit2 <- lm(C ~ U, data = crime)
summary(fit2)

fit3 <- lm(C ~ U + HS, data = crime)
summary(fit3)

pairs(crime[, -1])

predict(fit3, newdata = data.frame(HS = 60, U = 80), se.fit = TRUE)

78.71554 - 2 * 8.199446
78.71554 + 2 * 8.199446

summary(fit1)
predict(fit1, newdata = data.frame(HS = c(0, 20, 70, 100)), se.fit = TRUE)
crime <- read.delim('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/crime.csv', stringsAsFactors = FALSE)
str(crime)


fit1 <- lm(C ~ HS, data = crime)
summary(fit1)

fit2 <- lm(C ~ U, data = crime)
summary(fit2)

fit3 <- lm(C ~ U + HS, data = crime)
summary(fit3)

pairs(crime[, -1])

predict(fit3, newdata = data.frame(HS = 60, U = 80), se.fit = TRUE)

78.71554 - 2 * 8.199446
78.71554 + 2 * 8.199446

summary(fit1)
predict(fit1, newdata = data.frame(HS = c(0, 20, 70, 100)), se.fit = TRUE)
