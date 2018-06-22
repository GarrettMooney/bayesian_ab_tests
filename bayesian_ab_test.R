library(Rcpp)
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

sourceCpp('bayesian_ab_test.cpp')

# binary outcome A/B ----
nA = 30L
nB = 50L
sA = 3L
sB = 5L
data_list <- list(nA = nA, nB = nB, sA = sA, sB = sB)
stan_samples <- stan(file = "binary_outcome_AB.stan", data = data_list)
plot(stan_samples)
posterior <- as.data.frame(stan_samples)
sum(posterior$rate_diff < 0)/length(posterior$rate_diff)

# alphas are successes+1, betas are failures+1
probability_B_beats_A(nA+1L, sA+1L, nB+1L, sB+1L)

# count data A/B ----
y1 <- rlang::int(6, 4, 2, 3, 4, 3, 0, 4, 0, 6, 3)
y2 <- rlang::int(4, 2, 1, 1, 2, 1, 2, 1, 3, 2, 1)
data_list <- list(y1 = y1, y2 = y2, n1 = length(y1), n2 = length(y2))
stan_samples <- stan(file = "count_data_AB.stan", data = data_list)
plot(stan_samples)
posterior <- as.data.frame(stan_samples)
sum(posterior$lambdaDiff > 0)/length(posterior$lambdaDiff)

# alphas are counts, beta are exposures
probability_1_beats_2(sum(y1), length(y1), sum(y2), length(y2))
