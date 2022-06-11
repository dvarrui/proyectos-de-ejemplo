use std::io;

fn main() {
  println!("Input number? ");
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Unable to read entered data");
  let number: u64 = input.trim().parse().ok().expect("Program only processes numbers, Enter number");

  println!("Factorial({}) = {}", number, factorial(number));
}

fn factorial(n :i32) -> i32 {
  if n == 1 { return 1; }

  return n * factorial(n-1);
}
