package com.iquest.service.impl;

import com.iquest.dao.impl.DAOException;
import com.iquest.dao.impl.UserDAOImpl;
import com.iquest.model.User;
import com.iquest.service.impl.exception.InvalidEntityException;
import com.iquest.service.impl.exception.InvalidUsernameException;
import com.iquest.service.impl.exception.ServiceException;

/**
 * This class acts like a service between controller and DAO. This class
 * verifies every input parameter and calls the proper method from DAO and
 * returns the result to controller.
 *
 * @author marian.david
 */
public class UserServiceImpl extends GenericServiceImpl<User> {

    private final String RETRIEVE_USER_EXCEPTION_MESSAGE = "User account cannot be retrieved. Please try again later.";
    private final String EMPTY_USERNAME_EXCEPTION_MESSAGE = "Username cannot be empty";
    private final String USER_NOT_FOUND_EXCEPTION_MESSAGE = "User account doesn't exist.";

    private UserDAOImpl userDAO;

    /**
     * Return a user entity by a specified username
     *
     * @param username - the username used for searching
     * @return the corespondent user entity
     * @throws ServiceException throw an exception if the user entity cannot be retrieved
     */
    public User findByUsername(String username) throws ServiceException, InvalidEntityException, InvalidUsernameException {
        validateUsernameField(username);
        User user;
        try {
            user = userDAO.findByUsername(username);
            if (user == null) {
                throw new InvalidEntityException(USER_NOT_FOUND_EXCEPTION_MESSAGE);
            }
        } catch (DAOException ex) {
            throw new ServiceException(RETRIEVE_USER_EXCEPTION_MESSAGE, ex);
        }
        return user;
    }

    /**
     * Validate username input field
     *
     * @param username the username value used for searching
     * @throws ServiceException throw an exception if the username is not valid
     */
    private void validateUsernameField(String username) throws InvalidUsernameException {
        if (username == null || username.isEmpty()) {
            throw new InvalidUsernameException(EMPTY_USERNAME_EXCEPTION_MESSAGE);
        }
    }

    public void setUserDAO(UserDAOImpl userDAO) {
        this.userDAO = userDAO;
    }

}
