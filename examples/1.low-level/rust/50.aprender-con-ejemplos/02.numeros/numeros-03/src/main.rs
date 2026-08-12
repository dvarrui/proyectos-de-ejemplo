use std::env;
mod input;

fn main() {
    let args: Vec<String> = env::args().collect();    
    let number = input::read_number(&args);

    // B. Mostrar por pantalla todos los números enteros entre el 1 y el N.
    println!("==> Números del 1 al {}", number);
    for i in 1..=number {
        print!("{} ", i);
    }
    println!();

    // C. Mostrar por pantalla todos los números enteros entre el 30 y el N, en orden inverso.
}
