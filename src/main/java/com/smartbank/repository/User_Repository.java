package com.smartbank.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smartbank.entity.User_Entity;
import com.smartbank.enum_package.Enum_File;

@Repository
public interface User_Repository
        extends JpaRepository<User_Entity, Integer> {


 

    // Find user by email
    Optional<User_Entity> findByEmail(String email);


    // Find user by mobile
    Optional<User_Entity> findByMobile(String mobile);


    Page<User_Entity> findByRole(Enum_File role, Pageable pageable);
    
    
    // Check email
    boolean existsByEmail(String email);


    // Check mobile
    boolean existsByMobile(String mobile);
    
    
    
    long countByRole(Enum_File role);
    
    
    

}