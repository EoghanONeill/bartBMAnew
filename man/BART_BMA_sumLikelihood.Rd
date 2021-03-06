% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{BART_BMA_sumLikelihood}
\alias{BART_BMA_sumLikelihood}
\title{Obtain BARTBMA predictions, trees, BICs etc. to be called by R functions}
\usage{
BART_BMA_sumLikelihood(less_greedy, spike_tree, s_t_hyperprior, p_s_t,
  a_s_t, b_s_t, num_obs, num_vars, lambda_poisson, data, y, start_mean,
  start_sd, a, mu, nu, lambda, c, sigma_mu, pen, num_cp, test_data,
  num_rounds, alpha, beta, split_rule_node, gridpoint, maxOWsize,
  num_splits, gridsize, zero_split, only_max_num_trees,
  min_num_obs_for_split, min_num_obs_after_split, exact_residuals)
}
\description{
Obtain BARTBMA predictions, trees, BICs etc. to be called by R functions
}
