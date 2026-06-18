#![allow(unused)]
use clap::Parser;

/// Search for a pattern in a file and display the lines that contain it.
#[derive(Parser)]
struct Cli {
    /// The pattern to look for
    pattern: String,
    /// The path to the file to read
    path: std::path::PathBuf,
}

use anyhow::{Context, Result};
use indicatif::ProgressBar;

fn main() -> Result<()> {
    println!("Add first test");
    let args = Cli::parse();
    let content = std::fs::read_to_string(&args.path)
        .with_context(|| format!("Could not read file `{:?}`", &args.path))?;

    let pb = indicatif::ProgressBar::new(100);
    for i in 0..100 {
        pb.inc(1);
    }
    pb.finish_with_message("done");

    for line in content.lines() {
        if line.contains(&args.pattern) {
            println!("{}", line);
        }
    }


    Ok(())
}

fn answer() -> i32 {
  42
}

#[test]
fn check_answer_validity() {
    assert_eq!(answer(), 42);
}
