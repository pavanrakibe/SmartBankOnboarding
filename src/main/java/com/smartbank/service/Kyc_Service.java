package com.smartbank.service;



import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import com.smartbank.dto.AdminKycDecisionDto;
import com.smartbank.dto.KycReviewDto;
import com.smartbank.dto.Kyc_Dto;

public interface Kyc_Service {
	
	
	// Save Customer Kyc
	
    void saveKyc(Kyc_Dto kycRequestDto);
    
    
    // Get KYC by User ID (Dashboard)
    Kyc_Dto getKycByUserId(Integer userId);
    
    
	Long getAllApplicationCount();

	
	
	
	
	Page<Kyc_Dto> getPendingKyc(int page, int size);

	Page<Kyc_Dto> getApproveKyc(int page, int size);
	
	Page<Kyc_Dto> getRejectKyc(int page, int size);

	Page<Kyc_Dto> getNeedCorrectionKyc(int page, int size);


	
	void deleteKyc(Integer profileId);
	
	
    Kyc_Dto getKycById(Integer profileId);
    
    
    KycReviewDto getReviewByProfileId(Integer profileId);
    
    
    

    
    
    
    
    
    // =====================================================
    // Update corrected KYC
    // =====================================================

    Kyc_Dto updateCorrectedKyc(

            Kyc_Dto dto,

            MultipartFile aadhaarFile,

            MultipartFile panFile,

            MultipartFile faceVideo
    );
    
    
    
    KycReviewDto getKycCorrectionReview(Integer userId);
    
    
    
    Kyc_Dto getKycByProfileId(Integer profileId);

    
    
    
    void adminUpdateCorrectedKyc(
            AdminKycDecisionDto decisionDto
    );



}




