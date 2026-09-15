package com.smartbank.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler {

	
	
	
    @ExceptionHandler(KycValidationException.class)
    public String handleKycValidationException(
            KycValidationException ex,
            Model model) {

        System.err.println("================================");
        System.err.println(ex.getMessage());
        System.err.println("================================");

        model.addAttribute("activeMenu", "completekyc");
        model.addAttribute("errorMessage", ex.getMessage());

        return "user/complete-kyc";
    }
    
    
    
    
    
    @ExceptionHandler(CustomerException.class)
    public String handleCustomerException(
            CustomerException ex,
            Model model) {

        // Log error
        ex.printStackTrace();

        // Message for JSP
        model.addAttribute(
                "errorMessage",
                ex.getMessage()
        );

        // Empty customer list
        model.addAttribute(
                "customers",
                java.util.Collections.emptyList()
        );

        // Pagination defaults
        model.addAttribute(
                "currentPage",
                0
        );

        model.addAttribute(
                "pageSize",
                5
        );

        model.addAttribute(
                "totalPages",
                0
        );

        model.addAttribute(
                "totalElements",
                0
        );

        // Active menu
        model.addAttribute(
                "activeMenu",
                "customer"
        );

        // Return same JSP
        return "admin/admin_customerd_list";
    }
    
    
    
    
    
    
    
    
    
    @ExceptionHandler(KycException.class)
    public String handleKycException(
            KycException ex,
            Model model) {

        // Log error
        ex.printStackTrace();

        // Error message for JSP
        model.addAttribute(
                "errorMessage",
                ex.getMessage()
        );

        // Empty KYC list
        model.addAttribute(
                "kycList",
                java.util.Collections.emptyList()
        );

        // Pagination defaults
        model.addAttribute(
                "currentPage",
                0
        );

        model.addAttribute(
                "pageSize",
                5
        );

        model.addAttribute(
                "totalPages",
                0
        );

        model.addAttribute(
                "totalElements",
                0
        );

        // Active menu
        model.addAttribute(
                "activeMenu",
                "kyc"
        );

        // Return same JSP
        return "admin/pending_application";
    }
    
    
    
    
}