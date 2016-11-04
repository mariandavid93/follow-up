package com.iquest.dao.impl;

import com.iquest.model.Account;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * @author marian.david
 */
public class AccountDAOImpl extends GenericDAOImpl<Account> {


    /**
     * Returns all accounts for a specified person's username
     *
     * @param userID - person ID
     * @return a list with accounts
     * @throws DAOException in case an error occurs when searching for all accounts by an ID
     */
    public List<Account> findAccountsByUserID(long userID) throws DAOException {
        Session session = null;
        try {
            session = super.getSessionFactory().openSession();
            List<Account> accounts =
                    session.createCriteria(Account.class).add(Restrictions.eq("userID", userID)).list();
            return accounts;
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            closeSession(session);
        }
    }

    /**
     * Returns all accounts with the current balance over a specified target
     *
     * @param balance - the specified balance
     * @return a list with accounts matching the criteria
     * @throws DAOException in case an error occurs when searching for accounts with balance over a specified target
     */
    public List<Account> findAccountsWithCurrentBalanceOverATarget(float balance) throws DAOException {
        Session session = null;
        try {
            session = super.getSessionFactory().openSession();
            List<Account> accounts =
                    session.createCriteria(Account.class).add(Restrictions.sizeGt("current_balance", (int) balance)).list();
            return accounts;
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            closeSession(session);
        }
    }

    /**
     * Returns an account having same account number and user ID
     *
     * @param accountNumber account number
     * @param userID        user ID
     * @param session       session object
     * @return an account entity
     * @throws DAOException in case an error occurs when searching for the target account
     */
    public Account findAccountByAccountNumberAndUserID(long accountNumber, long userID, Session session)
            throws DAOException {
        try {
            Account account = (Account) session.createCriteria(Account.class)
                    .add(Restrictions.and(Restrictions.eq("accountNo", accountNumber), Restrictions.eq("userID", userID)));
            return account;
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        }
    }

    /**
     * Returns an account object which have the specified account number
     *
     * @param accountNumber account number
     * @param session       session object
     * @return an account entity
     * @throws DAOException in case an error occurs when searching for the target account
     */
    public Account findAccountByAccountNumber(long accountNumber, Session session) throws DAOException {
        try {
            Account account =
                    (Account) session.createCriteria(Account.class).add(Restrictions.eq("accountNo", accountNumber));
            return account;
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        }
    }

}
