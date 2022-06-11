use std::{i32};
 
fn main() {
  let number = 7;

  println!("Factorial({}) = {}", number, factorial(number));
}

fn factorial(n :i32) -> i32 {
  if n <= 1 { return 1; }

  let mut factorial = 1;
  for i in 2..n {
    factorial = factorial * i;
  }
  factorial
}

