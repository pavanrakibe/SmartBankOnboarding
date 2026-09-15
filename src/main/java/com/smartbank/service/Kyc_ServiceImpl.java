package com.smartbank.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smartbank.dto.AdminKycDecisionDto;
import com.smartbank.dto.KycReviewDto;
import com.smartbank.dto.Kyc_Dto;
import com.smartbank.dto.User_Dto;
import com.smartbank.entity.KycReview_Entity;
import com.smartbank.entity.Kyc_Entity;
import com.smartbank.entity.User_Entity;
import com.smartbank.enum_package.Enum_File;
import com.smartbank.enum_package.Enum_Status;
import com.smartbank.exception.KycException;
import com.smartbank.repository.KycReviewRepository;
import com.smartbank.repository.Kyc_Repository;
import com.smartbank.repository.User_Repository;
import com.smartbank.util.EmailUtil;
import com.smartbank.util.FileUploadUtil;

import jakarta.transaction.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Service
public class Kyc_ServiceImpl implements Kyc_Service {


    @Autowired
    private ModelMapper modelMapper;


    @Autowired
    private Kyc_Repository kycRepository;


    @Autowired
    private FileUploadUtil fileUploadUtil;
    
    
    @Autowired
    private EmailUtil emailUtil;
    
    
    @Autowired
    private User_Repository user_Repository;
    
 
    
    @Autowired
    private KycReviewRepository kycReviewRepository;
   
    // SLF4J Logger
    private static final Logger logger =
            LoggerFactory.getLogger(Kyc_ServiceImpl.class);

    
    


    @Override
    public void saveKyc(Kyc_Dto dto) {

        logger.info(
                "KYC submission started for User ID: {}",
                dto.getUserId()
        );

        try {

            // =====================================================
            // 1. CHECK EXISTING KYC
            // =====================================================

            logger.info(
                    "Checking existing KYC for User ID: {}",
                    dto.getUserId()
            );

            if (kycRepository.existsByUserId(dto.getUserId())) {

                logger.warn(
                        "KYC already exists for User ID: {}",
                        dto.getUserId()
                );

                throw new RuntimeException(
                        "KYC already submitted."
                );
            }


         

            // =====================================================
            // 4. DTO -> ENTITY
            // =====================================================

            logger.info(
                    "Mapping KYC DTO to Entity."
            );

            Kyc_Entity entity =
                    modelMapper.map(
                            dto,
                            Kyc_Entity.class
                    );


            // =====================================================
            // 5. SET USER ID
            // =====================================================

            entity.setUserId(
                    dto.getUserId()
            );


            // =====================================================
            // 6. UPLOAD AADHAAR
            // =====================================================

            logger.info(
                    "Uploading Aadhaar file."
            );

            if (dto.getAadhaarFile() == null
                    || dto.getAadhaarFile().isEmpty()) {

                throw new RuntimeException(
                        "Aadhaar file is required."
                );
            }

            String aadhaarPath =
                    fileUploadUtil.uploadAadhaar(
                            dto.getAadhaarFile()
                    );


            // =====================================================
            // 7. UPLOAD PAN
            // =====================================================

            logger.info(
                    "Uploading PAN file."
            );

            if (dto.getPanFile() == null
                    || dto.getPanFile().isEmpty()) {

                throw new RuntimeException(
                        "PAN file is required."
                );
            }

            String panPath =
                    fileUploadUtil.uploadPan(
                            dto.getPanFile()
                    );


            // =====================================================
            // 8. UPLOAD FACE VIDEO
            // =====================================================

            logger.info(
                    "Uploading face verification video."
            );

            if (dto.getFaceVideo() == null
                    || dto.getFaceVideo().isEmpty()) {

                throw new RuntimeException(
                        "Face verification video is required."
                );
            }

            String faceVideoPath =
                    fileUploadUtil.uploadFaceVideo(
                            dto.getFaceVideo()
                    );


            // =====================================================
            // 9. SET FILE PATHS
            // =====================================================

            entity.setAadhaarFileName(
                    aadhaarPath
            );

            entity.setPanFileName(
                    panPath
            );

            entity.setFaceVideoPath(
                    faceVideoPath
            );


            // =====================================================
            // 10. SET KYC STATUS
            // =====================================================

            entity.setKycStatus(
                    Enum_Status.PENDING
            );


            // =====================================================
            // 11. SAVE KYC
            // =====================================================

            logger.info(
                    "Saving KYC details into database."
            );

            Kyc_Entity savedEntity =
                    kycRepository.save(entity);


            logger.info(
                    "KYC submitted successfully for User ID: {}",
                    savedEntity.getUserId()
            );


            // =====================================================
            // 12. SEND EMAIL
            // =====================================================

            try {

                logger.info(
                        "Preparing KYC completion email."
                );

                User_Entity user =
                        user_Repository.findById(
                                dto.getUserId()
                        ).orElseThrow(
                                () -> new RuntimeException(
                                        "User not found."
                                )
                        );


                String email =
                        user.getEmail();


                String customerName =
                        user.getName();


                emailUtil.sendKycCompletedEmail(
                        email,
                        customerName
                );


                logger.info(
                        "KYC completion email sent to: {}",
                        email
                );


            } catch (Exception emailException) {

                /*
                 * KYC has already been successfully saved.
                 * Email failure should not fail the KYC submission.
                 */

                logger.error(
                        "KYC saved successfully but email sending failed.",
                        emailException
                );
            }


        } catch (Exception e) {

            logger.error(
                    "Error while submitting KYC for User ID: {}",
                    dto.getUserId(),
                    e
            );

            throw new RuntimeException(
                    e.getMessage(),
                    e
            );
        }
    }
    
    
    
    
//    =============================================================================

