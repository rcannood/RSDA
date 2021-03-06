% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictsym.glm.R
\name{predictsym.glm}
\alias{predictsym.glm}
\title{Predict method to Lasso, Ridge and and Elastic Net Linear regression model
to interval variables}
\usage{
predictsym.glm(model, new.sym.data, response = 1, method = c('cm', 'crm'))
}
\arguments{
\item{model}{The output of glm method.}

\item{new.sym.data}{Should be a symbolic data table read with the function read.sym.table(...).}

\item{response}{The number of the column where is the response variable in the interval data table.}

\item{method}{'cm' to generalized Center Method and 'crm' to generalized Center and Range Method.}
}
\value{
The object returned depends the ... argument which is passed on to the predict
method for glmnet objects.
}
\description{
To execute Predict method to Lasso, Ridge and and Elastic Net Linear
regression model to interval variables.
}
\examples{
data(int_prost_train)
data(int_prost_test)
res.cm.lasso<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
                      alpha=1,nfolds=10,grouped=TRUE)
pred.cm.lasso<-predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
plot(res.cm.lasso)
plot(res.cm.lasso$glmnet.fit, 'norm', label=TRUE)
plot(res.cm.lasso$glmnet.fit, 'lambda', label=TRUE)
RMSE.L(sym.var(int_prost_test,9),pred.cm.lasso)
RMSE.U(sym.var(int_prost_test,9),pred.cm.lasso)
R2.L(sym.var(int_prost_test,9),pred.cm.lasso)
R2.U(sym.var(int_prost_test,9),pred.cm.lasso)
deter.coefficient(sym.var(int_prost_test,9),pred.cm.lasso)

}
\references{
Rodriguez O. (2013). A generalization of Centre and Range method for fitting a linear
regression model to symbolic interval data using Ridge Regression, Lasso
and Elastic Net methods. The IFCS2013 conference of the International Federation of
Classification Societies, Tilburg University Holland.
}
\seealso{
sym.glm
}
\author{
Oldemar Rodriguez Rojas
}
\keyword{Lasso}
\keyword{Regression}
\keyword{Ridge}
\keyword{Symbolic}
