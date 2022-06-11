use std::io;
use std::{i32};
 
fn main() {
  // User will enter number
  println!("Input number? ");
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Unable to read entered data");

  // Converting string to integer
  let number: i32 = input.trim().parse().ok().expect("Program only processes numbers, Enter number");
  let b = is_prime(number);

  if b {
    println!("Is prime!");
  } else {
    println!("Is NOT prime.");
  }
}

fn is_prime(n :i32) -> bool {
  if n <= 1 {
    return false;
  }
  for a in 2..n {
    if n % a == 0 {
      return false; 
    }
  }
  true
}

