package com.smartbank.entity;

import java.time.LocalDateTime;

import com.smartbank.enum_package.Enum_Status;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "kyc_review")
public class KycReview_Entity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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

//  adhar image
	private boolean aadhaarVerified;
	private String aadhaarIssue;

//  pan image
	private boolean panVerified;
	private String panIssue;

	private boolean faceVideoVerified;
	private String faceVideoIssue;

	@Column(columnDefinition = "TEXT")
	private String adminRemarks;

	@Enumerated(EnumType.STRING)
	@Column(name = "review_status")
	private Enum_Status reviewStatus;
	
	
	private Integer reviewedBy;

	private LocalDateTime reviewedAt;

	/*
	 * Automatically execute before saving first time
	 */
	@PrePersist
	public void prePersist() {

		this.reviewedAt = LocalDateTime.now();

	}

}