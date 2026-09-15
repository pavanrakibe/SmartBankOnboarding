package com.smartbank.util;

import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smartbank.repository.BankAccount_Repository;

@Component
public class Bank_Utill {

    @Autowired
    private BankAccount_Repository bankAccount_Repository;

    // =====================================================
    // GENERATE ACCOUNT NUMBER
    // =====================================================

    public String generateAccountNumber() {

        String accountNumber;

        do {

            long number =
                    ThreadLocalRandom.current()
                            .nextLong(
                                    100000000000L,
                                    1000000000000L
                            );

            accountNumber =
                    String.valueOf(number);

        } while (
                bankAccount_Repository
                        .existsByAccountNumber(accountNumber)
        );

        return accountNumber;
    }


    // =====================================================
    // GET IFSC CODE
    // =====================================================

    public String getIfscCode(String branch) {

        if ("MAIN".equalsIgnoreCase(branch)) {

            return "SMART0000001";
        }

        if ("MUMBAI".equalsIgnoreCase(branch)) {

            return "SMART0000002";
        }

        if ("DELHI".equalsIgnoreCase(branch)) {

            return "SMART0000003";
        }

        return "SMART0000000";
    }
}