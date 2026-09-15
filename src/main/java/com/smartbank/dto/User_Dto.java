package com.smartbank.dto;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor


@Builder


public class User_Dto {

    private Integer userId;

    private String name;

    private String password;

    private String email;

    private String mobile;

    private String role;

    private LocalDateTime createdAt;


   
}