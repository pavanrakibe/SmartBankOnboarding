package com.smartbank.service;

import com.smartbank.dto.User_Dto;
import com.smartbank.entity.User_Entity;

public interface AuthService {

    User_Dto login(User_Dto dto);
    
    
    User_Entity findByEmail(String email);

    void updatePassword(String email, String password);
    
//    ============================================================================================
    
    // for Register
    void register(User_Dto dto);
    
    
    boolean updateUser(User_Dto dto) throws Exception;
    
    
    
    User_Dto getUserById(Integer user_id);


}