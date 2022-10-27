use std::process::Command;

fn main() {
    let output = Command::new("date")
                         .output()
                         .unwrap();
    println!("{:?}", output);
}
