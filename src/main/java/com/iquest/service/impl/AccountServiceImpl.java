package com.iquest.service.impl;

import com.iquest.config.Config;
import com.iquest.dao.impl.DAOException;
import com.iquest.dao.impl.AccountDAOImpl;
import com.iquest.dao.impl.UserDAOImpl;
import com.iquest.model.Account;
import com.iquest.model.User;
import com.iquest.service.impl.exception.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;


/**
 * This class acts like a service between controller and DAO. This class
 * verifies every input parameter and calls the proper method from DAO and
 * returns the result to controller.
 *
 * @author marian.david
 */
public class AccountServiceImpl extends GenericServiceImpl<Account> {

    private final String TRANSACTION_EXCEPTION_MESSAGE = "Transaction cannot be proceeded.";
    private final String RETRIEVE_ACCOUNT_EXCEPTION_MESSAGE = "Accounts cannot be retrieved.";
    private final String USER_ACCOUNT_NOT_FOUND_EXCEPTION_MESSAGE = "User account doesn't exist.";
    private final String ACCOUNT_NOT_FOUND_EXCEPTION_MESSAGE = "Account not found.";
    private final String INSUFFICIENT_FOUNDS_EXCEPTION_MESSAGE = "Insufficient founds. Operation cannot be proceeded.";
    private final String NEGATIVE_BALANCE_EXCEPTION_MESSAGE = "Negative account balance.";

    private SessionFactory sessionFactory;
    private AccountDAOImpl accountDAO;
    private UserDAOImpl userDAO;

    public AccountServiceImpl() {
        sessionFactory = Config.getGlobalSessionFactory();
    }

    /**
     * Proceed a transaction between two accounts
     *
     * @param userID             - the ID of user that initiates the transaction
     * @param sourceAccount      - source account number
     * @param amount             - amount of money
     * @param destinationAccount - destination account number
     * @throws ServiceException throw an exception if the transaction cannot be proceeded
     */
    public void proceedTransaction(long userID, long sourceAccount, long destinationAccount, float amount)
            throws ServiceException {
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();

            User user = userDAO.find(userID);
            checkUser(user);

            tx = session.beginTransaction();

            Account source = accountDAO.findAccountByAccountNumberAndUserID(sourceAccount, userID, session);
            checkAccount(source);

            Account destination = accountDAO.findAccountByAccountNumber(destinationAccount, session);
            checkAccount(destination);

            updateAmount(source, destination, amount);
            session.update(source);
            session.update(destination);
            tx.commit();
        } catch (DAOException ex) {
            if (tx != null) {
                tx.rollback();
            }
            throw new ServiceException(TRANSACTION_EXCEPTION_MESSAGE, ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    /**
     * Return all account corresponded to an user ID
     *
     * @param userID - the ID of user
     * @return a list of accounts entity
     * @throws ServiceException in case an error occurs when searching the user accounts.
     */
    public List<Account> getAccountsByUserID(long userID) throws ServiceException {
        try {
            return accountDAO.findAccountsByUserID(userID);
        } catch (DAOException ex) {
            throw new ServiceException(RETRIEVE_ACCOUNT_EXCEPTION_MESSAGE, ex);
        }
    }

    /**
     * Returns all accounts which have the current balance over a specified target.
     *
     * @param balance the balance used for filtering
     * @return a list of accounts
     * @throws ServiceException in case an error occurs during account filtering.
     */
    public List<Account> getAccountsWithCurrentBalanceOverATarget(float balance) throws NegativeBalanceException,
            ServiceException {
        validateBalance(balance);
        try {
            return accountDAO.findAccountsWithCurrentBalanceOverATarget(balance);
        } catch (DAOException ex) {
            throw new ServiceException(RETRIEVE_ACCOUNT_EXCEPTION_MESSAGE, ex);
        }
    }

    private void checkUser(User user) throws ServiceException {
        if (user == null) {
            throw new ServiceException(USER_ACCOUNT_NOT_FOUND_EXCEPTION_MESSAGE);
        }
    }

    private void checkAccount(Account account) throws ServiceException {
        if (account == null) {
            throw new ServiceException(ACCOUNT_NOT_FOUND_EXCEPTION_MESSAGE);
        }
    }

    private void updateAmount(Account source, Account destination, float amount) throws ServiceException {
        float sourceAmount = source.getCurrentBalance();
        validateRemainingAmount(sourceAmount, amount);
        source.setCurrentBalance(sourceAmount - amount);
        float destinationAmount = destination.getCurrentBalance();
        destination.setCurrentBalance(destinationAmount + amount);
    }

    private void validateRemainingAmount(float currentAmount, float transferAmount) throws ServiceException {
        if (currentAmount - transferAmount < 0) {
            throw new ServiceException(INSUFFICIENT_FOUNDS_EXCEPTION_MESSAGE);
        }
    }

    private void validateBalance(float balance) throws ServiceException {
        if (balance <= 0) {
            throw new ServiceException(NEGATIVE_BALANCE_EXCEPTION_MESSAGE);
        }
    }

    public void setAccountDAO(AccountDAOImpl accountDAO) {
        this.accountDAO = accountDAO;
    }

    public void setUserDAO(UserDAOImpl userDAO) {
        this.userDAO = userDAO;
    }
}
