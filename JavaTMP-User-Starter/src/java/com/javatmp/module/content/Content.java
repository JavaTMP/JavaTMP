package com.javatmp.module.content;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Content")
public class Content implements Serializable {

    private static final long serialVersionUID = 2L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long contentId;

    private String title;

    private String summaryText;

    private String contentText;

    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    private Long createdBy;

    private Short status;

    public Content() {
    }

    /**
     * @return the contentId
     */
    public Long getContentId() {
        return contentId;
    }

    /**
     * @param contentId the contentId to set
     */
    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the contentText
     */
    public String getContentText() {
        return contentText;
    }

    /**
     * @param contentText the contentText to set
     */
    public void setContentText(String contentText) {
        this.contentText = contentText;
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
     * @return the summaryText
     */
    public String getSummaryText() {
        return summaryText;
    }

    /**
     * @param summaryText the summaryText to set
     */
    public void setSummaryText(String summaryText) {
        this.summaryText = summaryText;
    }

    /**
     * @return the createdBy
     */
    public Long getCreatedBy() {
        return createdBy;
    }

    /**
     * @param createdBy the createdBy to set
     */
    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

}
