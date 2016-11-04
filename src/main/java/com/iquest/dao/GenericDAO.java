package com.iquest.dao;

import com.iquest.dao.impl.DAOException;

import java.util.List;

/**
 * Acts like a generic DAO.
 * <p>
 * Created by marian.david on 7/19/2016.
 */
public interface GenericDAO<T> {

    /**
     * Creates an entity
     *
     * @param object the entity to be created
     * @throws DAOException in case an error occurs when creating a new entry in database
     */
    void create(T object) throws DAOException;

    /**
     * Updates an entity
     *
     * @param object the object to be updated
     * @throws DAOException in case an error occurs when updating an entry in database.
     */
    void update(T object) throws DAOException;

    /**
     * Deletes an entity
     *
     * @param object the object to be deleted
     * @throws DAOException in case an error occurs when deleting an entry from database.
     */
    void delete(T object) throws DAOException;

    /**
     * Returns an entity by ID
     *
     * @param id the entity ID
     * @return the founded entity
     * @throws DAOException in case an error occurs when searching an entry by primary ID.
     */
    T find(long id) throws DAOException;

    /**
     * Retrieves all entities from database
     *
     * @return a list with all entities from DB
     * @throws DAOException in case an error occurs when retrieving all database entries.
     */
    List<T> findAll() throws DAOException;
}
