#!/usr/bin/env Rscript

# create a recursive program that
# calculates the factorial of number n

factorial <- function(n)
{
  if(n <= 0) {
    return(1)
  } else {
    return(n * factorial(n - 1))
  }
}
