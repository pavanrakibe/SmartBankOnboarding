package com.smartbank.service;

import org.springframework.data.domain.Page;

import com.smartbank.dto.Contact_Dto;

public interface Contact_Service {
	
	
	void saveContactLeads(Contact_Dto dto);
	
	
	Long getContactLeads_Count();
	
	
	
	// new pagination method
	Page<Contact_Dto> getAllContactLeads(int page,int size);
	
	
//	delete contact list
	void deleteLead(Integer Id);

}
