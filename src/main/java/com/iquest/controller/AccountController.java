package com.iquest.controller;

import com.iquest.model.Account;
import com.iquest.service.impl.exception.*;
import com.iquest.service.impl.AccountServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * This class handles all requests which contain "/account" in their paths
 *
 * @author marian.david
 */
@RestController
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountServiceImpl accountService;
    final static Logger logger = Logger.getLogger(AccountController.class);

    /**
     * Proceed a payment from a source to a destination account
     *
     * @param userID             the ID of the user that initiate the payment
     * @param destinationAccount the destination account
     * @param amount             the amount of money
     * @param sourceAccount      the source account
     * @return
     */
    @RequestMapping(value = "/payment/{id}/{destinationAccount}/{amount}/{sourceAccount}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> proceedTransaction(@RequestParam("id") long userID,
                                                  @RequestParam("sourceAccount") long sourceAccount,
                                                  @RequestParam("destinationAccount") long destinationAccount,
                                                  @RequestParam("amount") float amount)
            throws ServiceException, NegativeIdentifierException, EmptyTargetAccountException, NegativeAmountException {
        checkTransactionPreconditions(userID, sourceAccount, destinationAccount, amount);
        accountService.proceedTransaction(userID, sourceAccount, destinationAccount, amount);
        return Collections.singletonMap("message", "Transaction was successfully proceeded.");
    }

    /**
     * Creates a new account
     *
     * @param account the account to be created
     * @return true if account was successfully created
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> createAccount(@RequestBody Account account) throws ServiceException,
            InvalidEntityException {
        checkAccount(account);
        accountService.create(account);
        return Collections.singletonMap("message", "Account was successfully created.");
    }

    /**
     * Update an existing account
     *
     * @param account account to be updated
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Map<String, String> updateAccount(@RequestBody Account account) throws ServiceException,
            InvalidEntityException {
        checkAccount(account);
        accountService.update(account);
        return Collections.singletonMap("message", "Account was successfully updated.");
    }

    @RequestMapping(value = "/get/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Account> getAccounts() throws ServiceException {
        return accountService.findAll();
    }

    @RequestMapping(value = "/get/all/{userID}", method = RequestMethod.GET)
    @ResponseBody
    public List<Account> getAccountsForUser(@PathVariable("userID") long userID) throws NegativeIdentifierException,
            ServiceException {
        checkIdentifier(userID, "User account identifier cannot be negative.");
        return accountService.getAccountsByUserID(userID);
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Account getAccount(@PathVariable("id") long accountID) throws NegativeIdentifierException, ServiceException {
        checkIdentifier(accountID, "Account identifier cannot be negative.");
        return accountService.find(accountID);
    }

    @RequestMapping(value = "/get/balance/over/{target}", method = RequestMethod.GET)
    @ResponseBody
    public List<Account> getAccountWithBalanceOverATarget(@PathVariable("target") Float target)
            throws NegativeBalanceException, ServiceException {
        return accountService.getAccountsWithCurrentBalanceOverATarget(target);
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, String> deleteAccount(@PathVariable("id") long accountID) throws InvalidEntityException,
            NegativeIdentifierException, ServiceException {
        checkIdentifier(accountID, "Account identifier cannot be negative");
        accountService.delete(accountID);
        return Collections.singletonMap("message", "Account was successfully deleted.");
    }

    private void checkTransactionPreconditions(long userID, long sourceAccount, long destinationAccount, float amount)
            throws NegativeIdentifierException, EmptyTargetAccountException, NegativeAmountException {
        checkIdentifier(userID, "User account identifier cannot be negative.");

        checkIdentifier(sourceAccount, "Source account identifier cannot be negative.");

        checkIdentifier(destinationAccount, "Destination account identifier cannot be negative.");

        if (amount <= 0) {
            throw new NegativeAmountException("Amount must to be greater than 0.");
        }
    }

    private void checkIdentifier(long id, String exceptionMessage) throws NegativeIdentifierException {
        if (id < 0) {
            throw new NegativeIdentifierException(exceptionMessage);
        }
    }

    private void checkAccount(Account account) throws InvalidEntityException {
        if (account == null) {
            throw new InvalidEntityException("Invalid account entity.");
        }
    }
}
