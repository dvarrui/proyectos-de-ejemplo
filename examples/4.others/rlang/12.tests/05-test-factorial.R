#!/usr/bin/env Rscript
#
# Desde el terminal de R se puede ejecutar lo siguiente:
#   testthat::test_file("05-test-factorial.R")
#

source("02-def-factorial.R")

library(testthat)

test_that("Factorial works", {
  expect_equal(factorial(2), 2)
  expect_equal(factorial(3), 6)
})

test_that("Factorial fail", {
  expect_equal(factorial(2), 2)
  expect_identical(factorial(3), 7)
  expect_equal(factorial(4), 24)
})
