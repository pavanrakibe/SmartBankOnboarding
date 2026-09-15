package com.smartbank.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.smartbank.enum_package.Enum_Status;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "customer_kyc")
public class Kyc_Entity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "profile_id")
    private Integer profileId;


    @Column(name = "user_id", nullable = false, unique = true)
    private Integer userId;


    @Column(name = "full_name", nullable = false, length = 100)
    private String fullName;


    @Column(name = "dob", nullable = false)
    private LocalDate dob;


    @Column(name = "gender", nullable = false, length = 10)
    private String gender;


    @Column(name = "address", nullable = false)
    private String address;


    @Column(name = "city", nullable = false, length = 50)
    private String city;


    @Column(name = "state", nullable = false, length = 50)
    private String state;


    @Column(name = "pincode", nullable = false, length = 10)
    private String pincode;


    @Column(name = "aadhaar_no", nullable = false,length = 20)
    private String aadhaarNo;


    @Column(name = "pan_no", nullable = false, length = 20)
    private String panNo;

         
    @Column(name = "aadhaar_file_name")
    private String aadhaarFileName;


    @Column(name = "pan_file_name")
    private String panFileName;


    @Column(name = "face_video_path")
    private String faceVideoPath;


    @Column(name = "upload_date", nullable = false)
    private LocalDateTime uploadDate;


    @Enumerated(EnumType.STRING)
    @Column(name = "kyc_status")
    private Enum_Status kycStatus;



    @Column(name = "created_date", nullable = false)
    private LocalDateTime createdDate;


    @Column(name = "updated_date")
    private LocalDateTime updatedDate;



    /*
       Automatically execute before saving first time
    */
    @PrePersist
    public void prePersist() {

        this.createdDate = LocalDateTime.now();
        this.uploadDate = LocalDateTime.now();

        if(this.kycStatus == null) {
            this.kycStatus = Enum_Status.PENDING;
        }
    }



    /*
       Automatically execute before update
    */
    @PreUpdate
    public void preUpdate() {

        this.updatedDate = LocalDateTime.now();

    }
    
    



}