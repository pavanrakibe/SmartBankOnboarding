package com.smartbank.service;

public interface EmailService {
	
    void sendOtp(String toEmail, String otp);
    
}
