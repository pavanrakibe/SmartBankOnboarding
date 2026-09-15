package com.smartbank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smartbank.dto.Kyc_Dto;
import com.smartbank.exception.KycValidationException;
import com.smartbank.service.Kyc_Service;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
@RequestMapping("/kyc")
public class KycController {
	
	
	@Autowired
	private Kyc_Service kyc_Service;
	

	// Display Complete Kyc Page
	@GetMapping("/completekyc")
	public String completeKyc(Model model, HttpSession session) {

	    Integer userId = (Integer) session.getAttribute("userId");

	  

	    Kyc_Dto result = kyc_Service.getKycByUserId(userId);

	    model.addAttribute("activeMenu", "completekyc");

	    if (result == null) {

	        return "user/complete-kyc";
	    }

	    return "redirect:/user/applicationStatus";
	}
	 
	 
//	  Save Customer KYC
	 
	 @PostMapping(
		        value="/saveKyc",
		        consumes = MediaType.MULTIPART_FORM_DATA_VALUE
		)
		@ResponseBody
		public Map<String,Object> saveKyc(

		        @Valid @ModelAttribute("Kyc_Dto") Kyc_Dto dto,

		        BindingResult result

		)
		{


		    Map<String,Object> response =
		            new HashMap<>();


		    if(result.hasErrors()){


		        response.put(
		                "status",
		                false
		        );


		        response.put(
		                "message",
		                "Validation Failed"
		        );


		        return response;

		    }



		    kyc_Service.saveKyc(dto);



		    response.put(
		            "status",
		            true
		    );


		    response.put(
		            "message",
		            "KYC Completed Successfully"
		    );


		    return response;


		}
	 
	 


}
