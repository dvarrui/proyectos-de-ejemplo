// https://wyhaines.io/peeking-into-rust
// Implement a bubble sort.
fn sort(array: &mut Vec<u32>) {
    for i in 0..array.len() {
        for j in 0..array.len() - i - 1 {
            if array[j + 1] < array[j] {
                array.swap(j, j + 1);
            }
        }
    }
}

fn main() {
    let mut array = vec![3_u32, 5, 7, 9, 1, 0, 4, 8, 2, 6];
    sort(&mut array);
    println!("{:?}", array);
}

