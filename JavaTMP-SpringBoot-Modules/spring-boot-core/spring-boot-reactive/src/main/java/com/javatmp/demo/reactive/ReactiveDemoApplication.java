package com.javatmp.demo.reactive;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

import java.time.Duration;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.Stream;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class ReactiveDemoApplication {

    private final Integer threadPoolSize;
    private final Integer taskQueueSize;

    public ReactiveDemoApplication(
            @Value("${app.threadPoolSize:10}") Integer threadPoolSize,
            @Value("${app.taskQueueSize:100}") Integer taskQueueSize) {
        this.threadPoolSize = threadPoolSize;
        this.taskQueueSize = taskQueueSize;
    }

    public static void main(String[] args) {
        SpringApplication.run(ReactiveDemoApplication.class, args);
    }

    public static Integer getAnyInteger() throws Exception {
        throw new RuntimeException("An error as occured for no reason.");
    }

    // Now, comparison between the two methods
    public static void compareMonoCreationMethods() {
        Mono<Integer> fromCallable = Mono
                .fromCallable(ReactiveDemoApplication::getAnyInteger);
        // result -> Mono.error(RuntimeException("An error as occured for no reason."))

        Mono<Integer> defer = Mono.defer(() -> {
            try {
                Integer res = ReactiveDemoApplication.getAnyInteger();
                return Mono.just(res);
            } catch (Exception e) {
                return Mono.error(e);
            }
        });
        // result -> Mono.error(RuntimeException("An error as occured for no reason."))
    }

    public static void monoCreateExample() {
        Mono<Integer> nativeMono = Mono.create(callback -> {
            try {
                callback.success(getAnyInteger());
            } catch (Exception e) {
                callback.error(e);
            }
        });
    }

    public static void fluxCreateExample() {
        Flux<Double> flux = Flux.create(emitter -> {
            Random rnd = new Random();
            for (int i = 0; i <= 10; i++) emitter.next(rnd.nextDouble());
            int random = rnd.nextInt(2);
            if (random < 1) emitter.complete();
            else emitter.error(new RuntimeException(
                    "Bad luck, you had one chance out of 2 to complete the Flux"
            ));
        });
    }


    @Bean
    public Scheduler reactiveScheduler() {
        log.info("Creates a jdbcScheduler with thread pool size = {}",
                threadPoolSize);
        return Schedulers.newBoundedElastic(
                threadPoolSize, taskQueueSize, "reactiveScheduler-pool");
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            // Creates a Flux containing the values 1, 2, 3.
            Flux<Integer> integerFlux = Flux.just(1, 2, 3);

            // Creates a Flux containing "Hello", "foo" and "bar".
            Flux<String> stringFlux = Flux.just("Hello", "foo", "bar");

            // Creates a Flux from an already existing Iterable, for example a List.
            List<String> stringList = Arrays.asList("Hello", "foo", "bar");
            Flux<String> fluxFromList = Flux.fromIterable(stringList);

            // It works the same with Java Streams (which are not reactive).
            Stream<String> stringStream = stringList.stream();
            Flux<String> fluxFromStream = Flux.fromStream(stringStream);

            // Creates a flux on a range.
            Flux<Integer> rangeFlux = Flux.range(1, 5); // Flux(1, 2, 3, 4, 5)

            // Creates a flux that generates a new value every 100 ms.
            // The value is incremental, starting at 1.
            Flux<Long> intervalFlux = Flux.interval(Duration.ofMillis(100));

            // You can also create a Flux from another one, or from a Mono.
            Flux<String> fluxCopy = Flux.from(fluxFromList);

            // Creating a Mono containing "Hello World !".
            Mono<String> helloWorld = Mono.just("Hello World !");

// Creating an empty Mono
//            Mono<T> empty = Mono.empty();

// Creating a mono from a Callable
            Mono<String> helloWorldCallable = Mono
                    .fromCallable(() -> "Hello World !");
// Same with Java 8 method reference
//            Mono<User> user = Mono.fromCallable(UserService::fetchAnyUser);

// Creating a mono from a Future
//            CompletableFuture<String> helloWorldFuture = MyApi
//                    .getHelloWorldAsync();
//            Mono<String> monoFromFuture = Mono.fromFuture(helloWorldFuture);

// Creating a mono from a supplier
            Random rnd = new Random();
            Mono<Double> monoFromSupplier = Mono.fromSupplier(rnd::nextDouble);

// You can also create a mono from another one.
            Mono<Double> monoCopy = Mono.from(monoFromSupplier);
// Or from a Flux.
            Mono<Integer> monoFromFlux = Mono.from(Flux.range(1, 10));
// The above Mono contains the first value of the Flux.

            Mono.just("Hello World !").subscribe(
                    successValue -> System.out.println(successValue),
                    error -> System.err.println(error.getMessage()),
                    () -> System.out.println("Mono consumed.")
            );

            Flux.range(1, 5).subscribe(
                    successValue -> System.out.println(successValue),
                    error -> System.err.println(error.getMessage()),
                    () -> System.out.println("Flux consumed.")
            );

            // This example makes your program synchronous
            String helloWorld1 = Mono.just("Hello World!").block();
            System.out.println(helloWorld1);
// Even though this case seams stupid, it can be tempting
// to do this when making network calls.

// Now let's take a look at how we can do the same thing in
// a non-blocking way.
            Mono.just("Hello World!").subscribe(System.out::println);

            Flux<Integer> squared = Flux.range(1, 100).map(x -> x * x);
            squared.subscribe(x -> System.out.print(x + ", "));
            System.out.println();
        };
    }

}
