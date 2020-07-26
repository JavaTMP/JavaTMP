package com.javatmp.demo.jpa.multi.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "user")
public class User {
    @EqualsAndHashCode.Include
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "userName")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "status")
    private Byte status;

    @Column(name = "gender")
    private Integer gender;

    @Column(name = "birthDate")
    private java.sql.Date birthDate;

    @Column(name = "countryId")
    private String countryId;

    @Column(name = "address")
    private String address;

    @Column(name = "email")
    private String email;

    @Column(name = "lang")
    private String lang;

    @Column(name = "theme")
    private String theme;

    @Column(name = "timezone")
    private String timezone;

    @Column(name = "lastAccessTime")
    private java.sql.Timestamp lastAccessTime;

    @Column(name = "profilePicDocumentId")
    private Long profilePicDocumentId;

    @Column(name = "creationDate")
    private java.sql.Timestamp creationDate;

}
