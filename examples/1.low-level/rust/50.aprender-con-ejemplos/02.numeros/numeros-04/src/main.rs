mod input;

fn main() {
    // A. Pedir al usuario un número entero N entre 10 y 20.
    let number = input::read_valid_number();

    // B. Mostrar por pantalla todos los números enteros entre el 1 y el N.
    println!("==> Números del 1 al {}", number);
    for i in 1..=number { print!("{} ", i); }

    // C. Mostrar por pantalla todos los números enteros entre el 30 y el N, en orden inverso.
    println!("\n==> Números del 30 al {} en orden inverso", number);
    for i in (number..=30).rev() { print!("{} ", i); }
    println!();
}
