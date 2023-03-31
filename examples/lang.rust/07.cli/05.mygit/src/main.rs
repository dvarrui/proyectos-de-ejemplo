use std::env::args;

fn main() {
    println!("[mygit] Running");

    let pattern = args().nth(1).expect("no pattern given");
    let path = args().nth(2).expect("no path given");
}
