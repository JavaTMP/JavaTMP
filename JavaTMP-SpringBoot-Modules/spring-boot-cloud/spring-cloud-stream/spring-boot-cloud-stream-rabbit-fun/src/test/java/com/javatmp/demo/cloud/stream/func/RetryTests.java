package com.javatmp.demo.cloud.stream.func;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.cloud.stream.binder.test.InputDestination;
import org.springframework.cloud.stream.binder.test.OutputDestination;
import org.springframework.cloud.stream.binder.test.TestChannelBinderConfiguration;
import org.springframework.context.annotation.Import;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.GenericMessage;

import javax.validation.ValidationException;

import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.*;

@SpringBootTest
//@ExtendWith(MockitoExtension.class)
@Import(TestChannelBinderConfiguration.class)
public class RetryTests {

  @Autowired
  private InputDestination inputDestination;
  @Autowired
  private OutputDestination outputDestination;

  @Value("${spring.cloud.stream.bindings.calculateNthPrime-in-0.consumer.max-attempts}")
  private int retryAttempts;

  @MockBean
  private PrimeNumberService primeNumberService;

  @Test
  void testFailureRetries() {
    when(primeNumberService.nthPrime(anyInt())).thenThrow(RuntimeException.class);

    Message<Integer> message = new GenericMessage<>(20);
    inputDestination.send(message);

    Message<byte[]> output = outputDestination.receive();
    Assertions.assertThat(output).as("Validating empty output, which indicates no message").isNull();

    verify(primeNumberService, times(retryAttempts)).nthPrime(anyInt());
  }

  @Test
  void testFailureDoesNotRetry() {
    when(primeNumberService.nthPrime(anyInt())).thenThrow(ValidationException.class);

    Message<Integer> message = new GenericMessage<>(20);
    inputDestination.send(message);

    Message<byte[]> output = outputDestination.receive();
    Assertions.assertThat(output).as("Validating empty output, which indicates no message").isNull();

    verify(primeNumberService, times(1)).nthPrime(anyInt());
  }

}
