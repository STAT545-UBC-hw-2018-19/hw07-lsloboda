context("Applying Box-Cox Transformation")

test_that("The dataset is shifted by the user-specified delta value", {
    shift <- c(50)
    expect_identical(boxcox(1:100, 1, shift, FALSE), c( ((1:100 + shift) - 1)))
})

test_that("$Correct function is used when lambda equals zero", {
    expect_identical(boxcox(1:100, 0, 0, FALSE), log(1:100))
})

test_that("$Correct function is used when lambda does not equals zero", {
    expect_identical(boxcox(1:100, 2, 0, FALSE), ((1:100)^2 - 1) / 2)
})

#don't need to manually run this script; bc it's called test_something, it will run automatically with testthat
#to test it, go to Build > More > Test or Check (will not be captured in the normal Check!)
