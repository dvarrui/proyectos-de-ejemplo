import java.util.stream.IntStream;

public class FactorialIterativo {
	
	public static final long factorial(long numero) {
		long res = 1;
		while (numero > 1) res *= numero--;
		return res;
	}
	
	public static void main(String[] args) {
		IntStream.rangeClosed(1, 10).forEach(n -> System.out.println(n + "! = " + factorial(n)));
	}

}
