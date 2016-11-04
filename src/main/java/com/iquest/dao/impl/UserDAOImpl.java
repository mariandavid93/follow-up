package com.iquest.dao.impl;

import com.iquest.model.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;


public class UserDAOImpl extends GenericDAOImpl<User> {

    /**
     * Find an user entity by a given username
     *
     * @param username - username of the user
     * @return user entity
     * @throws DAOException in case an error occurs when searching an user
     */
    public User findByUsername(String username) throws DAOException {

        Session session = null;
        try {
            session = super.getSessionFactory().openSession();
            Query query = session.createQuery("From User where username= :username");
            query.setParameter("username", username);
            List<User> users = query.list();
            User user = null;
            if (users.size() == 1) {
                user = users.get(0);
            }
            return user;
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
