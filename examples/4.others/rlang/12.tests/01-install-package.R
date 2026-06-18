#!/usr/bin/env Rscript
# Install testthat package

if (!require(testthat)) install.packages('testthat')

# Install the released version from CRAN
# install.packages("testthat")
#
# Or the development version from GitHub:
# install.packages("pak")
# pak::pak("r-lib/testthat")
