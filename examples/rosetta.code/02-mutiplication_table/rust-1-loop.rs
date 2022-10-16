// compile: rustc -o a.out
use std::io;

fn main() {
    // step 1
    let mut input = String::new();
    println!("Write a number: ");
    io::stdin()
        .read_line(&mut input)
        .expect("failed to read from stdin");
    let number: i32 = input.trim().parse().expect("invalid input");

    for i in 1..11 { // step 2
        println!(" {:2} * {:2} = {:3}", i, number, i*number) //step 3
    }
}
