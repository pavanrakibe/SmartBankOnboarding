package com.smartbank.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.smartbank.dto.BankAccount_Dto;
import com.smartbank.dto.User_Dto;

public interface BankAccount_Service {


    BankAccount_Dto createBankAccount(
            BankAccount_Dto dto
    );


    List<User_Dto> getVerifiedCustomers();
    
    
    // New method
    Page<BankAccount_Dto> getAllBankAccounts(Pageable pageable);
    
    
    // udpate account details
    BankAccount_Dto getBankAccountById(Integer accountId);
    
    
    BankAccount_Dto updateBankAccount(
            BankAccount_Dto dto
    );
    
    
    
    
    long getTotalBankAccounts();

    long getActiveBankAccounts();

    long getPendingBankAccounts();

    long getClosedBankAccounts();
    
    
    
    
    
    //=========== User Side
    BankAccount_Dto getBankAccountByUserId(Integer userId);

}