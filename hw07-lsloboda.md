hw07-lsloboda
================

-   [Building your own R package](#building-your-own-r-package)
    -   [Problem](#problem)
    -   [Background](#background)
    -   [Function Code](#function-code)
    -   [Output](#output)
    -   [Documentation](#documentation)
    -   [Resources](#resources)

Building your own R package
===========================

Problem
-------

The objective of the assignment is to build, test and document a new R package. I decided to add a Box-Cox transformation to the *powers* package that was worked on in class.

Background
----------

The Box-Cox transformation is used to make a non-normal distribution into a normal distribution, allowing normal-dependent tests (e.g. t-tests) to be conducted on the data. The power transformation factor, or lambda, is estimated using a variety of techniques, such as maximum likelihood estimate (MLE) or a root-finding method such as Newton-Raphson. The power transformation factor is then applied to the data to, ideally, achieve normalized data. *Note: The Box-Cox transformation can only be used on positive data, so negative values must be shifted to be positive before applying the method.*

*math equations*

Different methods of estimation and transformation are useful in different scenarios (as discussed here(link) and in the resources section at the bottom of this page). Implementing a rigorous Box-Cox algorithm would require a family of functions.

For simplification, I will focus only on the **transformation** step for two cases: lambda = 0 and does not = 0. I will apply user-defined values for the positive shift value and the estimate of lambda.

Further, these general steps that I used to create a package in R:

-   Seed the repo with the original *powers* package, using a ZIP file
-   Create a new R script for the new function
-   Define the inputs: the dataset to be transformed, the estimate of lambda, the value to shift x by, and a logical denoting whether to plot the old results vs. new results
-   Define the outputs: the transformed dataset, and optionally a plot of old results vs. new results
-   Write the function, including 3 conditions: (i) Apply the x-shift, if the user provided it; (ii) Apply the transformation appropriate for lambda = 0 or (iii) Apply the transformation appropriate for lamba != 0.
-   Write 3 unit tests to check different scenarios
-   Update the documentation using the appropriate tags
-   Run devtools::document() regularly, along with Restart + Install
-   Check the function to ensure no errors occur
-   Update the README and vignette

If abs(lambda) &gt; 3; then return error (this is to stop inappropriate use of the function, which is meant for only small transformations)

Function Code
-------------

``` r
#' Simplified Box-Cox Transformation
#'
#' This function applies an estimate of the power transformation factor (lambda) in a deterministic power function to turn non-normal data into normal data.
#' However, since lamba is user-defined in this function, it may not necessarily result in a normal distribution. A more complex method, such as
#' maximum likelihood estimate (MLE) or Newton-Raphson, may be used to estimate the value of lamba required to achieve a Gaussian distribution, however
#' this is beyond the scope of this assignment.
#'
#' @param x Initial data set.
#' @param lambda User-defined estimate of power transformation factor to make \code{x} a normal distribution.
#' @param delta Amount to shift x by to ensure positive values.
#' @param plot_it Display a plot of \code{x} vs the output. Use logical.
#' @return The vector \code{y}, which represents that transformation of \code{x} by the Box-Cox algorithm.

boxcox <- function(x, lambda, delta, plot_it) {

    #Box-Cox requires positive values, so a shift value should be applied if necessary; here, the shift is the user-specified 'delta'
    if (delta != 0){ 
        x <- x + delta
    }

    #Apply Box-Cox transformation to obtain new 'normalized' data set; here, lambda is user-specified, so normalization is not expected
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
```

Output
------

Documentation
-------------

Resources
---------
