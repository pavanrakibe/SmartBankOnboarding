package com.smartbank.entity;

import java.time.LocalDateTime;

import com.smartbank.enum_package.Enum_File;

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
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor


@Builder



@Entity
@Table(name = "user")
public class User_Entity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "password", nullable = false, length = 255)
    private String password;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "mobile", nullable = false, length = 15)
    private String mobile;

    @Enumerated(EnumType.STRING)
    @Column(name = "role")
    private Enum_File role;
    
    

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;


    /*
    Automatically execute before saving first time
 */
 @PrePersist
 public void prePersist() {

     this.createdAt = LocalDateTime.now();
    
 }

   }





