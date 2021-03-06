#' Lower boundary correlation coefficient.
#' @name R2.L
#' @aliases R2.L
#' @author Oldemar Rodriguez Rojas
#' @description Compute the lower boundary correlation coefficient for two interval variables.
#' @usage R2.L(sym.var, prediction)
#' @param sym.var Variable that was predicted.
#' @param prediction The prediction given by the model.
#'
#' @return The lower boundary correlation coefficient.
#' @references
#' LIMA-NETO, E.A., DE CARVALHO, F.A.T., (2008). Centre and range method
#' to fitting a linear regression model on symbolic interval data. Computational
#' Statistics and Data Analysis 52, 1500-1515.
#'
#' LIMA-NETO, E.A., DE CARVALHO, F.A.T., (2010). Constrained linear regression models
#' for symbolic interval-valued variables. Computational Statistics and
#' Data Analysis 54, 333-347.
#' @seealso sym.glm
#' @examples
#' data(int_prost_train)
#' data(int_prost_test)
#' res.cm<-sym.lm(lpsa~.,sym.data=int_prost_train,method='cm')
#' pred.cm<-predictsym.lm(res.cm,int_prost_test,method='cm')
#' R2.L(sym.var(int_prost_test,9),pred.cm$Fitted)
#'
#' res.cm.lasso<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
#'                       alpha=1,nfolds=10,grouped=TRUE)
#' pred.cm.lasso<-predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
#' R2.L(sym.var(int_prost_test,9),pred.cm.lasso)
#' @keywords lower correlation
#' @importFrom stats cor
#' @export
R2.L <- function(sym.var, prediction) {
    pvar <- sym.var
    pred <- prediction
    return(cor(pvar$var.data.vector[, 1], pred[, 1])^2)
}
