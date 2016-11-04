package com.iquest.service.impl;


import com.iquest.dao.impl.DAOException;
import com.iquest.dao.impl.InstitutionDAOImpl;
import com.iquest.model.Institution;
import com.iquest.service.impl.exception.ServiceException;

import java.util.List;

/**
 * This class acts like a service between controller and DAO. This class
 * verifies every input parameter and calls the proper method from DAO and
 * returns the result to controller.
 *
 * @author marian.david
 */
public class InstitutionServiceImpl extends GenericServiceImpl<Institution> {

    private final String RETRIEVE_INSTITUTIONS_EXCEPTION_MESSAGE = "Institutions cannot be retrieved. Please try " +
            "again later";

    private InstitutionDAOImpl institutionDAO;

    /**
     * Returns all institution witch match with a specified name
     *
     * @param name - the part of institution name after the filter is proceed
     * @return a list with institutions entity
     * @throws ServiceException throw an exception if the institution cannot be retrieved
     */
    public List<Institution> getInstitutionsByName(String name) throws ServiceException {
        try {
            List<Institution> institutions = institutionDAO.getInstitutionsByName(name);
            return institutions;
        } catch (DAOException ex) {
            throw new ServiceException(RETRIEVE_INSTITUTIONS_EXCEPTION_MESSAGE, ex);
        }
    }

    public void setInstitutionDAO(InstitutionDAOImpl institutionDAO) {
        this.institutionDAO = institutionDAO;
    }
}
