package com.smartbank.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KycReviewDto {

    private Integer reviewId;

    private Integer profileId;

    private boolean fullNameVerified;
    private String fullNameIssue;

    private boolean dobVerified;
    private String dobIssue;

    private boolean genderVerified;
    private String genderIssue;

    private boolean addressVerified;
    private String addressIssue;

    private boolean cityVerified;
    private String cityIssue;

    private boolean stateVerified;
    private String stateIssue;

    private boolean pincodeVerified;
    private String pincodeIssue;
    
    
    
    private boolean aadhaarNoVerified;
    private String aadhaarNoIssue;
    
    private boolean panNoVerified;
    private String panNoIssue;

    
//    adhar image
    private boolean aadhaarVerified;
    private String aadhaarIssue;

    
//    pan image
    private boolean panVerified;
    private String panIssue;

    private boolean faceVideoVerified;
    private String faceVideoIssue;

    private String adminRemarks;

    private String reviewStatus;

    private Integer reviewedBy;

    // getters and setters
}