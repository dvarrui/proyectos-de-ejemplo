use colored::*;
use std::env;

fn main() {
    // A. Entrada de datos por argumentos
    let args: Vec<String> = env::args().collect();

    let name = &args[1];
    let age: u32 = args[2].parse().expect("La edad debe ser un número entero");
    let height: f64 = args[3]
        .parse()
        .expect("La altura debe ser un número decimal");

    let colored_name = name.to_uppercase().yellow().bold();
    let colored_age = age.to_string().yellow().bold();
    let colored_height = height.to_string().yellow().bold();

    // B. Salida por pantalla
    print!("El personaje {}, ", colored_name);
    print!("tiene {} años de edad y ", colored_age);
    println!("mide {} metros.", colored_height);
}
