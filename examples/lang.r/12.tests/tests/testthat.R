#!/usr/bin/env Rscript

library(testthat)

# Reporter:
#   "progress", which is the default,
#   "minimal" if you want a simpler report,
#   "location", shows the file, line and column of the test run (failed or otherwise),
#   "debug", which allows to debug interactively a failing test and more.

test_dir("tests/testthat", reporter=c("progress"))
