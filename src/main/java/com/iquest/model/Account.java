package com.iquest.model;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.OneToOne;
import java.io.Serializable;

/**
 * Account entity
 *
 * @author marian.david
 */
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region = "account")
public class Account implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    @OneToOne
    private User user;
    private String accountNo;
    private float initialBalance;
    private float currentBalance;
    private float economyBalance;

    public Account() {
    }

    protected Account(String accountNo, User user, float initialbalance, float currentbalance, float economybalance) {
        this.accountNo = accountNo;
        this.user = user;
        this.initialBalance = initialbalance;
        this.currentBalance = currentbalance;
        this.economyBalance = economybalance;
    }

    protected Account(int id, String accountNo, User user, float initialbalance, float currentbalance,
                      float economybalance) {
        this(accountNo, user, initialbalance, currentbalance, economybalance);
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public float getInitialBalance() {
        return initialBalance;
    }

    public void setInitialBalance(float balance) {
        this.initialBalance = balance;
    }

    public float getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(float currentBalance) {
        this.currentBalance = currentBalance;
    }

    public float getEconomyBalance() {
        return economyBalance;
    }

    public void setEconomyBalance(float economyBalance) {
        this.economyBalance = economyBalance;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Account [id=" + id + ", accountNo=" + accountNo + ", initialBalance=" + initialBalance
                + ", currentBalance=" + currentBalance + ", economyBalance=" + economyBalance + "]";
    }
}
