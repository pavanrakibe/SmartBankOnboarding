package com.smartbank.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor


@Builder

public class AdminKycDecisionDto {

    private Integer profileId;

    private Integer userId;


    private String fullNameStatus;
    private String fullNameRemarks;


    private String dobStatus;
    private String dobRemarks;


    private String genderStatus;
    private String genderRemarks;


    private String addressStatus;
    private String addressRemarks;


    private String cityStatus;
    private String cityRemarks;


    private String stateStatus;
    private String stateRemarks;


    private String pincodeStatus;
    private String pincodeRemarks;


    private String aadhaarNoStatus;
    private String aadhaarNoRemarks;


    private String aadhaarStatus;
    private String aadhaarRemarks;


    private String panNoStatus;
    private String panNoRemarks;


    private String panStatus;
    private String panRemarks;


    private String faceVideoStatus;
    private String faceVideoRemarks;


    private String finalStatus;

    private String adminRemarks;


  
}