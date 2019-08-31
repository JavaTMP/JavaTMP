package com.javatmp.module.accounting;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "acctTransCtCenter")
public class AcctTransCostcenter implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "accountTransactionId")
    private Long accountTransactionId;

    @Id
    @Column(name = "costCenterId")
    private Long costCenterId;

    public AcctTransCostcenter() {
    }

    public AcctTransCostcenter(Long accountTransactionId, Long costCenterId) {
        this.accountTransactionId = accountTransactionId;
        this.costCenterId = costCenterId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (String.valueOf(this.accountTransactionId) + String.valueOf(this.costCenterId)).hashCode();
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        return false;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.accounting.Costcenter[accountTransactionId=" + this.accountTransactionId + ", costCenterId=" + this.costCenterId + "]";
    }

}
