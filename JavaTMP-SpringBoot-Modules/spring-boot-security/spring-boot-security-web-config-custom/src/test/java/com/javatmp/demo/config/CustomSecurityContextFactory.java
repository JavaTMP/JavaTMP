package com.javatmp.demo.config;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.test.context.support.WithSecurityContextFactory;

public class CustomSecurityContextFactory
        implements WithSecurityContextFactory<WithCustomUser> {

    

    @Override
    public SecurityContext createSecurityContext(WithCustomUser withCustomUser) {
        SecurityContext context = SecurityContextHolder.createEmptyContext();

        UsernamePasswordAuthenticationToken a = new UsernamePasswordAuthenticationToken(withCustomUser.username(), null, null);
        context.setAuthentication(a);

        return context;
    }
}
