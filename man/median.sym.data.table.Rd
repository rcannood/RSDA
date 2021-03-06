% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/median.sym.data.table.R
\name{median.sym.data.table}
\alias{median.sym.data.table}
\title{Symbolic Median}
\usage{
\method{median}{sym.data.table}(x, na.rm = FALSE, method = c("centers",
  "interval", "modal"), ...)
}
\arguments{
\item{x}{The symbolic variable.}

\item{na.rm}{As in R median function.}

\item{method}{The method to be use.}

\item{...}{As in R median function.}
}
\value{
Return a real number.
}
\description{
This function compute the symbolic median.
}
\examples{
data(example3)
sym.data<-example3
median(sym.data[,2])
median(sym.data[,6] ,method='interval')
median(sym.data[,3] ,method='modal')
}
\references{
Billard L. and  Diday E. (2006).
Symbolic data analysis: Conceptual statistics and data mining. Wiley, Chichester.

Rodriguez, O. (2000).
Classification et Modeles Lineaires en Analyse des Donnees Symboliques. Ph.D. Thesis,
Paris IX-Dauphine University.
}
\author{
Oldemar Rodriguez Rojas
}
\keyword{Median}
\keyword{Symbolic}
