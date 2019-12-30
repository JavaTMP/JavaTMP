package com.javatmp.module.accounting.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "entry")
public class Entry implements Serializable {

    private static final long serialVersionUID = 1L;
    @EqualsAndHashCode.Include
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "transactionId")
    private Long transactionId;

    @Column(name = "accountId")
    private Long accountId;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private Short status;

    @Column(name = "entryDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date entryDate;

    @Column(name = "amount")
    private BigDecimal amount;

    @Column(name = "debit")
    private BigDecimal debit;

    @Column(name = "credit")
    private BigDecimal credit;

    @Column(name = "entryAmount")
    private BigDecimal entryAmount;

    @Column(name = "accountBalance")
    private BigDecimal accountBalance;

    @Column(name = "sourceDocument")
    private Integer sourceDocument;

    @Column(name = "code")
    private String code;

    public Entry() {
    }
}
