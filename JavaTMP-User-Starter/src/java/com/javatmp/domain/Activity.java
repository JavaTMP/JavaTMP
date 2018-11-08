/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Mohamed
 */
@Entity
@Table(name = "activity")
public class Activity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;

    @Basic(optional = false)
    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @Column(name = "userId")
    private Long userId;

    @Column(name = "sessionId")
    private String sessionId;

    @Column(name = "IPaddress")
    private String iPaddress;

    @Column(name = "timeLast")
    private Long timeLast;

    @Column(name = "actionType")
    private String actionType;

    @Column(name = "actionId")
    private String actionId;

    @Column(name = "parentActId")
    private Long parentActId;

    public Activity() {
    }

    public Activity(Long id) {
        this.id = id;
    }

    public Activity(Long id, Date creationDate, String sessionId) {
        this.id = id;
        this.creationDate = creationDate;
        this.sessionId = sessionId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getIPaddress() {
        return iPaddress;
    }

    public void setIPaddress(String iPaddress) {
        this.iPaddress = iPaddress;
    }

    public Long getTimeLast() {
        return timeLast;
    }

    public void setTimeLast(Long timeLast) {
        this.timeLast = timeLast;
    }

    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }

    public String getActionId() {
        return actionId;
    }

    public void setActionId(String actionId) {
        this.actionId = actionId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Activity)) {
            return false;
        }
        Activity other = (Activity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "testingfakedatagenerate.Activity[ id=" + id + " ]";
    }

    /**
     * @return the parentActId
     */
    public Long getParentActId() {
        return parentActId;
    }

    /**
     * @param parentActId the parentActId to set
     */
    public void setParentActId(Long parentActId) {
        this.parentActId = parentActId;
    }

}
