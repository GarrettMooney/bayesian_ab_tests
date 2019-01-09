library(Rcpp)

sourceCpp('bayesian_ab_test.cpp')

# binary outcome A/B ----
nA <- 30
nB <- 50
sA <- 3
sB <- 5

# alphas are successes+1, betas are failures+1
1-probability_B_beats_A(nA+1, sA+1, nB+1, sB+1)
probability_B_beats_A(nA+1, sA+1, nB+1, sB+1)