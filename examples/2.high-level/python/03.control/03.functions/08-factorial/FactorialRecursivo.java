import java.util.stream.IntStream;

public class FactorialRecursivo {

	public static final long factorial(int numero) {
		return (numero > 1) ? factorial(numero - 1) * numero : 1;
	}

	public static void main(String[] args) {
		IntStream.rangeClosed(10, 50).forEach(n -> System.out.println(n + "! = " + factorial(n)));
	}

}
