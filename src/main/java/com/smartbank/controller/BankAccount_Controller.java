package com.smartbank.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smartbank.dto.BankAccount_Dto;
import com.smartbank.dto.User_Dto;
import com.smartbank.service.BankAccount_Service;

@Controller
@RequestMapping("/admin/bank-account")
public class BankAccount_Controller {


    @Autowired
    private BankAccount_Service bankAccount_Service;


    // =====================================================
    // BANK ACCOUNT PAGE
    // =====================================================
    @GetMapping
    public String bankAccounts(

            @RequestParam(
                    value = "page",
                    defaultValue = "0"
            )
            int page,

            Model model) {


        // -----------------------------------------
        // Prevent negative page
        // -----------------------------------------

        if (page < 0) {
            page = 0;
        }


        // -----------------------------------------
        // Records per page
        // -----------------------------------------

        int pageSize = 40;


        // -----------------------------------------
        // Pageable
        // -----------------------------------------

        Pageable pageable =
                PageRequest.of(
                        page,
                        pageSize,
                        Sort.by(
                                Sort.Direction.DESC,
                                "createdAt"
                        )
                );


        // -----------------------------------------
        // Fetch bank accounts
        // -----------------------------------------

        Page<BankAccount_Dto> accountPage =
                bankAccount_Service
                        .getAllBankAccounts(
                                pageable
                        );
        
        
        
        long totalAccounts =
                bankAccount_Service.getTotalBankAccounts();

        long activeAccounts =
                bankAccount_Service.getActiveBankAccounts();

        long pendingAccounts =
                bankAccount_Service.getPendingBankAccounts();

        long closedAccounts =
                bankAccount_Service.getClosedBankAccounts();
        
        
        model.addAttribute("totalAccounts", totalAccounts);

        model.addAttribute("activeAccounts", activeAccounts);

        model.addAttribute("pendingAccounts", pendingAccounts);

        model.addAttribute("closedAccounts", closedAccounts);
        
        
        
        List<User_Dto> customers =
                bankAccount_Service.getVerifiedCustomers();

        model.addAttribute("customers", customers);

        // -----------------------------------------
        // Model
        // -----------------------------------------

        model.addAttribute(
                "accountPage",
                accountPage
        );


        model.addAttribute(
                "currentPage",
                page
        );


        model.addAttribute(
                "pageSize",
                pageSize
        );


        model.addAttribute(
                "totalPages",
                accountPage.getTotalPages()
        );


        model.addAttribute(
                "totalAccounts",
                accountPage.getTotalElements()
        );


        return "admin/bank_account";
    }
    
    
    
    
    
    
    
    
    

    // =====================================================
    // CREATE BANK ACCOUNT
    // =====================================================

    @PostMapping("/create")
    public String createBankAccount(
            @ModelAttribute BankAccount_Dto dto,
            RedirectAttributes redirectAttributes) {


        try {


            // Create account
            BankAccount_Dto savedAccount =
                    bankAccount_Service
                            .createBankAccount(dto);


            // Success message
            redirectAttributes
                    .addFlashAttribute(
                            "successMessage",
                            "Bank account created successfully. Account Number: "
                            + savedAccount.getAccountNumber()
                    );


        } catch (Exception e) {


            redirectAttributes
                    .addFlashAttribute(
                            "errorMessage",
                            e.getMessage()
                    );

        }


        return "redirect:/admin/bank-account";
    }
    
    
    
    
    @GetMapping("/edit_bank_account/{accountId}")
    public String editBankAccount(
            @PathVariable("accountId") Integer accountId,
            Model model) {

        BankAccount_Dto account =
                bankAccount_Service
                        .getBankAccountById(accountId);

        if (account == null) {

            return "redirect:/admin/bank-account";
        }

        model.addAttribute(
                "account",
                account
        );

        return "admin/edit_bank_account";
    }

    
    
    
    
    
    @PostMapping("/update")
    public String updateBankAccount(
            @ModelAttribute BankAccount_Dto dto,
            RedirectAttributes redirectAttributes) {


        try {

            bankAccount_Service
                    .updateBankAccount(dto);


            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Bank account updated successfully."
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    "Failed to update bank account: "
                            + e.getMessage()
            );
        }


        return "redirect:/admin/bank-account";
    }
    
    
    
}