package example;

import com.google.common.io.CharStreams;

import java.io.InputStreamReader;
import java.io.IOException;
import java.io.Reader;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;

public class HelloWorld {

  public static void main(String[] args) throws URISyntaxException, IOException {
    try (Reader reader = new InputStreamReader(
        HelloWorld.class.getResourceAsStream("/world"), StandardCharsets.UTF_8)) {
      String world = CharStreams.toString(reader);
      System.out.println("Hello " + world);
    }
  }
}