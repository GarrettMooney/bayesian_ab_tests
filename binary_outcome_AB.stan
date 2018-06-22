data{
  // Trials
  int nA;
  int nB;
  // Successes
  int sA;
  int sB;
}
parameters {
  real<lower=0, upper=1> rateA;
  real<lower=0, upper=1> rateB;
}
model{
  rateA ~ uniform(0,1);
  rateB ~ uniform(0,1);
  sA ~ binomial(nA, rateA);
  sB ~ binomial(nB, rateB);
}
generated quantities {
  real rate_diff;
  rate_diff = rateB - rateA;
}
