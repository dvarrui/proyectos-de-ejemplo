struct Person {
    name: String
}

impl Person {
    fn speak(self) {
        println!("My name is {:?}", self.name);
    }
}

fn main() {
    let name = String::from("Yoda");
    let yoda = Person { name };
    yoda.speak();
}
