package foo;

/**
 * Foo class
 */
@SuppressWarnings("PMD.TooManyMethods")
public class Foo {
    public String getGreeting() {
        return "Hello world.";
    }

    // Example of suppressing SystemPrintln
    @SuppressWarnings("PMD.SystemPrintln")
    public static void main(String[] args) {
        System.out.println(new Foo().getGreeting());
    }
}