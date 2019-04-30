package com.javatmp.module.message;

import com.javatmp.module.user.User;
import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {

    private static final long serialVersionUID = 1L;
    private Long messageId;
    private String messageTitle;
    private String messageContentText;
    private Date creationDate;
    private Long fromUserId;
    private Long toUserId;
    private User fromUser;
    private User toUser;
    private Short messageStatus;

    private Long[] messageTos;

    public Message() {
    }

    public Message(Long messageId, String messageTitle, String messageContentText, Date creationDate, Long fromUser, Long toUser, Short messageStatus) {
        this.messageId = messageId;
        this.messageTitle = messageTitle;
        this.messageContentText = messageContentText;
        this.creationDate = creationDate;
        this.fromUserId = fromUser;
        this.toUserId = toUser;
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
     * @return the fromUserId
     */
    public Long getFromUserId() {
        return fromUserId;
    }

    /**
     * @param fromUserId the fromUserId to set
     */
    public void setFromUserId(Long fromUserId) {
        this.fromUserId = fromUserId;
    }

    /**
     * @return the toUserId
     */
    public Long getToUserId() {
        return toUserId;
    }

    /**
     * @param toUserId the toUserId to set
     */
    public void setToUserId(Long toUserId) {
        this.toUserId = toUserId;
    }

    /**
     * @return the fromUser
     */
    public User getFromUser() {
        return fromUser;
    }

    /**
     * @param fromUser the fromUser to set
     */
    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
    }

    /**
     * @return the toUser
     */
    public User getToUser() {
        return toUser;
    }

    /**
     * @param toUser the toUser to set
     */
    public void setToUser(User toUser) {
        this.toUser = toUser;
    }

    /**
     * @return the messageTos
     */
    public Long[] getMessageTos() {
        return messageTos;
    }

    /**
     * @param messageTos the messageTos to set
     */
    public void setMessageTos(Long[] messageTos) {
        this.messageTos = messageTos;
    }

}
