library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

# binary outcome A/B ----
nA <- 30
nB <- 50
sA <- 3
sB <- 5
data_list <- list(nA = nA, nB = nB, sA = sA, sB = sB)
stan_samples <- stan(file = "binary_outcome_AB.stan", data = data_list)
posterior <- as.data.frame(stan_samples)
sum(posterior$rate_diff >= 0)/length(posterior$rate_diff)
sum(posterior$rate_diff < 0)/length(posterior$rate_diff)