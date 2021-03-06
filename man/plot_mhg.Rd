% Generated by roxygen2 (4.0.2): do not edit by hand
\name{plot_mhg}
\alias{plot_mhg}
\title{Plot the results of the minimum hypergeometric test.}
\usage{
plot_mhg(values, x, res, n = 500, main = "", value = "Value", cex = 1.5,
  cex.lab = 1.5, cex.axis = 1.5, cex.main = 2)
}
\arguments{
\item{values}{The values corresponding to the ranked vector.}

\item{x}{A binary vector of successes and failures.}

\item{res}{A list returned by mhg_test.}

\item{n}{Plot the first n items in the list.}

\item{main}{The title of the plot.}

\item{value}{The name of the value used to rank the items.}

\item{cex}{The relative size of the legend text.}

\item{cex.lab}{The relative size of the axis labels.}

\item{cex.axis}{The relative size of the axis tickmarks.}

\item{cex.main}{The relative size of the title.}
}
\description{
Plot the results of the minimum hypergeometric test.
}
\examples{
# Size of the population.
N <- 5000L
# Successes in the population.
K <- 100L
# Only consider enrichments in the first L observations.
L <- N / 4L
# Require at least X successes in the first L observations.
X <- 5L

set.seed(42)

# Binary vector of successes and failures.
x <- rep(0, N)
x[sample(100, 5)] <- 1
x[sample(200, 10)] <- 1

res <- mhg_test(x, N, K, L, X)

abs(res$pvalue - 1.810658e-05) < 1e-6 # TRUE

# Plot the result.
plot_mhg(sort(rnorm(N)), x, res, L)
}
\seealso{
\code{\link{mhg_test}}
}

