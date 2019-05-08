package com.javatmp.module.dms;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
    @Basic(fetch = FetchType.LAZY)
    private byte[] documentContent;

    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    private Long randomHash;

    private Short documentType;
    private Long parentDocumentId;
    private Short status;
    private Long createdByUserId;

    public Document() {
    }

    public Document(Long documentId, String documentName, Long documentSize,
            String contentType, Date creationDate,
            Long randomHash, Short documentType, Long parentDocumentId,
            Short status, Long createdByUserId) {

        this.documentId = documentId;

        this.documentName = documentName;

        this.documentSize = documentSize;

        this.contentType = contentType;

        this.creationDate = creationDate;

        this.randomHash = randomHash;

        this.documentType = documentType;
        this.parentDocumentId = parentDocumentId;
        this.status = status;
        this.createdByUserId = createdByUserId;

    }

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

    /**
     * @return the documentType
     */
    public Short getDocumentType() {
        return documentType;
    }

    /**
     * @param documentType the documentType to set
     */
    public void setDocumentType(Short documentType) {
        this.documentType = documentType;
    }

    /**
     * @return the parentDocumentId
     */
    public Long getParentDocumentId() {
        return parentDocumentId;
    }

    /**
     * @param parentDocumentId the parentDocumentId to set
     */
    public void setParentDocumentId(Long parentDocumentId) {
        this.parentDocumentId = parentDocumentId;
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
     * @return the createdByUserId
     */
    public Long getCreatedByUserId() {
        return createdByUserId;
    }

    /**
     * @param createdByUserId the createdByUserId to set
     */
    public void setCreatedByUserId(Long createdByUserId) {
        this.createdByUserId = createdByUserId;
    }

}
