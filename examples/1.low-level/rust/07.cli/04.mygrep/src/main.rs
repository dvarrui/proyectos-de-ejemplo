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

fn main() -> Result<()> {
    println!("Making code testable");
    let args = Cli::parse();
    let content = std::fs::read_to_string(&args.path)
        .with_context(|| format!("could not read file `{}`", args.path.display()))?;

    mygrep::find_matches(&content, &args.pattern, &mut std::io::stdout());

    Ok(())
}
