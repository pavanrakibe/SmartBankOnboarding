package com.smartbank.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smartbank.dto.KycReviewDto;
import com.smartbank.dto.Kyc_Dto;
import com.smartbank.dto.User_Dto;
import com.smartbank.service.Kyc_Service;
import com.smartbank.service.User_Service;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/user")
public class UserController {
	
	
	
	@Autowired
	private Kyc_Service kyc_Service;
	
	
	@Autowired
	private User_Service user_Service;
	
	

	@Autowired
	private ModelMapper modelMapper;
	
	

	  
	  
	  
	
	  @GetMapping("/dashboard")
	  public String DashboardPage(
	          Model model,
	          HttpSession session) {

	      // Get userId from session
	      Integer userId =
	              (Integer) session.getAttribute("userId");
	      
	      
	      String useremail =
	              (String) session.getAttribute("useremail");
	      

	      // Session is not valid
	      if (useremail == null) {
	          return "redirect:/auth/login";
	      }
	      
	      
	      User_Dto userData = this.user_Service.getById(userId);


	      
	      // Session is valid → get KYC data
	      Kyc_Dto kycData =
	              this.kyc_Service.getKycByUserId(userId);
	      

	      // Send KYC data to JSP
	      model.addAttribute("kycData", kycData);
	      
//	      add data session userId
	      model.addAttribute("userData",userData);

	      // Active menu
	      model.addAttribute("activeMenu", "dashboard");

	      return "user/dashboard";
	  }
	 
	 
	 
	  
	  
	  @GetMapping("/profile")
		public String displayProfilePage(Model model,HttpSession session)
		{
		  
		  // Get userId from session
	      String email =
	              (String) session.getAttribute("useremail");
	      
	      
	      if (email == null || email.trim().isEmpty()) {
	    	    throw new RuntimeException("User session expired. Please login again.");
	    	}

		  
		  User_Dto data = this.user_Service.getByEmail(email);
		  
		  model.addAttribute("userData",data);
		  
		    model.addAttribute("activeMenu","profile");

		    
			return "user/profile";
		}
	 
	 
	  
	  
	  
	  
	 // ======================================================================
	  @GetMapping("/applicationStatus")
	  public String applicationStatus(
	          Model model,
	          HttpSession session) {

	      // ==========================================
	      // 1. Get logged-in user
	      // ==========================================

	      Integer userId =
	              (Integer) session.getAttribute("userId");


	      if (userId == null) {

	          return "redirect:/auth/login";
	      }


	      // ==========================================
	      // 2. Get KYC
	      // ==========================================

	      Kyc_Dto result =
	              this.kyc_Service.getKycByUserId(userId);


	      // ==========================================
	      // 3. KYC not submitted
	      // ==========================================

	      if (result == null ||
	          result.getUserId() == null) {

	          return "redirect:/kyc/completekyc";
	      }


	      // ==========================================
	      // 4. Add KYC
	      // ==========================================

	      model.addAttribute(
	              "kycData",
	              result
	      );


	      // ==========================================
	      // 5. Get review
	      // ==========================================

	      if (result.getProfileId() != null) {

	          KycReviewDto review =
	                  kyc_Service.getReviewByProfileId(
	                          result.getProfileId()
	                  );

	          model.addAttribute(
	                  "kycReview",
	                  review
	          );
	      }


	      return "user/applicationStatus";
	  }
	 
	  
	  
	  
	  @GetMapping("/correction")
	  public String correctionKyc(
	          Model model,
	          HttpSession session) {

	      // =====================================================
	      // 1. Get logged-in user
	      // =====================================================

	      Integer userId =
	              (Integer) session.getAttribute("userId");

	      if (userId == null) {

	          return "redirect:/auth/login";
	      }


	      // =====================================================
	      // 2. Get KYC data
	      // =====================================================

	      Kyc_Dto kycData =
	              kyc_Service.getKycByUserId(userId);


	      if (kycData == null) {

	          return "redirect:/kyc/completekyc";
	      }


	      // =====================================================
	      // 3. Get correction review
	      // =====================================================

	      KycReviewDto kycReview =
	              kyc_Service.getKycCorrectionReview(userId);


	      if (kycReview == null) {

	          return "redirect:/user/applicationStatus";
	      }


	      // =====================================================
	      // 4. Verify status
	      // =====================================================

	      if (!"NEED_CORRECTION".equalsIgnoreCase(
	              kycData.getKycStatus())) {

	          return "redirect:/user/applicationStatus";
	      }


	      // =====================================================
	      // 5. Send data to JSP
	      // =====================================================

	      model.addAttribute(
	              "kycData",
	              kycData
	      );

	      model.addAttribute(
	              "kycReview",
	              kycReview
	      );

	      model.addAttribute(
	              "activeMenu",
	              "applicationStatus"
	      );


	      return "user/kyc-correction";
	  }
	  
	  
	  
	  
	  @PostMapping(
		        value = "/update-correction",
		        consumes = MediaType.MULTIPART_FORM_DATA_VALUE
		)
		public String updateCorrection(

		        @ModelAttribute Kyc_Dto dto,

		        @RequestParam(
		                value = "aadhaarFile",
		                required = false
		        )
		        MultipartFile aadhaarFile,

		        @RequestParam(
		                value = "panFile",
		                required = false
		        )
		        MultipartFile panFile,

		        @RequestParam(
		                value = "faceVideo",
		                required = false
		        )
		        MultipartFile faceVideo,

		        HttpSession session,

		        RedirectAttributes redirectAttributes) {


		    // ==========================================
		    // 1. Session user
		    // ==========================================

		    Integer sessionUserId =
		            (Integer) session.getAttribute("userId");


		    if (sessionUserId == null) {

		        return "redirect:/auth/login";
		    }


		    // ==========================================
		    // 2. Security check
		    // ==========================================

		    if (dto.getUserId() == null ||
		        !sessionUserId.equals(dto.getUserId())) {

		        redirectAttributes.addFlashAttribute(
		                "errorMessage",
		                "Invalid KYC request."
		        );

		        return "redirect:/user/applicationStatus";
		    }


		    try {

		        // ======================================
		        // 3. Update corrected KYC
		        // ======================================

		        kyc_Service.updateCorrectedKyc(
		                dto,
		                aadhaarFile,
		                panFile,
		                faceVideo
		        );


		        // ======================================
		        // 4. Success
		        // ======================================

		        redirectAttributes.addFlashAttribute(
		                "successMessage",
		                "Your corrected KYC has been submitted successfully. Our team will review it again."
		        );


		    } catch (Exception e) {

		        e.printStackTrace();


		        redirectAttributes.addFlashAttribute(
		                "errorMessage",
		                e.getMessage()
		        );
		    }


		    return "redirect:/user/applicationStatus";
		}
	  
	  
	  
	 
	 
	 @GetMapping("/customerLogout")
	 public String customerLogout(HttpSession session) {

	     // Remove customer session attributes
	     session.removeAttribute("userId");
	     session.removeAttribute("name");
	     session.removeAttribute("useremail");
	     session.removeAttribute("role");

	     // Redirect to customer login
	     return "redirect:/auth/login";
	 }

	
	

}
