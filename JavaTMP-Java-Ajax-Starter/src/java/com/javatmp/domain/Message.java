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
    private Long fromUser;
    private Long toUser;
    private Short messageStatus;

    public Message() {
    }

    public Message(Long messageId, String messageTitle, String messageContentText, Date creationDate, Long fromUser, Long toUser, Short messageStatus) {
        this.messageId = messageId;
        this.messageTitle = messageTitle;
        this.messageContentText = messageContentText;
        this.creationDate = creationDate;
        this.fromUser = fromUser;
        this.toUser = toUser;
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

    /**
     * @return the fromUser
     */
    public Long getFromUser() {
        return fromUser;
    }

    /**
     * @param fromUser the fromUser to set
     */
    public void setFromUser(Long fromUser) {
        this.fromUser = fromUser;
    }

    /**
     * @return the toUser
     */
    public Long getToUser() {
        return toUser;
    }

    /**
     * @param toUser the toUser to set
     */
    public void setToUser(Long toUser) {
        this.toUser = toUser;
    }

}
