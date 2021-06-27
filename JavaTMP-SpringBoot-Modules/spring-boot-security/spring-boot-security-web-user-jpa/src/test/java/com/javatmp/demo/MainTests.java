package com.javatmp.demo;

import com.javatmp.demo.entities.Authority;
import com.javatmp.demo.entities.User;
import com.javatmp.demo.entities.enums.EncryptionAlgorithm;
import com.javatmp.demo.repositories.ProductRepository;
import com.javatmp.demo.repositories.UserRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;
import java.util.Optional;

import static org.hamcrest.Matchers.containsString;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.unauthenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@EnableAutoConfiguration(
        exclude = {DataSourceAutoConfiguration.class,
                DataSourceTransactionManagerAutoConfiguration.class,
                HibernateJpaAutoConfiguration.class})
public class MainTests {

    @Autowired
    private MockMvc mvc;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    private ProductRepository productRepository;

    @Test
    @DisplayName("Authenticating with wrong user")
    public void loggingInWithWrongUser() throws Exception {
        mvc.perform(formLogin())
                .andExpect(unauthenticated());
    }

    @Test
    @DisplayName("Skip authentication and test the controller method")
    @WithMockUser(username = "mary", password = "12345")
    public void skipAuthenticationTest() throws Exception {
        mvc.perform(get("/main"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Hello, mary!")));
    }

    @Test
    @DisplayName("Test authentication with valid user")
    public void testAuthenticationWithValidUser() throws Exception {
        User mockUser = new User();
        mockUser.setUsername("mary");
        System.out.println("password is :" + bCryptPasswordEncoder.encode("12345"));
        mockUser.setPassword(bCryptPasswordEncoder.encode("12345"));
        mockUser.setAlgorithm(EncryptionAlgorithm.BCRYPT);

        Authority a = new Authority();
        a.setName("read");
        a.setUser(mockUser);
        mockUser.setAuthorities(Arrays.asList(new Authority[]{a}));

        when(userRepository.findByUsername("mary"))
                .thenReturn(Optional.of(mockUser));

        mvc.perform(formLogin()
                        .user("mary")
                        .password("12345"))
                .andExpect(authenticated());
    }

    @Test
    @DisplayName("Test authentication with inexistent user")
    public void testAuthenticationWithInexistentUser() throws Exception {
        when(userRepository.findByUsername("mary"))
                .thenReturn(Optional.empty());

        mvc.perform(formLogin()
                .user("mary")
                .password("12345"))
                .andExpect(unauthenticated());
    }

    @Test
    @DisplayName("Test authentication with invalid password")
    public void testAuthenticationWithInvalidPassword() throws Exception {
        User mockUser = new User();
        mockUser.setUsername("mary");
        mockUser.setPassword(bCryptPasswordEncoder.encode("55555"));
        mockUser.setAlgorithm(EncryptionAlgorithm.BCRYPT);

        Authority a = new Authority();
        a.setName("read");
        a.setUser(mockUser);
        mockUser.setAuthorities(Arrays.asList(new Authority[]{a}));

        when(userRepository.findByUsername("mary"))
                .thenReturn(Optional.of(mockUser));

        mvc.perform(formLogin()
                .user("mary")
                .password("12345"))
                .andExpect(unauthenticated());
    }
}
