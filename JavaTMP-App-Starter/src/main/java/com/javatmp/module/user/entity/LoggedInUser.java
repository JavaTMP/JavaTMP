package com.javatmp.module.user.entity;

import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;

/**
 *
 * @author JavaTMP
 */
public class LoggedInUser extends org.springframework.security.core.userdetails.User {

    private final User user;

    public LoggedInUser(User user, Collection<? extends GrantedAuthority> authrities) {
        super(user.getUserName(), user.getPassword(), authrities);
        this.user = user;
    }

}
