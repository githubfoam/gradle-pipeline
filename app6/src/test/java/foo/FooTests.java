package foo;


import static org.junit.Assert.assertNotNull;

import org.junit.Test;

public class FooTest {
    @Test public void testFooHasAGreeting() {
        App classUnderTest = new Foo();
        assertNotNull("app should have a greeting", classUnderTest.getGreeting());
    }
}