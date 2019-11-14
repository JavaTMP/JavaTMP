package com.javatmp.module.accounting;

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
@Table(name = "accountGroup")
public class AccountGroup implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Transient
    private AccountType type;
    @Column(name = "accountType")
    private Integer accountType;
    @Transient
    private List<Account> accountList;

    public AccountGroup() {
    }

    public AccountGroup(Integer id) {
        this.id = id;
    }

    public AccountGroup(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
