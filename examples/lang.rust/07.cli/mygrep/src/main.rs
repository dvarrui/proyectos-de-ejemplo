use std::env::args;

fn main() {
    println!("Hello, world!");

    let _pattern = args().nth(1).expect("no pattern given");
    let _path = args().nth(2).expect("no path given");
}
