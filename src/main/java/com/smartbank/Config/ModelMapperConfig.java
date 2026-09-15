package com.smartbank.Config;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.smartbank.dto.Kyc_Dto;
import com.smartbank.entity.Kyc_Entity;

@Configuration
public class ModelMapperConfig {

    @Bean
    public ModelMapper modelMapper() {

        ModelMapper modelMapper = new ModelMapper();

        // Use strict matching
        modelMapper.getConfiguration()
                .setMatchingStrategy(
                        MatchingStrategies.STRICT
                );

        // =====================================================
        // KYC DTO -> ENTITY
        // =====================================================

        modelMapper.typeMap(
                Kyc_Dto.class,
                Kyc_Entity.class
        ).addMappings(mapper -> {

            // Do NOT automatically map uploaded files
            mapper.skip(
                    Kyc_Entity::setAadhaarFileName
            );

            mapper.skip(
                    Kyc_Entity::setPanFileName
            );

            mapper.skip(
                    Kyc_Entity::setFaceVideoPath
            );

        });

        return modelMapper;
    }
}