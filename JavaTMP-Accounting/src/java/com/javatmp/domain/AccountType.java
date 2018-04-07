/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.domain;

public enum AccountType {
    ASSET(-1, +1),
    LIABILITY(+1, -1),
    INCOME(+1, -1),
    EXPENSE(-1, +1),
    OPEN(+1, +1);

    private int debitSign;
    private int creditSign;

    private AccountType(int debitSign, int creditSign) {
        this.debitSign = debitSign;
        this.creditSign = creditSign;
    }

    /**
     * @return the debitSign
     */
    public int getDebitSign() {
        return debitSign;
    }

    /**
     * @param debitSign the debitSign to set
     */
    public void setDebitSign(int debitSign) {
        this.debitSign = debitSign;
    }

    /**
     * @return the creditSign
     */
    public int getCreditSign() {
        return creditSign;
    }

    /**
     * @param creditSign the creditSign to set
     */
    public void setCreditSign(int creditSign) {
        this.creditSign = creditSign;
    }

}
