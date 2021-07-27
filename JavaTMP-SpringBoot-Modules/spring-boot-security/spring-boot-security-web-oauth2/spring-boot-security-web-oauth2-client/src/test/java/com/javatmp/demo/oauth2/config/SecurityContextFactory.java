package com.javatmp.demo.oauth2.config;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.test.context.support.WithSecurityContextFactory;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class SecurityContextFactory
        implements WithSecurityContextFactory<MockCustomUser> {

    @Override
    public SecurityContext createSecurityContext(
            MockCustomUser mockCustomUser) {
        SecurityContext context = SecurityContextHolder.createEmptyContext();

        Collection<? extends GrantedAuthority> authorities = Arrays
                .asList(new SimpleGrantedAuthority(
                        "read"));
        String clientId = "client_id";

        Map<String, Object> myMap = new HashMap<String, Object>() {{
            put(clientId, clientId);
        }};

        OAuth2User principal = new DefaultOAuth2User(authorities, myMap,
                clientId);

        OAuth2AuthenticationToken a = new OAuth2AuthenticationToken(principal,
                authorities, clientId);
        context.setAuthentication(a);
        return context;
    }

}
