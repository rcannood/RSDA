#' Upper boundary root-mean-square error
#' @name RMSE.U
#' @aliases RMSE.U
#' @author Oldemar Rodriguez Rojas
#' @description Compute the upper boundary root-mean-square error.
#' @usage RMSE.U(sym.var, prediction)
#' @param sym.var Variable that was predicted.
#' @param prediction The prediction given by the model.
#'
#' @return The upper boundary root-mean-square error.
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
#' RMSE.U(sym.var(int_prost_test,9),pred.cm$Fitted)
#'
#' res.cm.lasso<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
#'                       alpha=1,nfolds=10,grouped=TRUE)
#' pred.cm.lasso<-predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
#' RMSE.U(sym.var(int_prost_test,9),pred.cm.lasso)
#' @keywords upper root-mean-square
#' @export
#'
RMSE.U <- function(sym.var, prediction) {
    pvar <- sym.var
    pred <- prediction
    nn <- pvar$N
    res <- sqrt(sum((pvar$var.data.vector[, 2] - pred[, 2])^2)/nn)
    # res<-sum((pvar$var.data.vector[,2]-pred[,2])^2)/nn
    return(res)
}
