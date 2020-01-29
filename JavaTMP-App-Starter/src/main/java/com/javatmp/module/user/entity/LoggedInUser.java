package com.javatmp.module.user.entity;

import java.util.Collection;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;

public class LoggedInUser extends org.springframework.security.core.userdetails.User {

    @Getter
    private final User user;

    public LoggedInUser(User user, Collection<? extends GrantedAuthority> authrities) {
        super(user.getUserName(), user.getPassword(), authrities);
        this.user = user;
    }

}
