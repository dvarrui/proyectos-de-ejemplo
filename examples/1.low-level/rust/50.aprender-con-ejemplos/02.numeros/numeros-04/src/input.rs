use std::env;
use std::process;

pub fn read_valid_number() -> i32 {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: {} NUMBER", args[0]);
        eprintln!("  El argumento NUMBER es obligatorio");
        process::exit(1);
    }

    let number: i32 = match args[1].parse() {
        Ok(n) => n,
        Err(_) => {
            eprintln!("Usage: {} NUMBER", args[0]);
            eprintln!("  El valor introducido debe ser un número entero válido");
            process::exit(1);
        }
    };

    if number < 10 || number > 20 {
        eprintln!("Usage: {} NUMBER", args[0]);
        eprintln!("  El número NUMBER debe estar entre 10 y 20");
        process::exit(1);
    }
    number
}
