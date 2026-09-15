package com.smartbank.service;


import java.util.List;

import org.springframework.data.domain.Page;

import com.smartbank.dto.User_Dto;

public interface User_Service {
	
	
	User_Dto getById(Integer userId);
	
	
	
	Long getAllCustomerCount();
	
	
	
	User_Dto getByEmail(String email);

	
	
	Page<User_Dto> getAllCustomer(int page, int size);


	
	User_Dto updateCustomer(User_Dto dto);
	
	
	void deleteCustomer(Integer userId);
	


  
}
