data {
int<lower=0> N; // Number of observations
int<lower=0> y[N]; // Number of flowers
}
parameters {
real mu;
real<lower=0> sigma2;
}
model {
mu ~ normal(0,100); // Normal with mean 0, st.dev. 100
sigma2 ~ scaled_inv_chi_square(1,2); // Scaled-inv-chi2 with nu 1,sigma 2
for(i in 1:N){
y[i] ~ normal(mu,sqrt(sigma2));
}
}