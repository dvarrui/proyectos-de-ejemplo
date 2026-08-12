use std::process::exit;

pub fn read_number(args: &[String]) -> i32 {
    if args.len() < 2 {
        eprintln!("Usage: {} NUMBER", args[0]);
        eprintln!("  El argumento NUMBER es obligatorio");
        exit(1);
    }

    let number: i32 = match args[1].parse() {
        Ok(n) => n,
        Err(_) => {
            eprintln!("Usage: {} NUMBER", args[0]);
            eprintln!("  El valor introducido debe ser un número entero válido");
            exit(1);
        }
    };

    if number < 10 || number > 20 {
        eprintln!("Usage: {} NUMBER", args[0]);
        eprintln!("  El número NUMBER debe estar entre 10 y 20");
        exit(1);
    }

    number
}