package com.iquest.service.impl;

import com.iquest.dao.impl.DAOException;
import com.iquest.dao.impl.GenericDAOImpl;
import com.iquest.service.GenericService;
import com.iquest.service.impl.exception.ServiceException;

import java.util.List;

/**
 * Created by marian.david on 7/19/2016.
 */
public class GenericServiceImpl<T> implements GenericService<T> {

    private final String ENTITY_NOT_FOUND_EXCEPTION_MESSAGE = "Entity not found.";
    private final String CREATE_EXCEPTION_MESSAGE = "Entity cannot be created. Please try again later.";
    private final String UPDATE_EXCEPTION_MESSAGE = "Entity cannot be updated. Please try again later.";
    private final String DELETE_EXCEPTION_MESSAGE = "Entity cannot be deleted. Please try again later.";
    private final String FIND_ENTITY_EXCEPTION_MESSAGE = "Entity not found.";
    private final String FIND_ALL_EXCEPTION_MESSAGE = "Entities list cannot be retrieved. Please try again " +
            "later";

    private GenericDAOImpl<T> genericDAO;

    public GenericServiceImpl() {
        genericDAO = new GenericDAOImpl<>();
    }

    @Override
    public void create(T object) throws ServiceException {
        try {
            genericDAO.create(object);
        } catch (DAOException ex) {
            throw new ServiceException(CREATE_EXCEPTION_MESSAGE, ex);
        }
    }

    @Override
    public void update(T object) throws ServiceException {
        try {
            genericDAO.update(object);
        } catch (DAOException ex) {
            throw new ServiceException(UPDATE_EXCEPTION_MESSAGE, ex);
        }
    }

    @Override
    public void delete(long id) throws ServiceException {
        try {
            T object = genericDAO.find(id);
            if (object == null) {
                throw new ServiceException(ENTITY_NOT_FOUND_EXCEPTION_MESSAGE);
            }
            genericDAO.delete(object);
        } catch (DAOException ex) {
            throw new ServiceException(DELETE_EXCEPTION_MESSAGE, ex);
        }
    }

    @Override
    public T find(long id) throws ServiceException {
        T object;
        try {
            object = genericDAO.find(id);
        } catch (DAOException ex) {
            throw new ServiceException(FIND_ENTITY_EXCEPTION_MESSAGE, ex);
        }
        return object;

    }

    @Override
    public List<T> findAll() throws ServiceException {
        try {
            return genericDAO.findAll();
        } catch (DAOException ex) {
            throw new ServiceException(FIND_ALL_EXCEPTION_MESSAGE, ex);
        }
    }
}
