library(rstanarm)
library(HSAUR3)

data("clouds", package = "HSAUR3")
mod <- rainfall ~ seeding * (sne+cloudcover+prewetness+echomotion) + time

mle <- lm(formula = mod, data = clouds)
round(summary(mle)$coefficients[, 1:2], 1)

R2prior <- R2(location = 0.2, what = "mode")
post <- stan_lm(formula = mod, data = clouds, prior = R2prior)
print(post)
