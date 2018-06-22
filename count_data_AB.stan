data{
  int n1;
  int n2;
  int y1[n1];
  int y2[n2];
}
parameters {
  real<lower=0> lambda1;
  real<lower=0> lambda2;
}
model{
  lambda1 ~ uniform(0,100);
  lambda2 ~ uniform(0,100);
  y1 ~ poisson(lambda1);
  y2 ~ poisson(lambda2);
}
generated quantities {
  real lambdaDiff = lambda1 - lambda2;
}
