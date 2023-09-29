package com.example;

import com.example.model.Room;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class Main {
  private static final Logger LOGGER = LoggerFactory.getLogger(Main.class);

  public static void main(String[] args) {
    SpringApplication.run(Main.class, args);
  }

  @Bean
  public RestTemplate restTemplate(RestTemplateBuilder builder) {
    return builder.build();
  }

  @Bean
  public CommandLineRunner run(RestTemplate restTemplate) {
    return args -> {
      LOGGER.info("Starting CLR application");
      ResponseEntity<List<Room>> rooms =
          restTemplate.exchange(
              "http://localhost:8000/api/rooms",
              HttpMethod.GET,
              null,
              new ParameterizedTypeReference<>() {});
      rooms
          .getBody()
          .forEach(
              room -> {
                LOGGER.info(room.toString());
              });
      LOGGER.info("Done CLR application");
    };
  }
}
