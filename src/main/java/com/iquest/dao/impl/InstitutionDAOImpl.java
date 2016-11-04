package com.iquest.dao.impl;

import com.iquest.model.Institution;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class InstitutionDAOImpl extends GenericDAOImpl<Institution> {

    /**
     * Get all institutions with a specified name
     *
     * @param name - the institution name
     * @return a list with institutions that fit with the specified name
     * @throws DAOException in case an error occurs when searching an institution
     */
    public List<Institution> getInstitutionsByName(String name) throws DAOException {
        Session session = null;
        try {
            session = super.getSessionFactory().openSession();
            List<Institution> institutions =
                    session.createCriteria(Institution.class).add(Restrictions.eq("name", name)).list();
            return institutions;
        } catch (HibernateException ex) {
            throw new DAOException(ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
