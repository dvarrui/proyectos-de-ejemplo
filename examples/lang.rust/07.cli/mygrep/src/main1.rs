use std::env::args;

fn main() {
    println!("Hello, world!");

    let pattern = args().nth(1).expect("no pattern given");
    let path = args().nth(2).expect("no path given");
    let _args = Cli {
        pattern: pattern,
        path: std::path::PathBuf::from(path),
    };
}
