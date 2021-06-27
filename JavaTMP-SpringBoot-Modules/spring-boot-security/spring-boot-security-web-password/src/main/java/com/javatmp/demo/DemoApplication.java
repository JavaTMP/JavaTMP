package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.BytesEncryptor;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.keygen.BytesKeyGenerator;
import org.springframework.security.crypto.keygen.KeyGenerators;
import org.springframework.security.crypto.keygen.StringKeyGenerator;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;

import java.security.SecureRandom;

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
            PasswordEncoder passwordEncoder = NoOpPasswordEncoder.getInstance();
            PasswordEncoder standardPasswordEncoder = new StandardPasswordEncoder();
            PasswordEncoder standardPasswordEncoder1 = new StandardPasswordEncoder("secret");

            PasswordEncoder pbkdf2PasswordEncoder = new Pbkdf2PasswordEncoder();
            PasswordEncoder pbkdf2PasswordEncoder1 = new Pbkdf2PasswordEncoder("secret");
            PasswordEncoder pbkdf2PasswordEncoder2 = new Pbkdf2PasswordEncoder("secret", 185000, 256);

            PasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            PasswordEncoder bCryptPasswordEncoder1 = new BCryptPasswordEncoder(4);

            SecureRandom secureRandom = SecureRandom.getInstanceStrong();
            PasswordEncoder bCryptPasswordEncoder2 = new BCryptPasswordEncoder(4, secureRandom);

            PasswordEncoder sCryptPasswordEncoder = new SCryptPasswordEncoder();
            // The SCryptPasswordEncoder constructor takes five parameters
            // and allows you to configure
            // CPU cost, memory cost, key length, and salt length.
            PasswordEncoder sCryptPasswordEncoder1 = new SCryptPasswordEncoder(16384, 8, 1, 32, 64);

            StringKeyGenerator stringkeyGenerator = KeyGenerators.string();
            String saltStr = stringkeyGenerator.generateKey();
            log.debug("salt generated is : {}", saltStr);

            BytesKeyGenerator byteskeyGenerator = KeyGenerators.secureRandom();
            byte[] key = byteskeyGenerator.generateKey();
            int keyLength = byteskeyGenerator.getKeyLength();
            log.debug("key is :{}, len : {}", key, keyLength);
            BytesKeyGenerator keyGenerator = KeyGenerators.secureRandom(16);
            key = keyGenerator.generateKey();
            keyLength = keyGenerator.getKeyLength();
            log.debug("key is :{}, len : {}", key, keyLength);

            BytesKeyGenerator sharedKeyGenerator = KeyGenerators.shared(16);
            byte[] key1 = sharedKeyGenerator.generateKey();
            byte[] key2 = sharedKeyGenerator.generateKey();

            log.debug("key1 is :{}, key1 is : {}", key1, key2);

            // Install Java Cryptography Extension (JCE) unlimited strength jurisdiction policy files

            String salt = KeyGenerators.string().generateKey();
            String password = "secret";
            String valueToEncrypt = "HELLO";

            BytesEncryptor e = Encryptors.standard(password, salt);
            byte[] encrypted = e.encrypt(valueToEncrypt.getBytes());
            byte[] decrypted = e.decrypt(encrypted);

            BytesEncryptor bytesEncryptor = Encryptors.stronger(password, salt);

            //
            String valueToEncrypt1 = "HELLO";
            TextEncryptor textEncryptor = Encryptors.noOpText();
            String encryptedText = textEncryptor.encrypt(valueToEncrypt1);
            log.debug("encrypted text is : {}", encryptedText);

            //
            String salt2 = KeyGenerators.string().generateKey();
            String password2 = "secret";
            String valueToEncrypt2 = "HELLO";
            log.debug("salt2 is :{} trim: {}", salt2);
            TextEncryptor textEncryptor1 = Encryptors.text(password2, salt2);
            String encrypt = textEncryptor1.encrypt(valueToEncrypt2);
            String decrypt = textEncryptor1.decrypt(encrypt);
            log.debug("TextEncryptor encrypted is :{}, decrypted:{}", encrypt, decrypt);

            salt = KeyGenerators.string().generateKey();
            password = "secret";
            valueToEncrypt = "HELLO";

            TextEncryptor e1 =
                    Encryptors.queryableText(password, salt);
            String encrypted1 = e1.encrypt(valueToEncrypt);
            String encrypted2 = e1.encrypt(valueToEncrypt);

        };
    }

}
