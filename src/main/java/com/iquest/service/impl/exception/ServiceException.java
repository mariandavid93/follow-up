package com.iquest.service.impl.exception;

/**
 * Created by marian.david on 7/18/2016.
 */
public class ServiceException extends Exception {

    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }

}
