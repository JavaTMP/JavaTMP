/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.user.entity;

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
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "activity")
public class UserActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    @EqualsAndHashCode.Include
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

    public UserActivity() {
    }

    public UserActivity(Long id) {
        this.id = id;
    }

    public UserActivity(Long id, Date creationDate, String sessionId) {
        this.id = id;
        this.creationDate = creationDate;
        this.sessionId = sessionId;
    }
}
