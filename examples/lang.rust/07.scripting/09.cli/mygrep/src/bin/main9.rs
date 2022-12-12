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

    find_matches(&content, &args.pattern);
    Ok(())
}

fn find_matches(content: &str, pattern: &str) {
    for line in content.lines() {
        if line.contains(pattern) {
            println!("{}", line);
        }
    }
}

fn answer() -> i32 {
  42
}

#[test]
fn test_answer() {
    assert_eq!(answer(), 42);
}
