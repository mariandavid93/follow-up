package com.iquest.service;

import com.iquest.service.impl.exception.ServiceException;

import java.util.List;

/**
 * Generic service class.
 * <p>
 * Created by marian.david on 7/19/2016.
 */
public interface GenericService<T> {

    /**
     * @param object
     * @throws ServiceException
     */
    void create(T object) throws ServiceException;

    /**
     * @param object
     * @throws ServiceException
     */
    void update(T object) throws ServiceException;

    /**
     * @param id
     * @throws ServiceException
     */
    void delete(long id) throws ServiceException;

    /**
     * @param id
     * @return
     * @throws ServiceException
     */
    T find(long id) throws ServiceException;

    /**
     * @return
     * @throws ServiceException
     */
    List<T> findAll() throws ServiceException;
}
