package com.javatmp.demo.bitcoin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            int x = 0x443b04;
            ByteOrder byteOrder = ByteOrder.nativeOrder();

            System.out.println(byteOrder);   //LITTLE_ENDIAN

            ByteBuffer bb = ByteBuffer.allocate(4);
            bb.order(ByteOrder.LITTLE_ENDIAN);
            System.out.println("Default Byte Order: " + bb.order());
            bb.putInt(x);
            bb.flip();
            showByteOrder(bb);
        };
    }

    public static void showByteOrder(ByteBuffer bb) {
        System.out.println("Byte Order: " + bb.order());
        while (bb.hasRemaining()) {
            System.out.print(bb.get() + "  ");
        }
        System.out.println();
    }

}
