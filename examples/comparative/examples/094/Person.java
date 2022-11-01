public class Person {
	private String name;

	public Person(String name) {
		this.name = name;
	}

	public void speak() {
    System.out.println("My name is "+ this.name);
	}

  public static void main(String args[]) {
    Person yoda;
    yoda = new Person("Yoda");
    yoda.speak();
  }
}
