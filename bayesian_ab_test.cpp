#include <Rcpp.h>
#include <Rmath.h>
using namespace Rcpp;

// [[Rcpp::export]]
double probability_B_beats_A(double alpha_a, double beta_a, double alpha_b, double beta_b){
	double total = 0.0;
	for(int i = 0; i < alpha_b; ++i){
		total += exp(R::lbeta(alpha_a + i, beta_b + beta_a) - log(beta_b + i) - R::lbeta(1 + i, beta_b) - R::lbeta(alpha_a, beta_a));
	}
	return total;
}

// [[Rcpp::export]]
double probability_1_beats_2(double alpha_1, double beta_1, double alpha_2, double beta_2){
	double total = 0.0;
	for(int k = 0; k < alpha_1; ++k){
		total += exp(k * log(beta_1) + alpha_2 * log(beta_2) - (k + alpha_2) * log(beta_1 + beta_2) - log(k + alpha_2) - R::lbeta(k + 1, alpha_2));
	}
	return total;
}
