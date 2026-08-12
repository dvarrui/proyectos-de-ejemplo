mod input;

fn main() {
    // A. Pedir al usuario un número entero N entre 10 y 20.
    let number = input::read_valid_number();
    println!("[DEBUG] number={}", number);

    // B. Mostrar por pantalla todos los números enteros entre el 1 y el N.
    // C. Mostrar por pantalla todos los números enteros entre el 30 y el N, en orden inverso.
}
