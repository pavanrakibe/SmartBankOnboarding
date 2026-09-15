package com.smartbank.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smartbank.dto.BankAccount_Dto;
import com.smartbank.service.BankAccount_Service;

@Controller
@RequestMapping("/user/bank-account")
public class UserBankAccountController {

    @Autowired
    private BankAccount_Service bankAccount_Service;


    // =====================================================
    // USER BANK ACCOUNT PAGE
    // =====================================================

    @GetMapping
    public String bankAccount(
            HttpSession session,
            Model model) {

        Integer userId =
                (Integer) session.getAttribute("userId");

        // ---------------------------------------------
        // Check login
        // ---------------------------------------------

        if (userId == null) {

            return "redirect:/auth/login";
        }


        // ---------------------------------------------
        // Get bank account
        // ---------------------------------------------

        BankAccount_Dto account =
                bankAccount_Service
                        .getBankAccountByUserId(userId);


        // ---------------------------------------------
        // Add data to JSP
        // ---------------------------------------------

        model.addAttribute(
                "account",
                account
        );

        model.addAttribute(
                "activeMenu",
                "bank-account"
        );


        return "user/user-bank-account";
    }


    // =====================================================
    // USER BANK ACCOUNT DETAILS
    // =====================================================

    @GetMapping("/details")
    public String bankAccountDetails(
            HttpSession session,
            Model model) {

        Integer userId =
                (Integer) session.getAttribute("userId");


        // ---------------------------------------------
        // Check login
        // ---------------------------------------------

        if (userId == null) {

            return "redirect:/auth/login";
        }


        // ---------------------------------------------
        // Get account
        // ---------------------------------------------

        BankAccount_Dto account =
                bankAccount_Service
                        .getBankAccountByUserId(userId);


        model.addAttribute(
                "account",
                account
        );

        model.addAttribute(
                "activeMenu",
                "bank-account"
        );


        return "user/user-bank-account-details";
    }
}