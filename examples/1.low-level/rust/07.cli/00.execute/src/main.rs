use std::process::Command;

fn main() {
    println!("==> Executing command");
    
    Command::new("ls")
        .current_dir(".")
        .spawn()
        .expect("ls command failed to start");
}