	@Override
	public Kyc_Dto getKycByUserId(Integer userId) {
		
		Optional<Kyc_Entity> optional = kycRepository.findByUserId(userId);
		
		
		if(optional.isPresent())
		{
			return modelMapper.map(optional.get(),Kyc_Dto.class);
		}
		
		return null;
	}


	
	
	



	
	
	

//	get Admin kyc applcaiton count get 

	@Override
	public Long getAllApplicationCount() {

		return this.kycRepository.count();
		
	}
	
	
	
	
	

	@Override
	public Page<Kyc_Dto> getPendingKyc(int page, int size) {

	    try {

	        Pageable pageable = PageRequest.of(
	                page,
	                size,
	                Sort.by("profileId").descending()
	        );

	        Page<Kyc_Entity> kycData =
	                kycRepository.findByKycStatus(
	                        Enum_Status.PENDING,
	                        pageable
	                );

	        return kycData.map(
	                kyc -> modelMapper.map(
	                        kyc,
	                        Kyc_Dto.class
	                )
	        );

	    } catch (Exception e) {

	        // Log actual technical error
	        e.printStackTrace();

	        // Throw custom business exception
	        throw new KycException(
	                "Unable to fetch pending KYC data.",
	                e     
	        );
	    }
	}
	
	
	
	
	


	
	@Override
	public Page<Kyc_Dto> getApproveKyc(int page, int size) {

	    try {

	        Pageable pageable = PageRequest.of(
	                page,
	                size,
	                Sort.by("profileId").descending()
	        );

	        Page<Kyc_Entity> kycData =
	                kycRepository.findByKycStatus(
	                        Enum_Status.APPROVED,
	                        pageable
	                );

	        return kycData.map(
	                kyc -> modelMapper.map(
	                        kyc,
	                        Kyc_Dto.class
	                )
	        );

	    } catch (Exception e) {

	        // Log actual technical error
	        e.printStackTrace();

	        // Throw custom business exception
	        throw new KycException(
	                "Unable to fetch approved KYC data.",
	                e     
	        );
	    }
	}
	
	
	
	
	


	
	@Override
	public Page<Kyc_Dto> getRejectKyc(int page, int size) {

	    try {

	        Pageable pageable = PageRequest.of(
	                page,
	                size,
	                Sort.by("profileId").descending()
	        );

	        Page<Kyc_Entity> kycData =
	                kycRepository.findByKycStatus(
	                        Enum_Status.REJECTED,
	                        pageable
	                );

	        return kycData.map(
	                kyc -> modelMapper.map(
	                        kyc,
	                        Kyc_Dto.class
	                )
	        );

	    } catch (Exception e) {

	        // Log actual technical error
	        e.printStackTrace();

	        // Throw custom business exception
	        throw new KycException(
	                "Unable to fetch reject KYC data.",
	                e     
	        );
	    }
	}
	
	
	

	
	@Override
	public Page<Kyc_Dto> getNeedCorrectionKyc(int page, int size) {

	    try {

	        Pageable pageable = PageRequest.of(
	                page,
	                size,
	                Sort.by("profileId").descending()
	        );

	        Page<Kyc_Entity> kycData =
	                kycRepository.findByKycStatus(
	                        Enum_Status.NEED_CORRECTION,
	                        pageable
	                );

	        return kycData.map(
	                kyc -> modelMapper.map(
	                        kyc,
	                        Kyc_Dto.class
	                )
	        );

	    } catch (Exception e) {

	        // Log actual technical error
	        e.printStackTrace();

	        // Throw custom business exception
	        throw new KycException(
	                "Unable to fetch Need Correction KYC data.",
	                e     
	        );
	    }
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public void deleteKyc(Integer profileId) {

	    try {

	        Kyc_Entity kycData =
	                kycRepository.findById(profileId)
	                        .orElseThrow(
	                                () -> new KycException(
	                                        "KYC application not found."
	                                )
	                        );

	        kycRepository.delete(kycData);

	    } catch (KycException e) {

	        throw e;

	    } catch (Exception e) {

	        e.printStackTrace();

	        throw new KycException(
	                "Unable to delete KYC application.",
	                e
	        );
	    }
	}
	
	
	
	
	
	
	


	@Override
	public Kyc_Dto getKycById(Integer profileId) {

	    Kyc_Entity entity =
	            kycRepository.findById(profileId)
	                    .orElse(null);

	    if (entity == null) {

	        return null;
	    }

	    return modelMapper.map(
	            entity,
	            Kyc_Dto.class
	    );
	}
	
	
	
	

	
	
	
	
	// user side
//	@Override
//	public KycReviewDto getReviewByProfileId(Integer profileId) {
//
//	    Optional<KycReview_Entity> optional =
//	            kycReviewRepository.findByProfileId(profileId);
//
//	    if (optional.isPresent()) {
//
//	        return modelMapper.map(
//	                optional.get(),
//	                KycReviewDto.class
//	        );
//	    }
//
//	    return null;
//	}
//	
	
	
	
	@Override
	public KycReviewDto getReviewByProfileId(
	        Integer profileId) {

	    // =========================================================
	    // 1. VALIDATE PROFILE ID
	    // =========================================================

	    if (profileId == null || profileId <= 0) {

	        throw new RuntimeException(
	                "Invalid KYC profile ID."
	        );
	    }


	    // =========================================================
	    // 2. FIND REVIEW
	    // =========================================================

	    Optional<KycReview_Entity> optionalReview =
	            kycReviewRepository.findByProfileId(profileId);


	    // =========================================================
	    // 3. CHECK REVIEW
	    // =========================================================

	    if (optionalReview.isEmpty()) {

	        return null;
	    }


	    // =========================================================
	    // 4. GET ENTITY
	    // =========================================================

	    KycReview_Entity entity =
	            optionalReview.get();


	    // =========================================================
	    // 5. CONVERT ENTITY → DTO
	    // =========================================================

	    KycReviewDto dto =
	            modelMapper.map(
	                    entity,
	                    KycReviewDto.class
	            );


	    return dto;
	}

	
	
	
	
	
	
	
	@Override
	public KycReviewDto getKycCorrectionReview(Integer userId) {

	    Optional<Kyc_Entity> kycOptional =
	            kycRepository.findByUserId(userId);

	    if (kycOptional.isEmpty()) {
	        return null;
	    }

	    Kyc_Entity kyc =
	            kycOptional.get();

	    Optional<KycReview_Entity> reviewOptional =
	            kycReviewRepository.findByProfileId(
	                    kyc.getProfileId()
	            );

	    if (reviewOptional.isEmpty()) {
	        return null;
	    }

	    KycReview_Entity review =
	            reviewOptional.get();


	    // DEBUG
	    System.err.println("==============================");
	    System.err.println("PROFILE ID       : "
	            + review.getProfileId());

	    System.err.println("AADHAAR NO ISSUE : "
	            + review.getAadhaarNoIssue());

	    System.err.println("AADHAAR ISSUE    : "
	            + review.getAadhaarIssue());

	    System.err.println("CITY ISSUE       : "
	            + review.getCityIssue());

	    System.err.println("PAN NO ISSUE     : "
	            + review.getPanNoIssue());

	    System.err.println("PAN ISSUE        : "
	            + review.getPanIssue());

	    System.err.println("==============================");


	    return modelMapper.map(
	            review,
	            KycReviewDto.class
	    );
	}
	
	
	
	
	
	
	
	@Override
	@Transactional
	public Kyc_Dto updateCorrectedKyc(

	        Kyc_Dto dto,

	        MultipartFile aadhaarFile,

	        MultipartFile panFile,

	        MultipartFile faceVideo) {

	    // =========================================================
	    // 1. Validate User ID
	    // =========================================================

	    if (dto == null || dto.getUserId() == null) {

	        throw new RuntimeException(
	                "User ID is required."
	        );
	    }

	    logger.info(
	            "Corrected KYC update started for User ID: {}",
	            dto.getUserId()
	    );


	    try {

	        // =====================================================
	        // 2. Find Existing KYC
	        // =====================================================

	        Optional<Kyc_Entity> optional =
	                kycRepository.findByUserId(
	                        dto.getUserId()
	                );


	        if (optional.isEmpty()) {

	            logger.error(
	                    "KYC application not found for User ID: {}",
	                    dto.getUserId()
	            );

	            throw new RuntimeException(
	                    "KYC application not found."
	            );
	        }


	        Kyc_Entity entity =
	                optional.get();


	        // =====================================================
	        // 3. Security Check
	        // =====================================================

	        if (entity.getUserId() == null ||
	            !entity.getUserId().equals(dto.getUserId())) {

	            logger.error(
	                    "Unauthorized KYC update attempt for User ID: {}",
	                    dto.getUserId()
	            );

	            throw new RuntimeException(
	                    "Unauthorized KYC update."
	            );
	        }


	        // =====================================================
	        // 4. Only NEED_CORRECTION KYC Can Be Updated
	        // =====================================================

	        if (entity.getKycStatus() != Enum_Status.NEED_CORRECTION) {

	            logger.warn(
	                    "KYC update rejected. Current status: {}",
	                    entity.getKycStatus()
	            );

	            throw new RuntimeException(
	                    "This KYC application is not waiting for correction."
	            );
	        }


	        // =====================================================
	        // 5. Update Personal Details
	        // =====================================================

	        if (dto.getFullName() != null &&
	            !dto.getFullName().trim().isEmpty()) {

	            entity.setFullName(
	                    dto.getFullName().trim()
	            );
	        }


	        if (dto.getDob() != null) {

	            entity.setDob(
	                    dto.getDob()
	            );
	        }


	        if (dto.getGender() != null &&
	            !dto.getGender().trim().isEmpty()) {

	            entity.setGender(
	                    dto.getGender().trim()
	            );
	        }


	        // =====================================================
	        // 6. Update Address Details
	        // =====================================================

	        if (dto.getAddress() != null &&
	            !dto.getAddress().trim().isEmpty()) {

	            entity.setAddress(
	                    dto.getAddress().trim()
	            );
	        }


	        if (dto.getCity() != null &&
	            !dto.getCity().trim().isEmpty()) {

	            entity.setCity(
	                    dto.getCity().trim()
	            );
	        }


	        if (dto.getState() != null &&
	            !dto.getState().trim().isEmpty()) {

	            entity.setState(
	                    dto.getState().trim()
	            );
	        }


	        if (dto.getPincode() != null &&
	            !dto.getPincode().trim().isEmpty()) {

	            entity.setPincode(
	                    dto.getPincode().trim()
	            );
	        }


	        // =====================================================
	        // 7. Update Aadhaar Number
	        // =====================================================

	        if (dto.getAadhaarNo() != null &&
	            !dto.getAadhaarNo().trim().isEmpty()) {

	            entity.setAadhaarNo(
	                    dto.getAadhaarNo().trim()
	            );
	        }


	        // =====================================================
	        // 8. Update PAN Number
	        // =====================================================

	        if (dto.getPanNo() != null &&
	            !dto.getPanNo().trim().isEmpty()) {

	            entity.setPanNo(
	                    dto.getPanNo().trim()
	            );
	        }


	        // =====================================================
	        // 9. Aadhaar File
	        // =====================================================
	        //
	        // IMPORTANT:
	        // If user uploads a new Aadhaar file,
	        // replace the old file.
	        //
	        // If no new file is uploaded,
	        // keep the existing Aadhaar file.
	        // =====================================================

	        if (aadhaarFile != null &&
	            !aadhaarFile.isEmpty()) {

	            logger.info(
	                    "Uploading corrected Aadhaar file for User ID: {}",
	                    dto.getUserId()
	            );

	            String aadhaarPath =
	                    fileUploadUtil.uploadAadhaar(
	                            aadhaarFile
	                    );

	            entity.setAadhaarFileName(
	                    aadhaarPath
	            );

	            logger.info(
	                    "Corrected Aadhaar file uploaded successfully."
	            );
	        }


	        // =====================================================
	        // 10. PAN File
	        // =====================================================

	        if (panFile != null &&
	            !panFile.isEmpty()) {

	            logger.info(
	                    "Uploading corrected PAN file for User ID: {}",
	                    dto.getUserId()
	            );

	            String panPath =
	                    fileUploadUtil.uploadPan(
	                            panFile
	                    );

	            entity.setPanFileName(
	                    panPath
	            );

	            logger.info(
	                    "Corrected PAN file uploaded successfully."
	            );
	        }


	        // =====================================================
	        // 11. Face Verification Video
	        // =====================================================

	        if (faceVideo != null &&
	            !faceVideo.isEmpty()) {

	            logger.info(
	                    "Uploading corrected face video for User ID: {}",
	                    dto.getUserId()
	            );

	            String faceVideoPath =
	                    fileUploadUtil.uploadFaceVideo(
	                            faceVideo
	                    );

	            entity.setFaceVideoPath(
	                    faceVideoPath
	            );

	            logger.info(
	                    "Corrected face video uploaded successfully."
	            );
	        }


	        // =====================================================
	        // 12. Reset KYC Status
	        // =====================================================

	        entity.setKycStatus(
	                Enum_Status.NEED_CORRECTION
	        );


	      


	        // =====================================================
	        // 14. Save Updated KYC
	        // =====================================================

	        logger.info(
	                "Saving corrected KYC for User ID: {}",
	                dto.getUserId()
	        );

	        Kyc_Entity savedEntity =
	                kycRepository.save(
	                        entity
	                );


	        // =====================================================
	        // 15. Find Existing KYC Review
	        // =====================================================

	        Optional<KycReview_Entity> reviewOptional =
	                kycReviewRepository.findByProfileId(
	                        entity.getProfileId()
	                );


	        if (reviewOptional.isPresent()) {

	            KycReview_Entity review =
	                    reviewOptional.get();


	            // =================================================
	            // 16. Start New Review Cycle
	            // =================================================

	            review.setReviewStatus(
	                    Enum_Status.NEED_CORRECTION
	            );


	            review.setReviewedAt(
	                    null
	            );


	            review.setReviewedBy(
	                    null
	            );


	            // =================================================
	            // 17. Reset Verification Flags
	            // =================================================

	            review.setFullNameVerified(false);

	            review.setDobVerified(false);

	            review.setAddressVerified(false);

	            review.setCityVerified(false);

	            review.setStateVerified(false);

	            review.setPincodeVerified(false);

	            review.setGenderVerified(false);

	            review.setAadhaarNoVerified(false);

	            review.setAadhaarVerified(false);

	            review.setPanNoVerified(false);

	            review.setPanVerified(false);

	            review.setFaceVideoVerified(false);


	            // =================================================
	            // 18. Save Review
	            // =================================================

	            kycReviewRepository.save(
	                    review
	            );


	            logger.info(
	                    "KYC review reset successfully for User ID: {}",
	                    dto.getUserId()
	            );
	        }


	        // =====================================================
	        // 19. Return Updated DTO
	        // =====================================================

	        logger.info(
	                "Corrected KYC updated successfully for User ID: {}",
	                dto.getUserId()
	        );


	        return modelMapper.map(
	                savedEntity,
	                Kyc_Dto.class
	        );


	    } catch (Exception e) {

	        logger.error(
	                "Error while updating corrected KYC for User ID: {}",
	                dto.getUserId(),
	                e
	        );


	        throw new RuntimeException(
	                e.getMessage(),
	                e
	        );
	    }
	}
	
	
	
	
	
	
	
	
	@Override
	@Transactional
	public void adminUpdateCorrectedKyc(
	        AdminKycDecisionDto dto) {

	    // =====================================================
	    // 1. VALIDATE DTO
	    // =====================================================

	    if (dto == null) {

	        throw new RuntimeException(
	                "KYC decision data is required."
	        );
	    }


	    // =====================================================
	    // 2. VALIDATE PROFILE ID
	    // =====================================================

	    if (dto.getProfileId() == null
	            || dto.getProfileId() <= 0) {

	        throw new RuntimeException(
	                "Invalid KYC profile ID."
	        );
	    }


	    // =====================================================
	    // 3. VALIDATE FINAL STATUS
	    // =====================================================

	    String finalStatus = dto.getFinalStatus();

	    if (finalStatus == null
	            || finalStatus.trim().isEmpty()) {

	        throw new RuntimeException(
	                "Final KYC status is required."
	        );
	    }


	    if (!finalStatus.equals("APPROVED")
	            && !finalStatus.equals("NEED_CORRECTION")
	            && !finalStatus.equals("REJECTED")) {

	        throw new RuntimeException(
	                "Invalid KYC status."
	        );
	    }


	    // =====================================================
	    // 4. FIND KYC
	    // =====================================================

	    Kyc_Entity kyc = kycRepository
	            .findById(dto.getProfileId())
	            .orElseThrow(() ->
	                    new RuntimeException(
	                            "KYC application not found."
	                    )
	            );


	    // =====================================================
	    // 5. UPDATE FINAL KYC STATUS
	    // =====================================================

	    kyc.setKycStatus(
	            Enum_Status.valueOf(finalStatus)
	    );

	  


	    // =====================================================
	    // 6. UPDATE DATE
	    // =====================================================

	    kyc.setUpdatedDate(
	            LocalDateTime.now()
	    );


	    // =====================================================
	    // 7. SAVE
	    // =====================================================

	    kycRepository.save(kyc);
	}
	
	
	
	
	
	
	
	
	@Override
	public Kyc_Dto getKycByProfileId(Integer profileId) {

	    if (profileId == null || profileId <= 0) {

	        throw new RuntimeException(
	                "Invalid KYC profile ID."
	        );
	    }


	    Kyc_Entity entity =
	            kycRepository.findByProfileId(profileId);


	    if (entity == null) {

	        throw new RuntimeException(
	                "KYC application not found."
	        );
	    }


	    Kyc_Dto dto =
	            modelMapper.map(
	                    entity,
	                    Kyc_Dto.class
	            );


	    return dto;
	}
	
	
	
	
}