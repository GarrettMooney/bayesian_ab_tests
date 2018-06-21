library(Rcpp)
sourceCpp('bayesian_ab_test.cpp')

# alphas are successes+1, betas are failures+1
probability_B_beats_A(3, 30, 5, 50)

# alphas are counts, beta are exposures
probability_1_beats_2(3, 1, 5, 2)
