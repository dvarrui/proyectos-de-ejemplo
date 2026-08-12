use std::env;
mod input;

fn main() {
    let args: Vec<String> = env::args().collect();
    let number = input::read_number(&args);
    println!("[DEBUG] number={}", number);

    // B. Mostrar por pantalla todos los números enteros entre el 1 y el N.
    // C. Mostrar por pantalla todos los números enteros entre el 30 y el N, en orden inverso.
}
