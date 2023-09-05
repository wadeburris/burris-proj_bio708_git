

# Week 4 Tue --------------------------------------------------------------

library(tidyverse)

#central tendancy

# construct vectors x and y
x <- c(15.9, 15.1, 21.9, 13.3, 24.4)
y <- c(15.9, 15.1, 21.9, 53.3, 24.4)
x
y

# for vector x
n_x <- length(x) # the number of elements in x = the number of data points
sum_x <- sum(x) # summation for x
mu_x <- sum_x / n_x # arithmetic mean
print(mu_x) # print calculated value

mean(x)
mean(y)

# for vector x
prod_x <- prod(x) # product of vector x; x1 * x2 * x3...
n_x <- length(x)
mug_x <- prod_x^(1 / n_x) # ^ means power
print(mug_x)

# for vector y
mug_y <- prod(y)^(1 / length(y))
print(mug_y)

# for vector x
x <- sort(x) # sort x from small to large
index <- (length(x) + 1) / 2 # (N + 1)/2 th index as length(x) is an odd number
med_x <- x[index]
print(med_x)

median(x)
median(y)

# for x
sqd_x <- (x - mean(x))^2 # squared deviance
sum_sqd_x <- sum(sqd_x)
var_x <- sum_sqd_x / length(x)
print(var_x)

# for x
sd_x <- sqrt(var_x) # sqrt(): square root
print(sd_x)

# for x
cv_x <- sd_x / mean(x)
print(cv_x)

# for x
x_l <- quantile(x, 0.25) # quantile(): return quantile values, 25 percentile
x_h <- quantile(x, 0.75) # quantile(): return quantile values, 75 percentile
iqr_x <- abs(x_l - x_h) # abs(): absolute value
print(iqr_x)

# for x
ad_x <- abs(x - median(x))
mad_x <- median(ad_x)
print(mad_x)

# for x
mm_x <- mad_x / median(x)
print(mm_x)




