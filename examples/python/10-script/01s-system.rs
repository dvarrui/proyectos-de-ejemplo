// rustc PROGRAM.rs

use std::process::{Command, Stdio};

fn main() {
    Command::new("rustc")
            .arg("--version")
            .stdin(Stdio::null())
            .stdout(Stdio::inherit())
            .output()
            .unwrap()
            .stdout;
}
