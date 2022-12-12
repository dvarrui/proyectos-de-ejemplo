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
    let pb = indicatif::ProgressBar::new(100);
    for line in content.lines() {
        pb.inc(1);
        if line.contains(pattern) {
            pb.println(format!("==> mygrep: {}", line));
        }
    }
    pb.finish_with_message("done");
}

fn answer() -> i32 {
  42
}

#[test]
fn test_answer() {
    assert_eq!(answer(), 42);
}
