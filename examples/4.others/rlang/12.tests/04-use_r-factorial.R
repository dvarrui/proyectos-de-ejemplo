#!/usr/bin/env Rscript

library(testthat)
use_r("02-def-factorial")

message("2! = ", factorial(2))
message("3! = ", factorial(3))
message("4! = ", factorial(4))
