package com.iquest.dao.impl;

import com.iquest.config.Config;
import com.iquest.dao.GenericDAO;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Acts like a generic DAO
 * Created by marian.david on 7/19/2016.
 */

public class GenericDAOImpl<T> implements GenericDAO<T> {

    private SessionFactory sessionFactory;

    public GenericDAOImpl() {
        sessionFactory = Config.getGlobalSessionFactory();
    }

    public void create(T object) throws DAOException {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.save(object);
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            closeSession(session);
        }
    }

    public void update(T object) throws DAOException {
        Session session = null;

        try {
            session = sessionFactory.openSession();
            session.update(object);
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            closeSession(session);
        }
    }

    public void delete(T account) throws DAOException {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.delete(account);
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            closeSession(session);
        }
    }

    public T find(long id) throws DAOException {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (T) session.get(getGenericClass(), id);
        } catch (ClassNotFoundException | HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            closeSession(session);
        }
    }

    public List<T> findAll() throws DAOException {

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Criteria criteria = session.createCriteria(getGenericClass());
            return criteria.list();
        } catch (ClassNotFoundException | HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            closeSession(session);
        }
    }

    public Class<T> getGenericClass() throws ClassNotFoundException {
        Type mySuperclass = getClass().getGenericSuperclass();
        Type tType = ((ParameterizedType) mySuperclass).getActualTypeArguments()[0];
        String className = tType.toString().split(" ")[1];
        return (Class) Class.forName(className);
    }

    /**
     * Close Hibernate session
     *
     * @param session - session object to be closed
     */
    protected void closeSession(Session session) {
        if (session != null) {
            session.close();
        }
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
