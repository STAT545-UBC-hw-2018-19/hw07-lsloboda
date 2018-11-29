#' Simplified Box-Cox Transformation
#'
#' This function applies an estimate of the power transformation factor (lambda) in a deterministic power function to turn non-normal data into normal data.
#' However, since lamba is user-defined in this function, it may not necessarily result in a normal distribution. A more complex method, such as
#' maximum likelihood estimate (MLE) or Newton-Raphson, may be used to estimate the value of lamba required to achieve a Gaussian distribution, however
#' this is beyond the scope of this assignment.
#'
#' @param x Initial data set.
#' @param lambda Estimate of power transformation factor to make \code{x} a normal distribution.
#' @param delta Amount to shift x by to ensure positive values.
#' @param plot_it Display a plot of \code{x} vs the output. Use logical.
#' @return The vector \code{y}, which represents that transformation of \code{x} by the Box-Cox algorithm.

boxcox <- function(x, lambda, delta, plot_it) {

    #Set sensible defaults
    if(missing(x)){
        return(print("Function requires a dataset"))}
    if(missing(lambda)){
        return(print("Function requires an estimate for lambda"))}
    if(missing(delta)){
        delta <- 0}
    if(missing(plot_it)){
        plot_it <- TRUE}

    #Box-Cox requires positive values, so a shift value should be applied if specified
    if (delta != 0){
        x <- x + delta
    }

    #Apply Box-Cox transformation to obtain new 'normalized' data set
    if (lambda == 0){
        y <- log(x)
    } else {
        y <- ((x^lambda) - 1) / lambda
    }

    #Create plot of old vs. new data to see the transformation
    if (plot_it) print(
        ggplot2::qplot(x, y)
    )
    return(y)
}

#' @rdname boxcox
#' @export
