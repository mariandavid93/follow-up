package com.iquest.controller;

import com.iquest.service.impl.exception.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.iquest.model.ErrorResponse;

@ControllerAdvice
public class ExceptionControllerAdvice {

    @ExceptionHandler(EmptyTargetAccountException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForEmptyTargetAccountException(Exception ex) {
        return exceptionHandler(ex, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(InvalidEntityException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForEntityNotFound(Exception ex) {
        return exceptionHandler(ex, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(InsufficientAmountException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForInsufficientAmountException(Exception ex) {
        return exceptionHandler(ex, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(InvalidUsernameException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForInvalidUsernameException(Exception ex) {
        return exceptionHandler(ex, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(NegativeAmountException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForNegativeAmountException(Exception ex) {
        return exceptionHandler(ex, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(NegativeBalanceException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForNegativeBalanceException(Exception ex) {
        return exceptionHandler(ex, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(NegativeIdentifierException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForNegativeIdentifierException(Exception ex) {
        return exceptionHandler(ex, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(ServiceException.class)
    public ResponseEntity<ErrorResponse> exceptionHandlerForServiceException(Exception ex) {
        return exceptionHandler(ex, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    private ResponseEntity<ErrorResponse> exceptionHandler(Exception ex, HttpStatus status) {
        ErrorResponse error = new ErrorResponse();
        error.setMessage(ex.getMessage());
        return new ResponseEntity<>(error, status);
    }
}
