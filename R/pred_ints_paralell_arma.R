#' @title Prediction intervals for bart-bma output obtained using linear algebra and draws from distributions provided by armadillo C++ library
#' 
#' @description This function produces prediction intervals for bart-bma output obtained using rmixt function from the package mvnfast.
#' @param num_iter Total number of iterations of the Gibbs sampler (including burn-in).
#' @param burnin Number of burn-on iterations of the Gibbs sampler.
#' @param newdata Test data for which predictions are to be produced. Default = NULL. If NULL, then produces prediction intervals for training data if no test data was used in producing the bartBMA object, or produces prediction intervals for the original test data if test data was used in producing the bartBMA object.
#' @param update_resids Option for whether to update the partial residuals in the gibbs sampler. If equal to 1, updates partial residuals, if equal to zero, does not update partial residuals. The defaullt setting is to update the partial residua;s.
#' @export 
#' @return The output is a list of length one. The one element in this list is a vector of prediction intervals???

pred_ints_paralell_arma <-function(object,num_iter,burnin,l_quant,u_quant,newdata=NULL,update_resids=1,num_cores=1){
  #object will be bartBMA object.
  
  
  
  
  if(is.null(newdata) && length(object)==16){
    #if test data specified separately
    ret<-pred_ints_lin_alg_parallel_outsamp(object$sumoftrees,object$obs_to_termNodesMatrix,object$response,object$bic,num_iter, burnin,object$nrowTrain,
                                   nrow(object$test_data),object$a,object$sigma,0,object$nu,
                                   object$lambda,#diff_inital_resids,
                                   object$test_data,l_quant,u_quant,num_cores
    )
    
    
    
  }else{if(is.null(newdata) && length(object)==14){
    #else return Pred Ints for training data
    stop("Code not yet written for insample")
    
    #ret<-pred_ints_lin_alg_insamp(object$sumoftrees,object$obs_to_termNodesMatrix,object$response,object$bic,num_iter, burnin,object$nrowTrain,
    #                              object$a,object$sigma,0,object$nu,
    #                              object$lambda,l_quant,u_quant,num_cores
    #)
    
  }else{
    #if test data included in call to object
    ret<-pred_ints_lin_alg_parallel_outsamp(object$sumoftrees,object$obs_to_termNodesMatrix,object$response,object$bic,num_iter, burnin,object$nrowTrain,
                                   nrow(newdata), object$a,object$sigma,0,object$nu,
                                   object$lambda,#diff_inital_resids,
                                   newdata,l_quant,u_quant,num_cores
    )
    
  }}
  
  #PI<-apply(draws_from_mixture,2,function(x)quantile(x,probs=c(l_quant,0.5,u_quant)))
  
  
  #each row is a vector drawn from the mixture distribution
  
  
  class(ret)<-"pred_intervals.bartBMA"  
  ret
}