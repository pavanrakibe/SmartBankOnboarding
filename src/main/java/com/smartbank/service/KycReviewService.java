package com.smartbank.service;

import com.smartbank.dto.KycReviewDto;

public interface KycReviewService {

    void saveReview(KycReviewDto dto);
    
   
    
    KycReviewDto getReviewByProfileId(Integer profileId);
    
    
    

}