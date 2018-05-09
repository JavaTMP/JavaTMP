/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.domain;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author user
 */
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;
    private Long messageId;
    private String messageTitle;
    private String messageContentText;
    private Date creationDate;
    private String messageFrom;
    private String messageTo;
    private Short messageStatus;

    public Message() {
    }

    public Message(Long messageId, String messageTitle, String messageContentText, Date creationDate, String messageFrom, String messageTo, Short messageStatus) {
        this.messageId = messageId;
        this.messageTitle = messageTitle;
        this.messageContentText = messageContentText;
        this.creationDate = creationDate;
        this.messageFrom = messageFrom;
        this.messageTo = messageTo;
        this.messageStatus = messageStatus;
    }

    /**
     * @return the messageId
     */
    public Long getMessageId() {
        return messageId;
    }

    /**
     * @param messageId the messageId to set
     */
    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    /**
     * @return the messageTitle
     */
    public String getMessageTitle() {
        return messageTitle;
    }

    /**
     * @param messageTitle the messageTitle to set
     */
    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }

    /**
     * @return the messageContentText
     */
    public String getMessageContentText() {
        return messageContentText;
    }

    /**
     * @param messageContentText the messageContentText to set
     */
    public void setMessageContentText(String messageContentText) {
        this.messageContentText = messageContentText;
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
     * @return the messageFrom
     */
    public String getMessageFrom() {
        return messageFrom;
    }

    /**
     * @param messageFrom the messageFrom to set
     */
    public void setMessageFrom(String messageFrom) {
        this.messageFrom = messageFrom;
    }

    /**
     * @return the messageTo
     */
    public String getMessageTo() {
        return messageTo;
    }

    /**
     * @param messageTo the messageTo to set
     */
    public void setMessageTo(String messageTo) {
        this.messageTo = messageTo;
    }

    /**
     * @return the messageStatus
     */
    public Short getMessageStatus() {
        return messageStatus;
    }

    /**
     * @param messageStatus the messageStatus to set
     */
    public void setMessageStatus(Short messageStatus) {
        this.messageStatus = messageStatus;
    }

}
