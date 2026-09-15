package com.smartbank.exception;

public class KycException extends RuntimeException {

    public KycException(String message) {
        super(message);
    }

    public KycException(String message, Throwable cause) {
        super(message, cause);
    }
}