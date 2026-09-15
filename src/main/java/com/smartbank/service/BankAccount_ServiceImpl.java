package com.smartbank.service;

import java.math.BigDecimal;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.smartbank.dto.BankAccount_Dto;
import com.smartbank.dto.User_Dto;
import com.smartbank.entity.BankAccount_Entity;
import com.smartbank.entity.Kyc_Entity;
import com.smartbank.entity.User_Entity;
import com.smartbank.enum_package.Enum_File;
import com.smartbank.enum_package.Enum_Status;
import com.smartbank.repository.BankAccount_Repository;
import com.smartbank.repository.Kyc_Repository;
import com.smartbank.repository.User_Repository;
import com.smartbank.util.Bank_Utill;
import com.smartbank.util.EmailUtil;

@Service
public class BankAccount_ServiceImpl
        implements BankAccount_Service {


    @Autowired
    private BankAccount_Repository bankAccount_Repository;


    @Autowired
    private User_Repository user_Repository;


    @Autowired
    private Kyc_Repository kyc_Repository;


    @Autowired
    private ModelMapper modelMapper;
    
    
    
    @Autowired
    private Bank_Utill bank_Utill;

    
    
    @Autowired
    private EmailUtil emailUtil;

    // =====================================================
    // CREATE BANK ACCOUNT
    // =====================================================

    @Override
    public BankAccount_Dto createBankAccount(
            BankAccount_Dto dto) {


        // ---------------------------------------------
        // 1. Validate Customer
        // ---------------------------------------------

        if (dto.getUserId() == null) {

            throw new RuntimeException(
                    "Please select a customer."
            );
        }


        // ---------------------------------------------
        // 2. Check Customer Exists
        // ---------------------------------------------

        User_Dto customer = user_Repository
                .findById(dto.getUserId())
                .map(user -> modelMapper.map(
                        user,
                        User_Dto.class
                ))
                .orElseThrow(() ->
                        new RuntimeException(
                                "Customer not found."
                        )
                );


        // ---------------------------------------------
        // 3. Check Role
        // ---------------------------------------------

        if (customer.getRole() == null ||
            !"CUSTOMER".equalsIgnoreCase(
                    customer.getRole()
            )) {

            throw new RuntimeException(
                    "Selected user is not a customer."
            );
        }


        // ---------------------------------------------
        // 4. Check KYC
        // ---------------------------------------------

        Kyc_Entity kyc = kyc_Repository
                .findByUserId(dto.getUserId())
                .orElseThrow(() ->
                        new RuntimeException(
                                "Customer KYC not found."
                        )
                );
        
        
        

        if (!Enum_Status.APPROVED.equals(kyc.getKycStatus())) {

            throw new RuntimeException(
                "Bank account can be created only for approved customers."
            );
        }

        // ---------------------------------------------
        // 5. Check Existing Account
        // ---------------------------------------------

        if (bankAccount_Repository
                .existsByUser_UserId(dto.getUserId())) {

            throw new RuntimeException(
                    "Bank account already exists for this customer."
            );
        }
        
        
        // ---------------------------------------------
        // 6. Validate Account Type
        // ---------------------------------------------

        if (dto.getAccountType() == null ||
            dto.getAccountType().trim().isEmpty()) {

            throw new RuntimeException(
                    "Please select account type."
            );
        }


        if (!dto.getAccountType().equalsIgnoreCase("SAVINGS")
                && !dto.getAccountType().equalsIgnoreCase("CURRENT")
                && !dto.getAccountType().equalsIgnoreCase("SALARY")) {

            throw new RuntimeException(
                    "Invalid account type."
            );
        }


        // ---------------------------------------------
        // 7. Validate Initial Deposit
        // ---------------------------------------------

        if (dto.getBalance() == null) {

            dto.setBalance(
                    BigDecimal.ZERO
            );
        }


        if (dto.getBalance()
                .compareTo(BigDecimal.ZERO) < 0) {

            throw new RuntimeException(
                    "Initial deposit cannot be negative."
            );
        }


        // ---------------------------------------------
        // 8. Validate Branch
        // ---------------------------------------------

        if (dto.getBranch() == null ||
            dto.getBranch().trim().isEmpty()) {

            throw new RuntimeException(
                    "Please select branch."
            );
        }


     // ---------------------------------------------
     // 9. Generate Account Number
     // ---------------------------------------------

     String accountNumber =
             bank_Utill.generateAccountNumber();


     // ---------------------------------------------
     // 10. Get IFSC
     // ---------------------------------------------

     String ifscCode =
             bank_Utill.getIfscCode(dto.getBranch());
     
     

        // ---------------------------------------------
        // 11. Create Entity
        // ---------------------------------------------

        BankAccount_Entity account =
                new BankAccount_Entity();



			User_Entity user = user_Repository
			        .findById(dto.getUserId())
			        .orElseThrow(() ->
			                new RuntimeException("User not found")
			        );
			
			account.setUser(user);
			
			

        account.setAccountNumber(
                accountNumber
        );


        account.setAccountType(
                dto.getAccountType()
                        .toUpperCase()
        );


        account.setBalance(
                dto.getBalance()
        );


        account.setBranch(
                dto.getBranch()
        );


        account.setIfscCode(
                ifscCode
        );


        account.setAdminRemarks(
                dto.getAdminRemarks()
        );


        account.setAccountStatus(
                "ACTIVE"
        );


        // ---------------------------------------------
        // 12. Save Account
        // ---------------------------------------------

        BankAccount_Entity savedAccount =
                bankAccount_Repository.save(account);
        
        
        
     // ---------------------------------------------
     // 13. Send Account Created Email
     // ---------------------------------------------

     emailUtil.sendBankAccountCreatedEmail(
             customer.getEmail(),
             customer.getName(),
             savedAccount.getAccountNumber(),
             savedAccount.getAccountType(),
             savedAccount.getBalance(),
             savedAccount.getBranch(),
             savedAccount.getIfscCode()
     );


        // ---------------------------------------------
        // 14. Convert Entity → DTO
        // ---------------------------------------------

        BankAccount_Dto response =
                modelMapper.map(
                        savedAccount,
                        BankAccount_Dto.class
                );


        response.setCustomerName(
                customer.getName()
        );


        response.setEmail(
                customer.getEmail()
        );


        return response;
    }

    
    
    
    
    
    
    



    // =====================================================
    // GET VERIFIED CUSTOMERS
    // =====================================================

    @Override
    public List<User_Dto> getVerifiedCustomers() {

        List<User_Dto> customers =
                user_Repository
                        .findAll()
                        .stream()

                        // Only CUSTOMER users
                        .filter(user ->
                                user.getRole() != null
                                &&
                                Enum_File.CUSTOMER.equals(
                                        user.getRole()
                                )
                        )

                        // Only APPROVED KYC customers
                        .filter(user -> {
                            return kyc_Repository
                                    .findByUserId(user.getUserId())
                                    .map(kyc ->
                                        Enum_Status.APPROVED.equals(
                                            kyc.getKycStatus()
                                        )
                                    )
                                    .orElse(false);
                        })
                        
                        
                        // Only customers who don't already have a bank account
                        .filter(user ->
                                !bankAccount_Repository
                                        .existsByUser_UserId(
                                                user.getUserId()
                                        )
                        )

                        // Convert User_Entity to User_Dto
                        .map(user ->
                                modelMapper.map(
                                        user,
                                        User_Dto.class
                                )
                        )

                        .toList();

        return customers;
    }
    
    
    
    
    @Override
    public Page<BankAccount_Dto> getAllBankAccounts(
            Pageable pageable) {

        Page<BankAccount_Entity> accountPage =
                bankAccount_Repository.findAll(pageable);


        return accountPage.map(account -> {

            BankAccount_Dto dto =
                    new BankAccount_Dto();


            // -----------------------------------------
            // Account ID
            // -----------------------------------------

            dto.setAccountId(
                    account.getAccountId()
            );


            // -----------------------------------------
            // User ID
            // -----------------------------------------

            if (account.getUser() != null) {

                dto.setUserId(
                        account.getUser().getUserId()
                );


                // -------------------------------------
                // Customer Name
                // -------------------------------------

                dto.setCustomerName(
                        account.getUser().getName()
                );


                // -------------------------------------
                // Customer Email
                // -------------------------------------

                dto.setEmail(
                        account.getUser().getEmail()
                );
            }


            // -----------------------------------------
            // Account Number
            // -----------------------------------------

            dto.setAccountNumber(
                    account.getAccountNumber()
            );


            // -----------------------------------------
            // Account Type
            // -----------------------------------------

            dto.setAccountType(
                    account.getAccountType()
            );


            // -----------------------------------------
            // Balance
            // -----------------------------------------

            dto.setBalance(
                    account.getBalance()
            );


            // -----------------------------------------
            // Branch
            // -----------------------------------------

            dto.setBranch(
                    account.getBranch()
            );


            // -----------------------------------------
            // IFSC
            // -----------------------------------------

            dto.setIfscCode(
                    account.getIfscCode()
            );


            // -----------------------------------------
            // Admin Remarks
            // -----------------------------------------

            dto.setAdminRemarks(
                    account.getAdminRemarks()
            );


            // -----------------------------------------
            // Status
            // -----------------------------------------

            dto.setAccountStatus(
                    account.getAccountStatus()
            );


            // -----------------------------------------
            // Created Date
            // -----------------------------------------

            dto.setCreatedAt(
                    account.getCreatedAt()
            );


            // -----------------------------------------
            // Updated Date
            // -----------------------------------------

            dto.setUpdatedAt(
                    account.getUpdatedAt()
            );


            return dto;
        });
    }
    
    
    
    
    
    
    
    @Override
    public BankAccount_Dto getBankAccountById(
            Integer accountId) {

        BankAccount_Entity account =
                bankAccount_Repository
                        .findById(accountId)
                        .orElse(null);


        if (account == null) {

            return null;
        }


        BankAccount_Dto dto =
                new BankAccount_Dto();


        // -----------------------------------------
        // Account ID
        // -----------------------------------------

        dto.setAccountId(
                account.getAccountId()
        );


        // -----------------------------------------
        // Customer
        // -----------------------------------------

        if (account.getUser() != null) {

            dto.setUserId(
                    account.getUser().getUserId()
            );

            dto.setCustomerName(
                    account.getUser().getName()
            );

            dto.setEmail(
                    account.getUser().getEmail()
            );
        }


        // -----------------------------------------
        // Account Details
        // -----------------------------------------

        dto.setAccountNumber(
                account.getAccountNumber()
        );

        dto.setAccountType(
                account.getAccountType()
        );

        dto.setBalance(
                account.getBalance()
        );

        dto.setBranch(
                account.getBranch()
        );

        dto.setIfscCode(
                account.getIfscCode()
        );

        dto.setAdminRemarks(
                account.getAdminRemarks()
        );

        dto.setAccountStatus(
                account.getAccountStatus()
        );


        // -----------------------------------------
        // Dates
        // -----------------------------------------

        dto.setCreatedAt(
                account.getCreatedAt()
        );

        dto.setUpdatedAt(
                account.getUpdatedAt()
        );


        return dto;
    }
    
    
    
    
    
    
    
    @Override
    public BankAccount_Dto updateBankAccount(
            BankAccount_Dto dto) {


        // -----------------------------------------
        // Find existing account
        // -----------------------------------------

        BankAccount_Entity account =
                bankAccount_Repository
                        .findById(dto.getAccountId())
                        .orElseThrow(
                            () -> new RuntimeException(
                                "Bank account not found."
                            )
                        );


        // -----------------------------------------
        // Update Account Number
        // -----------------------------------------

        account.setAccountNumber(
                dto.getAccountNumber()
        );


        // -----------------------------------------
        // Update Account Type
        // -----------------------------------------

        account.setAccountType(
                dto.getAccountType()
        );


        // -----------------------------------------
        // Update Balance
        // -----------------------------------------

        account.setBalance(
                dto.getBalance()
        );


        // -----------------------------------------
        // Update Branch
        // -----------------------------------------

        account.setBranch(
                dto.getBranch()
        );


        // -----------------------------------------
        // Update IFSC
        // -----------------------------------------

        account.setIfscCode(
                dto.getIfscCode()
        );


        // -----------------------------------------
        // Update Admin Remarks
        // -----------------------------------------

        account.setAdminRemarks(
                dto.getAdminRemarks()
        );


        // -----------------------------------------
        // Update Status
        // -----------------------------------------

        account.setAccountStatus(
                dto.getAccountStatus()
        );


        // -----------------------------------------
        // IMPORTANT
        // Do NOT change account.getUser()
        // -----------------------------------------


        // -----------------------------------------
        // Save
        // -----------------------------------------

        BankAccount_Entity updatedAccount =
                bankAccount_Repository.save(
                        account
                );


        // -----------------------------------------
        // Return DTO
        // -----------------------------------------

        BankAccount_Dto response =
                new BankAccount_Dto();


        response.setAccountId(
                updatedAccount.getAccountId()
        );


        if (updatedAccount.getUser() != null) {

            response.setUserId(
                    updatedAccount
                            .getUser()
                            .getUserId()
            );

            response.setCustomerName(
                    updatedAccount
                            .getUser()
                            .getName()
            );

            response.setEmail(
                    updatedAccount
                            .getUser()
                            .getEmail()
            );
        }


        response.setAccountNumber(
                updatedAccount.getAccountNumber()
        );

        response.setAccountType(
                updatedAccount.getAccountType()
        );

        response.setBalance(
                updatedAccount.getBalance()
        );

        response.setBranch(
                updatedAccount.getBranch()
        );

        response.setIfscCode(
                updatedAccount.getIfscCode()
        );

        response.setAdminRemarks(
                updatedAccount.getAdminRemarks()
        );

        response.setAccountStatus(
                updatedAccount.getAccountStatus()
        );

        response.setCreatedAt(
                updatedAccount.getCreatedAt()
        );

        response.setUpdatedAt(
                updatedAccount.getUpdatedAt()
        );


        return response;
    }
    
    
    
    
    
    
    @Override
    public long getTotalBankAccounts() {

        return bankAccount_Repository.count();
    }
    
    
    
    @Override
    public long getActiveBankAccounts() {

        return bankAccount_Repository
                .countByAccountStatus("ACTIVE");
    }
    
    
    
    @Override
    public long getPendingBankAccounts() {

        return bankAccount_Repository
                .countByAccountStatus("PENDING");
    }
    
    
    @Override
    public long getClosedBankAccounts() {

        return bankAccount_Repository
                .countByAccountStatus("CLOSED");
    }
    
    
    
    
    
    
    
    
    
    
    
    // ============================================= User Side
    @Override
    public BankAccount_Dto getBankAccountByUserId(Integer userId) {

        BankAccount_Entity account =
                bankAccount_Repository
                        .findByUser_UserId(userId)
                        .orElse(null);

        if (account == null) {
            return null;
        }

        BankAccount_Dto dto = new BankAccount_Dto();

        dto.setAccountId(account.getAccountId());

        // User information
        if (account.getUser() != null) {

            dto.setUserId(
                    account.getUser().getUserId()
            );

            dto.setCustomerName(
                    account.getUser().getName()
            );

            dto.setEmail(
                    account.getUser().getEmail()
            );
        }

        // Account information
        dto.setAccountNumber(
                account.getAccountNumber()
        );

        dto.setAccountType(
                account.getAccountType()
        );

        dto.setBalance(
                account.getBalance()
        );

        dto.setAccountStatus(
                account.getAccountStatus()
        );

        dto.setBranch(
                account.getBranch()
        );

        dto.setIfscCode(
                account.getIfscCode()
        );

        dto.setAdminRemarks(
                account.getAdminRemarks()
        );

        dto.setCreatedAt(
                account.getCreatedAt()
        );

        dto.setUpdatedAt(
                account.getUpdatedAt()
        );

        return dto;
    }
}