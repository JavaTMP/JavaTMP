package com.javatmp.demo.rest.openapi;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.reactive.server.WebTestClient;

import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
import static org.springframework.http.HttpStatus.UNPROCESSABLE_ENTITY;
import static org.springframework.http.MediaType.APPLICATION_JSON;

@SpringBootTest(webEnvironment = RANDOM_PORT)
class FluxRestAPITests {

  @Autowired private WebTestClient client;
  private static final int PRODUCT_ID_OK = 1;
  private static final int PRODUCT_ID_NOT_FOUND = 2;
  private static final int PRODUCT_ID_INVALID = 3;
  @BeforeEach
  void setUp() {

  }

  @Test
  void getProductById() {

    client.get()
      .uri("/product-composite/" + PRODUCT_ID_OK)
      .accept(APPLICATION_JSON)
      .exchange()
      .expectStatus().isOk()
      .expectHeader().contentType(APPLICATION_JSON)
      .expectBody()
        .jsonPath("$.productId").isEqualTo(PRODUCT_ID_OK)
        .jsonPath("$.recommendations.length()").isEqualTo(1)
        .jsonPath("$.reviews.length()").isEqualTo(1);
  }

  @Test
  void getProductNotFound() {

    client.get()
      .uri("/product-composite/" + PRODUCT_ID_NOT_FOUND)
      .accept(APPLICATION_JSON)
      .exchange()
      .expectStatus().isNotFound()
      .expectHeader().contentType(APPLICATION_JSON)
      .expectBody()
        .jsonPath("$.path").isEqualTo("/product-composite/" + PRODUCT_ID_NOT_FOUND)
        .jsonPath("$.message").isEqualTo("NOT FOUND: " + PRODUCT_ID_NOT_FOUND);
  }

  @Test
  void getProductInvalidInput() {

    client.get()
      .uri("/product-composite/" + PRODUCT_ID_INVALID)
      .accept(APPLICATION_JSON)
      .exchange()
      .expectStatus().isEqualTo(UNPROCESSABLE_ENTITY)
      .expectHeader().contentType(APPLICATION_JSON)
      .expectBody()
        .jsonPath("$.path").isEqualTo("/product-composite/" + PRODUCT_ID_INVALID)
        .jsonPath("$.message").isEqualTo("INVALID: " + PRODUCT_ID_INVALID);
  }
}
