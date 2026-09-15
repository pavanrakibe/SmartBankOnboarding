package com.smartbank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smartbank.entity.Contact_Entity;




@Repository
public interface Contact_Repository extends JpaRepository<Contact_Entity, Integer>{
	
	
	boolean existsByEmail(String email);
	

}
