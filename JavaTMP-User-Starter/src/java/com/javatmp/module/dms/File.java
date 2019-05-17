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
@Table(name = "file")
public class File implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fileName;

    private String contentType;

    private Long documentId;

    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    private Long randomHash;

    private Short fileType;
    private Long parentId;
    private Short status;
    private Long createdByUserId;

    public File() {
    }

    public File(Long id, String name,
            String contentType, Long documentId, Date creationDate,
            Long randomHash, Short documentType, Long parentId,
            Short status, Long createdByUserId) {

        this.id = id;
        this.fileName = name;
        this.contentType = contentType;
        this.documentId = documentId;
        this.creationDate = creationDate;
        this.randomHash = randomHash;
        this.fileType = documentType;
        this.parentId = parentId;
        this.status = status;
        this.createdByUserId = createdByUserId;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getRandomHash() {
        return randomHash;
    }

    public void setRandomHash(Long randomHash) {
        this.randomHash = randomHash;
    }

    public Short getFileType() {
        return fileType;
    }

    public void setFileType(Short fileType) {
        this.fileType = fileType;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Long getCreatedByUserId() {
        return createdByUserId;
    }

    public void setCreatedByUserId(Long createdByUserId) {
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

}
