package com.smartbank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smartbank.entity.BankAccount_Entity;

public interface BankAccount_Repository
        extends JpaRepository<BankAccount_Entity, Integer> {

    boolean existsByUser_UserId(Integer userId);

    boolean existsByAccountNumber(String accountNumber);

    Optional<BankAccount_Entity> findByUser_UserId(Integer userId);
    
    
    long countByAccountStatus(String accountStatus);

    
}