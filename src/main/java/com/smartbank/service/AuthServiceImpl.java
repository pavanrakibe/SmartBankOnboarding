package com.smartbank.service;

import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smartbank.dto.User_Dto;
import com.smartbank.entity.User_Entity;
import com.smartbank.enum_package.Enum_File;

import com.smartbank.exception.LoginException;
import com.smartbank.repository.AuthRepository;
import com.smartbank.util.PasswordUtil;

@Service
public class AuthServiceImpl implements AuthService {
	
    @Autowired
    private ModelMapper modelMapper;
	
	
	
    @Autowired
    private AuthRepository authRepository;
    
    
    

    public AuthServiceImpl(AuthRepository loginRepository) {
        this.authRepository = loginRepository;
    }

    // =====================================================
    // REGISTER
    // =====================================================

    @Override
    public void register(User_Dto dto) {

    	
    	User_Entity userData = modelMapper.map(dto, User_Entity.class);
    	
    	
        // 1. Check whether email already exists
    	User_Entity existingUser =
        		authRepository.findByEmail(userData.getEmail()).orElse(null);

        if (existingUser != null) {
            throw new RuntimeException(
                "Email already registered. Please use another email."
            );
        }

        // 2. Encrypt password
        userData.setPassword(
            PasswordUtil.encrypt(userData.getPassword())
        );

        // 3. Set default role
        userData.setRole(Enum_File.CUSTOMER);

        
 
        
        // 4. Save user
        
        this.authRepository.save(userData);

      
    }

    // =====================================================
    // LOGIN
    // =====================================================

    @Override
    public User_Dto login(User_Dto dto) {
    	
    	

    	User_Entity user =
        		authRepository.findByEmail(dto.getEmail()).orElse(null);

        // User not found
        if (user == null) {
        	throw new LoginException("Email is not registered.");
        }

        // Check password
        boolean passwordMatches =
                PasswordUtil.matches(
                    dto.getPassword(),
                    user.getPassword()
                );

        if (!passwordMatches) {
        	throw new LoginException("Incorrect password.");
        }
        
        
        
        return modelMapper.map(user, User_Dto.class); 
        
        
       
    

    }

    // =====================================================
    // FIND USER BY EMAIL
    // =====================================================

    @Override
    public User_Entity findByEmail(String email) {

        return authRepository.findByEmail(email).orElse(null);
    }

    // =====================================================
    // UPDATE PASSWORD
    // =====================================================

    @Override
    public void updatePassword(String email, String password) {

    	User_Entity user =
        		authRepository.findByEmail(email).orElse(null);

        if (user != null) {

            user.setPassword(
                PasswordUtil.encrypt(password)
            );

            authRepository.save(user);
        }
    }
    
    
    
    
    
    
    // ==========================================================
    // UPDATE USER
    // ==========================================================
    
	@Override
	public User_Dto getUserById(Integer user_id) {
		
      Optional<User_Entity> data = this.authRepository.findById(user_id);
      
      return modelMapper.map(data, User_Dto.class); 
	}
    
	
	@Override
	public boolean updateUser(User_Dto dto) throws Exception {

	    try {

	    	User_Entity userData = authRepository
	                .findById(dto.getUserId())
	                .orElse(null);

	        if (userData == null) {
	            throw new Exception("User not found");
	        }

	        // Update user fields
	        userData.setName(dto.getName());
	        userData.setEmail(dto.getEmail());
	        userData.setMobile(dto.getMobile());

	        // Update password only if entered
	        if (dto.getPassword() != null &&
	                !dto.getPassword().trim().isEmpty()) {

	            userData.setPassword(dto.getPassword());
	        }

	        authRepository.save(userData);

	        return true;

	    } catch (Exception e) {

	        throw new Exception("User update failed: " + e.getMessage());
	    }
	}


    
}