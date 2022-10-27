use std::process::Command;

fn main() {
    let output = Command::new("date")
                         .output()
                         .unwrap();
    let text = String::from_utf8_lossy(&output.stdout);
    println!("La fecha actual es: {}", text);
}
