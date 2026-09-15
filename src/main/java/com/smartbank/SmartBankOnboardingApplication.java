package com.smartbank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SmartBankOnboardingApplication {

	public static void main(String[] args) {
		SpringApplication.run(SmartBankOnboardingApplication.class, args);
		
		System.err.println("\n========================================");
		System.err.println("     🏦 SmartBank Onboarding System");
		System.err.println("========================================");
		System.err.println("   ✅ Application Started Successfully");    
	}

}
  