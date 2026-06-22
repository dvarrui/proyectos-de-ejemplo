use std::io::{self, Write};

fn main() {
    // A. Pedir por teclado el nombre, edad y altura en metros
    
    let mut name = String::new();
    print!("Name: ");
    io::stdout().flush().unwrap();
    io::stdin()
        .read_line(&mut name)
        .expect("Error al leer nombre");
    let name = name.trim();

    let mut age_input = String::new();
    print!("Age: ");
    io::stdout().flush().unwrap();
    io::stdin()
        .read_line(&mut age_input)
        .expect("Error al leer edad");
    let age: u32 = age_input
        .trim()
        .parse()
        .expect("Por favor, introduce un número");

    let mut height_input = String::new();
    print!("Height: ");
    io::stdout().flush().unwrap();
    io::stdin()
        .read_line(&mut height_input)
        .expect("Error al leer altura");
    let height: f64 = height_input
        .trim()
        .parse()
        .expect("Por favor, introduce un número decimal");

    // B. Salida por pantalla
    println!("\nEl personaje {}, tiene {} años de edad y mide {} metros.", name, age, height);
}