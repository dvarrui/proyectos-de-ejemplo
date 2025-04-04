source("../../R/sum.R")

test_that("Check commutative property", {
    expect_identical(my_good_sum(4, 6), 10)
    expect_identical(my_good_sum(6, 4), 10)
})

test_that("Check neutral element", {
    expect_identical(my_good_sum(0, 0), 0)
    expect_identical(my_good_sum(0, 1), 1)
    expect_identical(my_good_sum(1, 0), 1)
})
