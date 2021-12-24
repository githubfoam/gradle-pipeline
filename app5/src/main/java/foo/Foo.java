package foo;

/**
 * Foo class
 */
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Foo {

	public static void main(String[] args) {
		SpringApplication.run(Foo.class, args);
	}
}