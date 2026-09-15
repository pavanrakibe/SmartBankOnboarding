package com.smartbank.dto;



import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class Kyc_Dto {


    private Integer userId;



    @NotBlank(message = "Full name is required")
    private String fullName;



    @NotNull(message = "Date of birth is required")
    private LocalDate dob;



    @NotBlank(message = "Gender is required")
    private String gender;



    @NotBlank(message = "Address is required")
    private String address;



    @NotBlank(message = "City is required")
    private String city;



    @NotBlank(message = "State is required")
    private String state;



    @NotBlank(message = "Pincode is required")
    @Size(min = 6, max = 6, message = "Pincode must be 6 digits")
    private String pincode;



    @NotBlank(message = "Aadhaar number is required")
    @Pattern(
        regexp = "^[0-9]{12}$",
        message = "Aadhaar must contain 12 digits"
    )
    private String aadhaarNo;



    @NotBlank(message = "PAN number is required")
    @Pattern(
        regexp = "^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
        message = "Invalid PAN format"
    )
    private String panNo;
    
    
    
 // ==========================
 // Display Fields (No Validation)
 // ==========================

 private Integer profileId;

 private String aadhaarFileName;

 private String panFileName;

 private String faceVideoPath;

 private LocalDateTime uploadDate;

 private String kycStatus;


 private LocalDateTime createdDate;

 private LocalDateTime updatedDate;



    private MultipartFile aadhaarFile;


    private MultipartFile panFile;


    private MultipartFile faceVideo;


}