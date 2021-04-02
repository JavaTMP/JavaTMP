package com.javatmp.demo.db.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "user")
public class User implements Serializable {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userName;
    private String password;
    private String firstName;
    private String lastName;
    private Short status;
    @Temporal(TemporalType.DATE)
    private Date birthDate;
    private String countryId;
    private String address;
    private String email;
    private String lang;
    private String theme;
    private String timezone;
    private Short gender;
    private Long profilePicDocumentId;
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastAccessTime;
}
