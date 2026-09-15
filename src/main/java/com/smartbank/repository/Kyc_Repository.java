package com.smartbank.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smartbank.entity.Kyc_Entity;
import com.smartbank.enum_package.Enum_Status;



@Repository
public interface Kyc_Repository extends JpaRepository<Kyc_Entity, Integer> {
	
	
   
	// Find KYC details by user id
    
    Optional<Kyc_Entity> findByUserId(Integer userId);


    
     //  Check whether KYC already exists for user
     
    boolean existsByUserId(Integer userId);


   
    //  Check duplicate Aadhaar number
    
    boolean existsByAadhaarNo(String aadhaarNo);


    
    //  Check duplicate PAN number
   
    boolean existsByPanNo(String panNo);


    
    
    // ================
    
    // ================
    
 // Get all pending KYC
    List<Kyc_Entity> findByKycStatus(String kycStatus);
    
    Optional<Kyc_Entity> findByProfileId(Long profileId);
    
    
    

    
    
    Page<Kyc_Entity> findByKycStatus(
            Enum_Status kycStatus,
            Pageable pageable
    );
    
    
    
    // for application application section
    
    List<Kyc_Entity> findByKycStatus(Enum_Status kycStatus);

    
    
    Kyc_Entity findByProfileId(Integer profileId);
    
    

}
