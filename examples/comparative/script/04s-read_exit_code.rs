use std::process::Command;

fn main() {
    let output = Command::new("ping")
                        .arg("-c")
                        .arg("1")
                        .arg("192.168.1.1")
                        .output()
                        .expect("failed to execute process");
    println!("status: {}", output.status);

    let output = Command::new("ping")
                        .arg("-c")
                        .arg("1")
                        .arg("192.168.16.16")
                        .output()
                        .expect("failed to execute process");
    println!("status: {}", output.status);
}
