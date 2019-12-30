package com.javatmp.module.user.entity;

import com.javatmp.module.country.entity.Country;
import com.javatmp.module.dms.entity.Document;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Data;
import lombok.EqualsAndHashCode;

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
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(insertable = false, updatable = false, name = "profilePicDocumentId", referencedColumnName = "documentId")
    private Document profilePicDocument;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(insertable = false, updatable = false, name = "countryId", referencedColumnName = "countryId")
    private Country country;

    public User() {

    }

    public User(Long id) {
        this.id = id;
    }

    public User(Long id, String language) {
        this.id = id;
        this.lang = language;
    }

    public User(Long id, Short status) {
        this.id = id;
        this.status = status;
    }

    public User(Long id, Long profilePicDocumentId) {
        this.id = id;
        this.profilePicDocumentId = profilePicDocumentId;
    }

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public User(Long id, String userName, String password, String firstName, String lastName, Short status, Date birthDate,
            Date creationDate,
            String email, String lang, String theme, String countryId, String address,
            String timezone, Long profilePicDocumentId) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.status = status;
        this.birthDate = birthDate;
        this.creationDate = creationDate;
        this.email = email;
        this.lang = lang;
        this.theme = theme;
        this.countryId = countryId;
        this.address = address;
        this.timezone = timezone;
        this.profilePicDocumentId = profilePicDocumentId;
    }

    public User(Long id, String userName, String password, String firstName, String lastName, Short status, Date birthDate,
            Date creationDate, String email, String lang, String theme, String countryId, String address,
            String timezone, Long profilePicDocumentId, Long documentRandomHash) {
        this(id, userName, firstName, lastName, status, birthDate, creationDate, email, lang, theme,
                countryId, address, timezone, profilePicDocumentId, documentRandomHash);
        this.password = password;
    }

    public User(Long id, String userName, String firstName, String lastName, Short status, Date birthDate,
            Date creationDate, String email, String lang, String theme, String countryId, String address,
            String timezone, Long profilePicDocumentId, Long documentRandomHash) {
        this.id = id;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.status = status;
        this.birthDate = birthDate;
        this.creationDate = creationDate;
        this.email = email;
        this.lang = lang;
        this.theme = theme;
        this.countryId = countryId;
        this.address = address;
        this.timezone = timezone;
        this.profilePicDocumentId = profilePicDocumentId;
        this.profilePicDocument = new Document();
        this.profilePicDocument.setDocumentId(profilePicDocumentId);
        this.profilePicDocument.setRandomHash(documentRandomHash);
    }
}
