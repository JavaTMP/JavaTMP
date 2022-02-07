package com.javatmp.document.main;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;

@SpringBootApplication
@Slf4j
public class JavaTmpDocumentProcessingApplication {

    public static void main(String[] args) {
        SpringApplication.run(JavaTmpDocumentProcessingApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

            Set<String> extSet = new HashSet<>();

            String baseFolderPath = "C:\\Users\\m_dar\\Downloads\\Process_Articles\\Articles1";
            Files.walk(Paths.get(baseFolderPath))
                    .filter(Files::isRegularFile)
                    .forEach(path -> {
                        try {
                            String part = path.toString().substring(baseFolderPath.length() + 1);
                            String ext = part.substring(part.lastIndexOf(".") + 1);
                            log.info("Reading file : {}, ext : {}", part, ext);
                            byte[] fileContent = new byte[] {0};
                            fileContent = Files.readAllBytes(path);
                            extSet.add(ext);
                            log.debug("file content length is : {}", fileContent.length);
                        } catch (IOException e) {
                            log.error("error", e);
                        }
                    });
            log.debug("extensions : {}", extSet);
        };
    }

}
