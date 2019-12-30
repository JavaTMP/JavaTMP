package com.javatmp.module.accounting.entity;

import com.javatmp.module.accounting.entity.AccountGroup;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "accountType")
public class AccountType implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "debitSign")
    private Integer debitSign;
    @Basic(optional = false)
    @Column(name = "creditSign")
    private Integer creditSign;
    @Column(name = "reportTypeId")
    private Integer reportTypeId;
    @Transient
    private List<AccountGroup> accountGroupList;

    public AccountType() {
    }

    public AccountType(Integer id) {
        this.id = id;
    }

    public AccountType(Integer typeId, String name, Integer debitSign, Integer creditSign, Integer reportTypeId) {
        this.id = typeId;
        this.name = name;
        this.debitSign = debitSign;
        this.creditSign = creditSign;
        this.reportTypeId = reportTypeId;
    }
}
