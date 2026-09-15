package com.smartbank.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BankAccount_Dto {

    private Integer accountId;

    private Integer userId;

    private String customerName;

    private String email;

    private String accountNumber;

    private String accountType;

    private BigDecimal balance;

    private String branch;

    private String ifscCode;

    private String adminRemarks;

    private String accountStatus;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
    
    
    
    public String getFormattedCreatedAt() {

        if (createdAt == null) {
            return "";
        }

        return createdAt.format(
                java.time.format.DateTimeFormatter
                        .ofPattern("dd-MM-yyyy")
        );
    }
    
    
    
}