# This file was generated by Rcpp::compileAttributes
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Test for enrichment in a ranked binary list.
#' 
#' @description
#' Given a ranked binary list of ones and zeros, test if the ones are
#' enriched at the beginning of the list.
#'
#' @details
#' Suppose we have a set of \code{N = 5000} genes and \code{K = 100} of them
#' are annotated with a Gene Ontology (GO) term. Further, suppose that we find
#' some subset of these genes to be significantly differentially expressed
#' (DE) between two conditions. Within the DE genes, we notice that
#' \code{k = 15} of the DE genes are annotated with the Gene Ontology term. At
#' this point, we would like to know if the GO term is enriched for DE genes.
#'
#' 
#' We use the hypergeometric distribution to compute a probability that we
#' would observe a given number of DE genes annotated with a GO term. You
#' can find more details in the documentation for \code{\link{dhyper}}.
#' 
#' The method consists of three steps:
#' 
#' \itemize{
#' \item Compute a hypergeometric probability at each rank in the list.
#' \item Choose the minimum hypergeometric probability (mHG) as the test
#'       statistic.
#' \item Use dynamic programming to compute the exact permutation p-value
#'       for observing a test statistic at least as extreme by chance.
#' }
#' 
#' @param x Binary vector of ones and zeros.
#' @param N Size of the population.
#' @param K Number of successes in the population.
#' @param L Only consider scores for the first L observations.
#' @param X Require at least X ones to get a score less than 1.
#' @param upper_bound Instead of running a dynamic programming algorithm,
#'   return the upper bound for the p-value.
#' @param tol The tolerance for testing equality of two numbers.
#'
#' @return A list with items "threshold", "mHG", and "pvalue".
#'
#' @seealso \code{\link{plot_mhg}}
#'
#' @examples
#' # Size of the population.
#' N <- 5000L
#' # Successes in the population.
#' K <- 100L
#' # Only consider enrichments in the first L observations.
#' L <- N / 4L
#' # Require at least X successes in the first L observations.
#' X <- 5L
#'
#' set.seed(42)
#'
#' # Binary vector of successes and failures.
#' x <- rep(0, N)
#' x[sample(100, 5)] <- 1
#' x[sample(200, 10)] <- 1
#'
#' res <- mhg_test(x, N, K, L, X)
#'
#' abs(res$pvalue - 1.810658e-05) < 1e-6 # TRUE
#'
#' # Plot the result.
#' plot_mhg(sort(rnorm(N)), x, res, L)
#'
#' @references
#' Eden, E., Lipson, D., Yogev, S. & Yakhini, Z. Discovering motifs in ranked
#' lists of DNA sequences. PLoS Comput. Biol. 3, e39 (2007).
#' \url{http://dx.doi.org/10.1371/journal.pcbi.0030039}
#'
#' Wagner, F. GO-PCA: An Unsupervised Method to Explore Biological
#' Heterogeneity Based on Gene Expression and Prior Knowledge. bioRxiv (2015).
#' \url{http://dx.doi.org/10.1101/018705}
mhg_test <- function(x, N, K, L, X, upper_bound = FALSE, tol = 0.0000000000000001) {
    .Call('mhg_mhg_test', PACKAGE = 'mhg', x, N, K, L, X, upper_bound, tol)
}

