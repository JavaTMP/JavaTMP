package com.javatmp.module.user;

import com.javatmp.module.country.Country;
import com.javatmp.module.dms.Document;
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

@Entity
@Table(name = "user")
public class User implements Serializable {

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

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the status
     */
    public Short getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(Short status) {
        this.status = status;
    }

    /**
     * @return the creationDate
     */
    public Date getCreationDate() {
        return creationDate;
    }

    /**
     * @param creationDate the creationDate to set
     */
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the lang
     */
    public String getLang() {
        return lang;
    }

    /**
     * @param lang the lang to set
     */
    public void setLang(String lang) {
        this.lang = lang;
    }

    /**
     * @return the theme
     */
    public String getTheme() {
        return theme;
    }

    /**
     * @param theme the theme to set
     */
    public void setTheme(String theme) {
        this.theme = theme;
    }

    /**
     * @return the birthOfDate
     */
    public Date getBirthDate() {
        return birthDate;
    }

    /**
     * @param birthOfDate the birthOfDate to set
     */
    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    /**
     * @return the countryId
     */
    public String getCountryId() {
        return countryId;
    }

    /**
     * @param countryId the countryId to set
     */
    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the profilePicDocumentId
     */
    public Long getProfilePicDocumentId() {
        return profilePicDocumentId;
    }

    /**
     * @param profilePicDocumentId the profilePicDocumentId to set
     */
    public void setProfilePicDocumentId(Long profilePicDocumentId) {
        this.profilePicDocumentId = profilePicDocumentId;
    }

    /**
     * @return the timezone
     */
    public String getTimezone() {
        return timezone;
    }

    /**
     * @param timezone the timezone to set
     */
    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }

    /**
     * @return the profilePicDocument
     */
    public Document getProfilePicDocument() {
        return profilePicDocument;
    }

    /**
     * @param profilePicDocument the profilePicDocument to set
     */
    public void setProfilePicDocument(Document profilePicDocument) {
        this.profilePicDocument = profilePicDocument;
    }

    /**
     * @return the lastAccessTime
     */
    public Date getLastAccessTime() {
        return lastAccessTime;
    }

    /**
     * @param lastAccessTime the lastAccessTime to set
     */
    public void setLastAccessTime(Date lastAccessTime) {
        this.lastAccessTime = lastAccessTime;
    }

    /**
     * @return the gender
     */
    public Short getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(Short gender) {
        this.gender = gender;
    }

    /**
     * @return the country
     */
    public Country getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(Country country) {
        this.country = country;
    }

}