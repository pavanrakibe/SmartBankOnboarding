package com.smartbank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smartbank.entity.User_Entity;

@Repository
public interface AuthRepository extends JpaRepository<User_Entity, Integer> {

    Optional<User_Entity> findByEmail(String email);
    


}