package com.javatmp.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "document")
public class Document implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long documentId;
    private String documentName;
    private long documentSize;
    private String contentType;
    @Lob
    private byte[] documentContent;
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    private Long randomHash;

    /**
     * @return the documentId
     */
    public Long getDocumentId() {
        return documentId;
    }

    /**
     * @param documentId the documentId to set
     */
    public void setDocumentId(Long documentId) {
        this.documentId = documentId;
    }

    /**
     * @return the documentName
     */
    public String getDocumentName() {
        return documentName;
    }

    /**
     * @param documentName the documentName to set
     */
    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    /**
     * @return the documentSize
     */
    public long getDocumentSize() {
        return documentSize;
    }

    /**
     * @param documentSize the documentSize to set
     */
    public void setDocumentSize(long documentSize) {
        this.documentSize = documentSize;
    }

    /**
     * @return the contentType
     */
    public String getContentType() {
        return contentType;
    }

    /**
     * @param contentType the contentType to set
     */
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    /**
     * @return the documentContent
     */
    public byte[] getDocumentContent() {
        return documentContent;
    }

    /**
     * @param documentContent the documentContent to set
     */
    public void setDocumentContent(byte[] documentContent) {
        this.documentContent = documentContent;
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
     * @return the randomHash
     */
    public Long getRandomHash() {
        return randomHash;
    }

    /**
     * @param randomHash the randomHash to set
     */
    public void setRandomHash(Long randomHash) {
        this.randomHash = randomHash;
    }

}
