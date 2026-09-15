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


public class Contact_Dto {
	
	private Integer id;
	
	private String name;
	
	private String email;
	
	private String mobile;
	
	private String subject;
	
	private String message;
	
	private LocalDateTime createdDate;
	
	

}
