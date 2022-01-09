// Ejemplo de https://medium.com/@Nicholson85/method-overloading-in-ruby-22a169e704c7
public class Customer {
	public static void DisplayInfo(String firstName){
		Console.WriteLine("Their name is " + firstName);
	}

	public static void DisplayInfo(String firstName, String lastName){
		Console.WriteLine("Their name is " + firstName + " " + lastName);
	}

	public static void DisplayInfo(String firstName, String lastName, String email){
		Console.WriteLine("Their name is " + firstName + " " + lastName + " and their email address is " + email);
	}
}
