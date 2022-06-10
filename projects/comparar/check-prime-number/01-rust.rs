fn main() {
  let b = is_prime(25);
  if b {
    println!("Is prime!");
  } else {
    println!("Is NOT prime.");
  }
}

fn is_prime(n: u32) -> bool {
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

