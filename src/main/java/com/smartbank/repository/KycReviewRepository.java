package com.smartbank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smartbank.entity.KycReview_Entity;
import com.smartbank.entity.Kyc_Entity;


@Repository
public interface KycReviewRepository
        extends JpaRepository<KycReview_Entity, Integer> {
	
	
	
	  Optional<KycReview_Entity>
	    findByProfileId(Integer profileId);
	    
	    


}