fn main() {
    let values = [2,5,7,1,0,9];

    println!("iter: {:?}", values.iter());
    for value in values.iter() {
    	println!("Value: {}", value);
    }
    println!("iter: {:?}", values.iter());
}
