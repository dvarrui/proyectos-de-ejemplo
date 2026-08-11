use std::env;
use std::process::exit;

fn main() {
    let args: Vec<String> = env::args().collect();
    
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

    // B. Mostrar por pantalla todos los números enteros entre el 1 y el N.
    println!("==> Números del 1 al {}", number);
    for i in 1..=number { print!("{} ", i); }

    // C. Mostrar por pantalla todos los números enteros entre el 30 y el N, en orden inverso.
    println!("\n==> Números del 30 al {} en orden inverso", number);
    for i in (number..=30).rev() { print!("{} ", i); }
    println!();
}
