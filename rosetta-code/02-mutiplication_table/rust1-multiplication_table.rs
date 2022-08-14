// compile: rustc -o a.out 

fn main() {
    let number: i32 = 10;

    for i in 1..11 {
        print!(" {:2} * {:2} = {:3}\n", i, number, i*number)
    }
}
