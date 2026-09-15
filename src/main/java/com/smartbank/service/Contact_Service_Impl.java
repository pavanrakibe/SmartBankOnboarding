package com.smartbank.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.smartbank.dto.Contact_Dto;
import com.smartbank.entity.Contact_Entity;
import com.smartbank.repository.Contact_Repository;
import com.smartbank.util.EmailUtil;



@Service
public class Contact_Service_Impl implements Contact_Service{
	
	
	
	
	@Autowired
	private Contact_Repository contact_Repository;
	
	
	
	@Autowired
	private ModelMapper modelMapper;
	

	@Autowired
	private EmailUtil emailUtil;
	
	
	
	@Override
	public void saveContactLeads(Contact_Dto dto) {

	    if (contact_Repository.existsByEmail(dto.getEmail())) {

	        throw new RuntimeException(
	            "Email already exists. Please use another email."
	        );
	    }

	    Contact_Entity contact =
	            modelMapper.map(dto, Contact_Entity.class);

	    contact_Repository.save(contact);

	    emailUtil.sendContactLeadEmail(
	        dto.getEmail(),
	        dto.getName()
	    );
	}


	
	
	
	

	@Override
	public Long getContactLeads_Count() {
		
		return contact_Repository.count();
	}






// ===========================================================================
//     Get All Contact Leads With Pagination
	
	@Override
	public Page<Contact_Dto> getAllContactLeads(int page, int size) {
		
		
		Pageable pageable = PageRequest.of(
				page, 
				size,
				Sort.by(
						Sort.Direction.DESC,
						"createdDate"
						
						)
				
				);
		
		
		Page<Contact_Entity> entityPage = contact_Repository.findAll(pageable);
		
		
		return entityPage.map(entity ->
	    modelMapper.map(entity, Contact_Dto.class)
				
		);
		
			
	}







	@Override
	public void deleteLead(Integer id) {

	    if (!contact_Repository.existsById(id)) {

	        throw new RuntimeException(
	            "Lead not found with ID: " + id
	        );
	    }

	    contact_Repository.deleteById(id);
	}


	
	
	
	
	
	
}
