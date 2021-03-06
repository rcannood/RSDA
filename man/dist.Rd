% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dist.R
\name{dist}
\alias{dist}
\alias{dist.default}
\alias{dist.sym.data.table}
\title{Generic function for distance matrix computation}
\usage{
dist(x, ...)

\method{dist}{default}(x, method = "euclidean", diag = FALSE,
  upper = FALSE, p = 2, ...)

\method{dist}{sym.data.table}(x, q = 2, ...)
}
\arguments{
\item{x}{An R object. Currently the are methods for numeric matrix, data.frame, dist object or symbolic data table}

\item{...}{Further arguments passed to or from other methods}

\item{method}{the distance measure to be used. This must be one of "euclidean", "maximum", "manhattan", "canberra", "binary" or "minkowski". Any unambiguous substring can be given.}

\item{diag}{logical value indicating whether the diagonal of the distance matrix should be printed by print.dist.}

\item{upper}{logical value indicating whether the upper triangle of the distance matrix should be printed by print.dist.}

\item{p}{The power of the Minkowski distance.}

\item{q}{q value for the Minkowski method}
}
\value{
dist returns an object of class 'dist'
}
\description{
Generic function for distance matrix computation
}
\author{
Oldemar Rodriguez Rojas
}
