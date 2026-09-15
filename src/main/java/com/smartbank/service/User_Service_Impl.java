package com.smartbank.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.smartbank.dto.User_Dto;
import com.smartbank.entity.Kyc_Entity;
import com.smartbank.entity.User_Entity;
import com.smartbank.enum_package.Enum_File;
import com.smartbank.exception.CustomerException;
import com.smartbank.repository.BankAccount_Repository;
import com.smartbank.repository.Kyc_Repository;
import com.smartbank.repository.User_Repository;






@Service
public class User_Service_Impl  implements User_Service{
	
	
	@Autowired
	private User_Repository user_Repository;
	
	
	@Autowired
	private ModelMapper modelMapper;
	
	
	
	@Autowired
	private Kyc_Repository kyc_Repository;

	@Autowired
	private BankAccount_Repository bankAccount_Repository;
	
	

	@Override
	public User_Dto getById(Integer userId) {

	    Optional<User_Entity> userData =
	    		
	    		
	            user_Repository.findById(userId);

	    if (userData.isEmpty()) {

	        throw new RuntimeException(
	            "User not found with ID: " + userId
	        );
	    }

	    User_Entity user = userData.get();

	    return modelMapper.map(
	            user,
	            User_Dto.class
	    );
	}


	
	
	
	// get All Count of Users
	@Override
	public Long getAllCustomerCount() {
		
		return this.user_Repository.countByRole(Enum_File.CUSTOMER);
	}





	@Override
	public User_Dto getByEmail(String email) {
		
		Optional<User_Entity> userData = this.user_Repository.findByEmail(email);
		
		   if (userData.isEmpty()) {

		        throw new RuntimeException(
		            "User not found with ID: " + email
		        );
		    }

		    User_Entity user = userData.get();

		    return modelMapper.map(
		            user,
		            User_Dto.class
		    );
	}



	@Override
	public Page<User_Dto> getAllCustomer(int page, int size) {

	    try {

	        Pageable pageable = PageRequest.of(
	                page,
	                size,
	                Sort.by("userId").descending()
	        );

	        Page<User_Entity> userData =
	                user_Repository.findByRole(
	                        Enum_File.CUSTOMER,
	                        pageable
	                );

	        return userData.map(
	                user -> modelMapper.map(
	                        user,
	                        User_Dto.class
	                )
	        );

	    } catch (Exception e) {

	        // Log actual technical error
	        e.printStackTrace();

	        // Throw custom business exception
	        throw new CustomerException(
	                "Unable to fetch customer data.",
	                e
	        );
	    }
	}




	@Override
	public User_Dto updateCustomer(User_Dto dto) {

	    Optional<User_Entity> userData =
	            user_Repository.findById(dto.getUserId());

	    if (userData.isEmpty()) {

	        throw new CustomerException(
	                "Customer Not Found With Id : "
	                + dto.getUserId()
	        );
	    }

	    // Existing entity from database
	    User_Entity data = userData.get();

	    // Update only editable fields
	    data.setName(dto.getName());
	    data.setEmail(dto.getEmail());
	    data.setMobile(dto.getMobile());

	    // Save existing entity
	    User_Entity updateData =
	            user_Repository.save(data);

	    // Entity -> DTO
	    return modelMapper.map(
	            updateData,
	            User_Dto.class
	    );
	}





	@Override
	public void deleteCustomer(Integer userId) {

		
		Optional<User_Entity> userData = user_Repository.findById(userId);
		
		
		if(userData.isEmpty())
		{
			throw new RuntimeException(
					  "Customer Not Found With Id : "+userId
					);
		}
		
		
		user_Repository.deleteById(userId);
		
	}
	
	
	
	
	

	
	
}
