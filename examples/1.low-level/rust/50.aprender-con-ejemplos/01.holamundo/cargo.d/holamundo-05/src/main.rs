use std::io::{self, Write};
use colored::*;

fn main() {
    // A. Entrada de datos
    let mut name = String::new();
    print!("Name: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut name).expect("Error al leer");
    let name = name.trim();

    let mut age_input = String::new();
    print!("Age: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut age_input).expect("Error al leer");
    let age: u32 = age_input.trim().parse().expect("Debe ser un número");

    let mut height_input = String::new();
    print!("Height: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut height_input).expect("Error al leer");
    let height: f64 = height_input.trim().parse().expect("Debe ser un decimal");

    // B. Salida por pantalla con color
    // Rust aplica el color directamente sobre las cadenas o variables
    let colored_name = name.to_uppercase().yellow().bold();
    let colored_age = age.to_string().yellow().bold();
    let colored_height = height.to_string().yellow().bold();

    println!("El personaje {}, tiene {} años de edad y mide {} metros.", 
             colored_name, colored_age, colored_height);
}