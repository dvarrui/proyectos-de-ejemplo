// Ejemplo de https://medium.com/@Nicholson85/method-overloading-in-ruby-22a169e704c7
public class Customer {
	public static void DisplayInfo(string firstName){
		Console.WriteLine("Their name is " + firstName);
	}

	public static void DisplayInfo(string firstName, string lastName){
		Console.WriteLine("Their name is " + firstName + " " + lastName);
	}

	public static void DisplayInfo(string firstName, string lastName, string email){
		Console.WriteLine("Their name is " + firstName + " " + lastName + " and their email address is " + email);
	}
}
