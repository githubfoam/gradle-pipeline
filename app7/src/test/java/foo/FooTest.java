package foo;


import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class FooTest {

	private Foo subject;

	@Before
	public void setup() {
		subject = new Foo();
	}
	
	@Test
	public void testGetMessage() {
		assertEquals("Hello World!", subject.getMessage(false));
	}
	
}