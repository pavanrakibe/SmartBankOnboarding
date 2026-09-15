package com.smartbank.service;



import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smartbank.dto.KycReviewDto;
import com.smartbank.dto.Kyc_Dto;
import com.smartbank.entity.KycReview_Entity;
import com.smartbank.entity.Kyc_Entity;
import com.smartbank.enum_package.Enum_Status;
import com.smartbank.repository.KycReviewRepository;
import com.smartbank.repository.Kyc_Repository;

@Service
public class KycReviewServiceImpl implements KycReviewService {

   
    
    
    
    @Autowired
    private KycReviewRepository kycReviewRepository;
    
    
    @Autowired
    private Kyc_Repository kycRepository;
    
    
    
    @Autowired
    private ModelMapper modelMapper;
    
    
    
    

    @Override
    @Transactional
    public void saveReview(KycReviewDto dto) {

        KycReview_Entity review = new KycReview_Entity();

        // Profile
        review.setProfileId(dto.getProfileId());

        // Full Name
        review.setFullNameVerified(dto.isFullNameVerified());
        review.setFullNameIssue(dto.getFullNameIssue());

        // Date of Birth
        review.setDobVerified(dto.isDobVerified());
        review.setDobIssue(dto.getDobIssue());

        // Gender
        review.setGenderVerified(dto.isGenderVerified());
        review.setGenderIssue(dto.getGenderIssue());

        // Address
        review.setAddressVerified(dto.isAddressVerified());
        review.setAddressIssue(dto.getAddressIssue());

        // City
        review.setCityVerified(dto.isCityVerified());
        review.setCityIssue(dto.getCityIssue());

        // State
        review.setStateVerified(dto.isStateVerified());
        review.setStateIssue(dto.getStateIssue());

        // Pincode
        review.setPincodeVerified(dto.isPincodeVerified());
        review.setPincodeIssue(dto.getPincodeIssue());

        // Aadhaar Number
        review.setAadhaarNoVerified(dto.isAadhaarNoVerified());
        review.setAadhaarNoIssue(dto.getAadhaarNoIssue());
        
        
        // Pan Number
        review.setPanNoVerified(dto.isPanNoVerified());
        review.setPanNoIssue(dto.getPanNoIssue());
        
        // Aadhaar image
        review.setAadhaarVerified(dto.isAadhaarVerified());
        review.setAadhaarIssue(dto.getAadhaarIssue());

        // PAN image
        review.setPanVerified(dto.isPanVerified());
        review.setPanIssue(dto.getPanIssue());

        // Face Video
        review.setFaceVideoVerified(dto.isFaceVideoVerified());
        review.setFaceVideoIssue(dto.getFaceVideoIssue());

        // Admin remarks
        review.setAdminRemarks(dto.getAdminRemarks());

        // Review status
     // Review status
        if (dto.getReviewStatus() != null && !dto.getReviewStatus().isBlank()) {
            review.setReviewStatus(
                Enum_Status.valueOf(dto.getReviewStatus().toUpperCase())
            );
        }
        
        

        // Admin who reviewed
        review.setReviewedBy(dto.getReviewedBy());

        // reviewedAt will automatically be set by @PrePersist
        kycReviewRepository.save(review);
        
        
        

        // =====================================================
        // UPDATE CUSTOMER KYC STATUS
        // =====================================================

        if (dto.getReviewStatus() != null
                && !dto.getReviewStatus().isBlank()) {

            Kyc_Entity kyc = kycRepository
                    .findById(dto.getProfileId())
                    .orElseThrow(() ->
                        new RuntimeException(
                            "KYC profile not found: "
                            + dto.getProfileId()
                        )
                    );

            // Convert review status to KYC status
            Enum_Status status =
                    Enum_Status.valueOf(
                        dto.getReviewStatus().toUpperCase()
                    );

            kyc.setKycStatus(status);

            // Update customer_kyc
            kycRepository.save(kyc);
            
            
            
            
            
                
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    @Override
    @Transactional(readOnly = true)
    public KycReviewDto getReviewByProfileId(Integer profileId) {

        // =========================================================
        // 1. Validate profileId
        // =========================================================

        if (profileId == null || profileId <= 0) {

            throw new RuntimeException(
                    "Invalid KYC profile ID."
            );
        }


        // =========================================================
        // 2. Find review
        // =========================================================

        Optional<KycReview_Entity> optionalEntity =
                kycReviewRepository.findByProfileId(profileId);


        // =========================================================
        // 3. Check review exists
        // =========================================================

        if (optionalEntity.isEmpty()) {

            return null;
        }


        // =========================================================
        // 4. Get entity from Optional
        // =========================================================

        KycReview_Entity entity =
                optionalEntity.get();


        // =========================================================
        // 5. Convert Entity -> DTO
        // =========================================================

        KycReviewDto dto =
                modelMapper.map(
                        entity,
                        KycReviewDto.class
                );


        // =========================================================
        // 6. Return DTO
        // =========================================================

        return dto;
    }
    
    
    
    
    
}