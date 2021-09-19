package com.briansjavablog.accounts.service;

import com.blog.demo.webservices.accountservice.AccountDetailsRequest;
import com.blog.demo.webservices.accountservice.AccountDetailsResponse;
import com.blog.demo.webservices.accountservice.EnumAccountStatus;
import com.blog.demo.webservices.accountservice.ObjectFactory;
import com.briansdevblog.accounts.AccountService;
import com.demo.config.TestConfig;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
@ContextConfiguration(classes = {TestConfig.class})
public class AccountServiceEndpointTest {

    @Autowired
    @Qualifier("accountServiceClient")
    private AccountService accountsServiceClient;
    private AccountDetailsRequest accountDetailsRequest;

    @BeforeEach
    public void setUp() throws Exception {

        ObjectFactory objectFactory = new ObjectFactory();
        accountDetailsRequest = objectFactory.createAccountDetailsRequest();
        accountDetailsRequest.setAccountNumber("12345");
    }

    @Test
    public void testGetAccountDetails() throws Exception {

        AccountDetailsResponse response = accountsServiceClient.getAccountDetails(accountDetailsRequest);
        assertTrue(response.getAccountDetails() != null);
        assertTrue(response.getAccountDetails().getAccountNumber().equals("12345"));
        assertTrue(response.getAccountDetails().getAccountName().equals("Joe Bloggs"));
        assertTrue(response.getAccountDetails().getAccountBalance() == 3400);
        assertTrue(response.getAccountDetails().getAccountStatus().equals(EnumAccountStatus.ACTIVE));
    }

}
