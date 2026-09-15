package com.smartbank.controller;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smartbank.dto.AdminKycDecisionDto;
import com.smartbank.dto.Contact_Dto;
import com.smartbank.dto.KycReviewDto;
import com.smartbank.dto.Kyc_Dto;
import com.smartbank.dto.User_Dto;
import com.smartbank.exception.KycException;
import com.smartbank.service.AuthService;
import com.smartbank.service.BankAccount_Service;
import com.smartbank.service.Contact_Service;
import com.smartbank.service.KycReviewService;
import com.smartbank.service.Kyc_Service;
import com.smartbank.service.User_Service;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	
	@Autowired
	private Kyc_Service kyc_Service;
	
	@Autowired
	private Contact_Service contact_Service;
	
	@Autowired
	private AuthService authService;

	
	@Autowired
	private User_Service user_Service;
	
	@Autowired
	private KycReviewService kycReviewService;
	
	
	 @Autowired
	    private BankAccount_Service bankAccount_Service;
	 

	
	@GetMapping("/dashboard")
	public String getAdminDashboardPage(
					    @RequestParam(
				                name = "page",
				                defaultValue = "0"
				            )
				            int page,
			
				            @RequestParam(
				                name = "size",
				                defaultValue = "2"
				            )
				            int size,
			
				            Model model,
				            HttpSession session
			
							)
	{
		
		
	      
		String adminName = (String) session.getAttribute("adminName");

		 model.addAttribute("adminName",adminName);
		 
		
		
		// get Application Count
		 Long application_count = kyc_Service.getAllApplicationCount();
		
		 
		 // get Contact Leads Count 
		Long contactLead_count=contact_Service.getContactLeads_Count();
		
		
		// get Customer Count		
		Long customer_count = user_Service.getAllCustomerCount();
		
	
		
		// bank accounts count
        long totalAccounts = bankAccount_Service.getTotalBankAccounts();
		
		

		 model.addAttribute("application_count",application_count);
		 
		 model.addAttribute("contactLead_count",contactLead_count);
		 
		 model.addAttribute("customer_count",customer_count);
		 
	    model.addAttribute("totalAccounts", totalAccounts);

		 
//		 ========================================================================
//		 Contact Leads All List With Pagination
		 Page<Contact_Dto> leadPage = contact_Service.getAllContactLeads(page, size);

		    model.addAttribute(
	                "leads",
	                leadPage.getContent()
	        );

	        model.addAttribute(
	                "currentPage",
	                page
	        );

	        model.addAttribute(
	                "pageSize",
	                size
	        );

	        model.addAttribute(
	                "totalPages",
	                leadPage.getTotalPages()
	        );

	        model.addAttribute(
	                "totalElements",
	                leadPage.getTotalElements()
	        );

	        model.addAttribute(
	                "activeMenu",
	                "customerLeads"
	        );
		 

		 
	    // Active menu
	      model.addAttribute("activeMenu", "dashboard");
 
	      
		return "admin/dashboard";
	}
	
	
	
	
	@GetMapping("/deleteLead")
	public String deleteLead(
	        @RequestParam("id") Integer id,
	        RedirectAttributes redirectAttributes,HttpSession session) {

	    try {
	    	
	      

	        contact_Service.deleteLead(id);

	        redirectAttributes.addFlashAttribute(
	            "successMessage",
	            "Lead deleted successfully."
	        );

	    } catch (Exception e) {

	        redirectAttributes.addFlashAttribute(
	            "errorMessage",
	            e.getMessage()
	        );
	    }

	    return "redirect:/admin/dashboard";
	}
	
	
	
	
	
	@GetMapping("/profile")
	public String getProfile(Model model,HttpSession session)
	{  
		
		
		try {
				 		 
		 
		  // Get userId from session
	      String email =
	              (String) session.getAttribute("adminemail");
	      
	    
	      if(email==null)
			 {
				

				 
				 throw new RuntimeException("User Email Session not found.");
				 
			 }
		  
		  User_Dto data = this.user_Service.getByEmail(email);
		  
		  
			 if(data==null)
			 {
				 throw new RuntimeException("User Session not found.");
				 
			 }
			 
		  
		  model.addAttribute("userData",data);
		
		// Active menu
	      model.addAttribute("activeMenu", "profile");

		
		}catch(Exception e) {
			model.addAttribute("errorMessage",e.getMessage());
		}
		
		
		return "admin/admin_profile";

	}
	
	
	
	
	@GetMapping("/customer-list")
	public String getCustomerList(

	        @RequestParam(
	                name = "page",
	                defaultValue = "0"
	        ) int page,

	        @RequestParam(
	                name = "size",
	                defaultValue = "5"
	        ) int size,

	        Model model
	) {

	    Page<User_Dto> customerPage =
	            user_Service.getAllCustomer(page, size);

	    model.addAttribute(
	            "customers",
	            customerPage.getContent()
	    );

	    model.addAttribute(
	            "currentPage",
	            page
	    );

	    model.addAttribute(
	            "pageSize",
	            size
	    );

	    model.addAttribute(
	            "totalPages",
	            customerPage.getTotalPages()
	    );

	    model.addAttribute(
	            "totalElements",
	            customerPage.getTotalElements()
	    );

	    model.addAttribute(
	            "activeMenu",
	            "customer"
	    );

	    return "admin/admin_customerd_list";
	}
	
	
	
	
	

	
	@GetMapping("/pending-application")
	public String pendingKyc(

	        @RequestParam(
	                name = "page",
	                defaultValue = "0"
	        ) int page,

	        @RequestParam(
	                name = "size",
	                defaultValue = "2"
	        ) int size,

	        Model model
	) {

	    if (size <= 0) {
	        size = 2;
	    }

	    Page<Kyc_Dto> kycPage =
	            kyc_Service.getPendingKyc(
	                    page,
	                    size
	            );

	    model.addAttribute(
	            "kycList",
	            kycPage.getContent()
	    );

	    model.addAttribute(
	            "currentPage",
	            page
	    );

	    model.addAttribute(
	            "pageSize",
	            size
	    );

	    model.addAttribute(
	            "totalPages",
	            kycPage.getTotalPages()
	    );

	    model.addAttribute(
	            "totalElements",
	            kycPage.getTotalElements()
	    );

	    model.addAttribute(
	            "activeMenu",
	            "kyc"
	    );

	    return "admin/pending_application";
	}
	
	

	
	

	@GetMapping("/approve-application")
	public String approveKyc(

	        @RequestParam(
	                name = "page",
	                defaultValue = "0"
	        ) int page,

	        @RequestParam(
	                name = "size",
	                defaultValue = "2"
	        ) int size,

	        Model model
	) {

	    if (size <= 0) {
	        size = 2;
	    }

	    Page<Kyc_Dto> kycPage =
	            kyc_Service.getApproveKyc(
	                    page,
	                    size
	            );

	    model.addAttribute(
	            "kycList",
	            kycPage.getContent()
	    );

	    model.addAttribute(
	            "currentPage",
	            page
	    );

	    model.addAttribute(
	            "pageSize",
	            size
	    );

	    model.addAttribute(
	            "totalPages",
	            kycPage.getTotalPages()
	    );

	    model.addAttribute(
	            "totalElements",
	            kycPage.getTotalElements()
	    );

	    model.addAttribute(
	            "activeMenu",
	            "kyc"
	    );

	    return "admin/approve_application";
	}
	
	
	
	
	


	@GetMapping("/reject-application")
	public String rejectKyc(

	        @RequestParam(
	                name = "page",
	                defaultValue = "0"
	        ) int page,

	        @RequestParam(
	                name = "size",
	                defaultValue = "2"
	        ) int size,

	        Model model
	) {

	    if (size <= 0) {
	        size = 2;
	    }

	    Page<Kyc_Dto> kycPage =
	            kyc_Service.getRejectKyc(
	                    page,
	                    size
	            );

	    model.addAttribute(
	            "kycList",
	            kycPage.getContent()
	    );

	    model.addAttribute(
	            "currentPage",
	            page
	    );

	    model.addAttribute(
	            "pageSize",
	            size
	    );

	    model.addAttribute(
	            "totalPages",
	            kycPage.getTotalPages()
	    );

	    model.addAttribute(
	            "totalElements",
	            kycPage.getTotalElements()
	    );

	    model.addAttribute(
	            "activeMenu",
	            "kyc"
	    );

	    return "admin/reject_application";
	}
	
	
	
	
	
	
	@GetMapping("/need-correction-application")
	public String needcorrectionKyc(

	        @RequestParam(
	                name = "page",
	                defaultValue = "0"
	        ) int page,

	        @RequestParam(
	                name = "size",
	                defaultValue = "2"
	        ) int size,

	        Model model
	) {

	    if (size <= 0) {
	        size = 2;
	    }

	    Page<Kyc_Dto> kycPage =
	            kyc_Service.getNeedCorrectionKyc(
	                    page,
	                    size
	            );

	    model.addAttribute(
	            "kycList",
	            kycPage.getContent()
	    );

	    model.addAttribute(
	            "currentPage",
	            page
	    );

	    model.addAttribute(
	            "pageSize",
	            size
	    );

	    model.addAttribute(
	            "totalPages",
	            kycPage.getTotalPages()
	    );

	    model.addAttribute(
	            "totalElements",
	            kycPage.getTotalElements()
	    );

	    model.addAttribute(
	            "activeMenu",
	            "kyc"
	    );

	    return "admin/need_correction_application";
	}
	
	
	
	
	
	
	
	
	

	
	
	@GetMapping("/adminLogout")
	public String adminLogout(HttpSession session) {

	    // Remove admin session attributes
	    session.removeAttribute("adminUserId");
	    session.removeAttribute("adminName");
	    session.removeAttribute("adminemail");
	    session.removeAttribute("adminRole");

	    // Redirect to admin login
	    return "redirect:/auth/login";
	}
	
	
	
	
	@PostMapping("/updateUser_Logic")
	public String updateUser_Logic(
	        @ModelAttribute User_Dto dto,
	        RedirectAttributes redirectAttributes) {

	    try {

	        authService.updateUser(dto);

	        redirectAttributes.addFlashAttribute(
	                "successMessage",
	                "User updated successfully"
	        );

	    } catch (Exception e) {

	        redirectAttributes.addFlashAttribute(
	                "errorMessage",
	                e.getMessage()
	        );
	        
	        System.out.println(e.getMessage());
	    }

	    return "redirect:/admin/profile";
	}
	
	
	
	
	
	@PostMapping("/customer/update")
	public String udpateCustomer(@ModelAttribute User_Dto dto,RedirectAttributes redirectAttributes)
	{
		
		this.user_Service.updateCustomer(dto);
		
		
	    redirectAttributes.addFlashAttribute(
	            "successMessage",
	            "Customer updated successfully."
	    );
		
		return "redirect:/admin/customer-list";
		
	}
	
	
	
	
	
	@PostMapping("/customer/delete/{userId}")
	public String deleteCustomer(@PathVariable("userId") Integer userId,RedirectAttributes redirectAttributes)
	{
		
		this.user_Service.deleteCustomer(userId);
		
		
		redirectAttributes.addFlashAttribute(
				"successMessage",
				"Customer Delete successfully"
				);
		
		
		return "redirect:/admin/customer-list";
	}
	
	
	
	
	
	

	
	@PostMapping("/deleteKyc/{profileId}")
	public String deleteKyc(
	        @PathVariable Integer profileId,
	        RedirectAttributes redirectAttributes) {

	    try {

	        kyc_Service.deleteKyc(profileId);

	        redirectAttributes.addFlashAttribute(
	                "successMessage",
	                "KYC application deleted successfully."
	        );

	    } catch (KycException e) {

	        redirectAttributes.addFlashAttribute(
	                "errorMessage",
	                e.getMessage()
	        );
	    }

	    return "redirect:/admin/pending-application";
	}
	
	
	
	
	

	@GetMapping("/admin_Feedback_Kyc/{profileId}")
	public String adminFeedbackKyc(
	        @PathVariable Integer profileId,
	        Model model) {

	    try {

	        Kyc_Dto kycData =
	                kyc_Service.getKycById(profileId);
	        
	        

	        if (kycData == null) {
	            return "redirect:/admin/pending-application";
	        }

	        model.addAttribute("kycData", kycData);

	        return "admin/admin_Feedback_Kyc";
	        
	        

	    } catch (Exception e) {

	        e.printStackTrace();

	        return "redirect:/admin/pending-application";
	    }
	}
	
	
	
	
	

	@GetMapping("/approve_kyc_single_view/{profileId}")
	public String approve_kyc_single_view(
	        @PathVariable Integer profileId,
	        Model model) {

	    try {

	        Kyc_Dto kycData =
	                kyc_Service.getKycById(profileId);
	        
	        

	        if (kycData == null) {
	            return "redirect:/admin/approve-application";
	        }

	        model.addAttribute("kycData", kycData);

	        return "admin/approve_kyc_single_view";
	        
	        

	    } catch (Exception e) {

	        e.printStackTrace();

	        return "redirect:/admin/approve-application";
	    }
	}
	
	
	
	
	

	@GetMapping("/rejected_kyc_single_view/{profileId}")
	public String rejected_kyc_single_view(
	        @PathVariable Integer profileId,
	        Model model) {

	    try {

	        Kyc_Dto kycData =
	                kyc_Service.getKycById(profileId);
	        
	        

	        if (kycData == null) {
	            return "redirect:/admin/reject_application";
	        }

	        model.addAttribute("kycData", kycData);

	        return "admin/rejected_kyc_single_view";
	        
	        

	    } catch (Exception e) {

	        e.printStackTrace();

	        return "redirect:/admin/reject-application";
	    }
	}
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("/saveKycReview")
	public String saveKycReview(
	        @ModelAttribute KycReviewDto dto,
	        RedirectAttributes redirectAttributes) {

	    try {

	        kycReviewService.saveReview(dto);

	        redirectAttributes.addFlashAttribute(
	                "successMessage",
	                "KYC review submitted successfully."
	        );

	    } catch (Exception e) {

	        redirectAttributes.addFlashAttribute(
	                "errorMessage",
	                e.getMessage()
	        );
	    }

        return "redirect:/admin/pending-application";
	}


	
	
	
	
	@GetMapping("/admin_NeedCorrection_Kyc/{profileId}")
	public String adminNeedCorrectionKyc(
	        @PathVariable Integer profileId,
	        Model model,
	        RedirectAttributes redirectAttributes) {

	    try {

	        // =========================================================
	        // 1. Validate profileId
	        // =========================================================

	        if (profileId == null || profileId <= 0) {

	            redirectAttributes.addFlashAttribute(
	                    "errorMessage",
	                    "Invalid KYC profile ID."
	            );

	            return "redirect:/admin/need_correction_application";
	        }


	        // =========================================================
	        // 2. Get KYC data
	        // =========================================================

	        Kyc_Dto kycData =
	                kyc_Service.getKycByProfileId(profileId);


	        // =========================================================
	        // 3. Check KYC exists
	        // =========================================================

	        if (kycData == null) {

	            redirectAttributes.addFlashAttribute(
	                    "errorMessage",
	                    "KYC application not found."
	            );

	            return "redirect:/admin/need_correction_application";
	        }


	        // =========================================================
	        // 4. Get previous KYC correction review
	        // =========================================================

	        KycReviewDto kycReview =
	                kycReviewService.getReviewByProfileId(profileId);


	        // =========================================================
	        // 5. Check correction review exists
	        // =========================================================

	        if (kycReview == null) {

	            redirectAttributes.addFlashAttribute(
	                    "errorMessage",
	                    "No KYC correction review found for this application."
	            );

	            return "redirect:/admin/need_correction_application";
	        }


	        // =========================================================
	        // 6. Add data to JSP
	        // =========================================================

	        model.addAttribute(
	                "kycData",
	                kycData
	        );

	        model.addAttribute(
	                "kycReview",
	                kycReview
	        );


	        // =========================================================
	        // 7. Return JSP
	        // =========================================================

	        return "admin/admin_NeedCorrection_Kyc";


	    } catch (Exception e) {

	        e.printStackTrace();

	        redirectAttributes.addFlashAttribute(
	                "errorMessage",
	                "Unable to load KYC correction details."
	        );

	        return "redirect:/admin/need_correction_application";
	    }
	}
	
	
	
	
	
	
	
	
	@PostMapping("/admin-update-corrected-kyc")
	public String adminUpdateCorrectedKyc(

	        @RequestParam Integer profileId,

	        @RequestParam Integer userId,

	        @RequestParam(required = false) String fullNameStatus,
	        @RequestParam(required = false) String fullNameRemarks,

	        @RequestParam(required = false) String dobStatus,
	        @RequestParam(required = false) String dobRemarks,

	        @RequestParam(required = false) String genderStatus,
	        @RequestParam(required = false) String genderRemarks,

	        @RequestParam(required = false) String addressStatus,
	        @RequestParam(required = false) String addressRemarks,

	        @RequestParam(required = false) String cityStatus,
	        @RequestParam(required = false) String cityRemarks,

	        @RequestParam(required = false) String stateStatus,
	        @RequestParam(required = false) String stateRemarks,

	        @RequestParam(required = false) String pincodeStatus,
	        @RequestParam(required = false) String pincodeRemarks,

	        @RequestParam(required = false) String aadhaarNoStatus,
	        @RequestParam(required = false) String aadhaarNoRemarks,

	        @RequestParam(required = false) String aadhaarStatus,
	        @RequestParam(required = false) String aadhaarRemarks,

	        @RequestParam(required = false) String panNoStatus,
	        @RequestParam(required = false) String panNoRemarks,

	        @RequestParam(required = false) String panStatus,
	        @RequestParam(required = false) String panRemarks,

	        @RequestParam(required = false) String faceVideoStatus,
	        @RequestParam(required = false) String faceVideoRemarks,

	        @RequestParam String finalStatus,

	        @RequestParam String adminRemarks,

	        RedirectAttributes redirectAttributes) {

	    try {

	        // =====================================================
	        // 1. VALIDATE PROFILE ID
	        // =====================================================

	        if (profileId == null || profileId <= 0) {

	            redirectAttributes.addFlashAttribute(
	                    "errorMessage",
	                    "Invalid KYC profile ID."
	            );

	            return "redirect:/admin/need-correction-application";
	        }


	        // =====================================================
	        // 2. VALIDATE USER ID
	        // =====================================================

	        if (userId == null || userId <= 0) {

	            redirectAttributes.addFlashAttribute(
	                    "errorMessage",
	                    "Invalid user ID."
	            );

	            return "redirect:/admin/need-correction-application";
	        }


	        // =====================================================
	        // 3. VALIDATE FINAL STATUS
	        // =====================================================

	        if (finalStatus == null || finalStatus.trim().isEmpty()) {

	            redirectAttributes.addFlashAttribute(
	                    "errorMessage",
	                    "Please select the final KYC status."
	            );

	            return "redirect:/admin/admin_NeedCorrection_Kyc/"
	                    + profileId;
	        }


	        // =====================================================
	        // 4. VALIDATE STATUS VALUE
	        // =====================================================

	        if (!finalStatus.equals("APPROVED")
	                && !finalStatus.equals("NEED_CORRECTION")
	                && !finalStatus.equals("REJECTED")) {

	            redirectAttributes.addFlashAttribute(
	                    "errorMessage",
	                    "Invalid KYC status."
	            );

	            return "redirect:/admin/admin_NeedCorrection_Kyc/"
	                    + profileId;
	        }


	        // =====================================================
	        // 5. CREATE REVIEW DTO
	        // =====================================================

	        AdminKycDecisionDto decisionDto =
	                new AdminKycDecisionDto();

	        decisionDto.setProfileId(profileId);
	        decisionDto.setUserId(userId);

	        decisionDto.setFullNameStatus(fullNameStatus);
	        decisionDto.setFullNameRemarks(fullNameRemarks);

	        decisionDto.setDobStatus(dobStatus);
	        decisionDto.setDobRemarks(dobRemarks);

	        decisionDto.setGenderStatus(genderStatus);
	        decisionDto.setGenderRemarks(genderRemarks);

	        decisionDto.setAddressStatus(addressStatus);
	        decisionDto.setAddressRemarks(addressRemarks);

	        decisionDto.setCityStatus(cityStatus);
	        decisionDto.setCityRemarks(cityRemarks);

	        decisionDto.setStateStatus(stateStatus);
	        decisionDto.setStateRemarks(stateRemarks);

	        decisionDto.setPincodeStatus(pincodeStatus);
	        decisionDto.setPincodeRemarks(pincodeRemarks);

	        decisionDto.setAadhaarNoStatus(aadhaarNoStatus);
	        decisionDto.setAadhaarNoRemarks(aadhaarNoRemarks);

	        decisionDto.setAadhaarStatus(aadhaarStatus);
	        decisionDto.setAadhaarRemarks(aadhaarRemarks);

	        decisionDto.setPanNoStatus(panNoStatus);
	        decisionDto.setPanNoRemarks(panNoRemarks);

	        decisionDto.setPanStatus(panStatus);
	        decisionDto.setPanRemarks(panRemarks);

	        decisionDto.setFaceVideoStatus(faceVideoStatus);
	        decisionDto.setFaceVideoRemarks(faceVideoRemarks);

	        decisionDto.setFinalStatus(finalStatus);
	        decisionDto.setAdminRemarks(adminRemarks);


	        // =====================================================
	        // 6. CALL SERVICE
	        // =====================================================

	        kyc_Service.adminUpdateCorrectedKyc(
	                decisionDto
	        );


	        // =====================================================
	        // 7. SUCCESS MESSAGE
	        // =====================================================

	        if ("APPROVED".equals(finalStatus)) {

	            redirectAttributes.addFlashAttribute(
	                    "successMessage",
	                    "KYC approved successfully."
	            );

	        } else if ("NEED_CORRECTION".equals(finalStatus)) {

	            redirectAttributes.addFlashAttribute(
	                    "successMessage",
	                    "KYC marked as Need Correction successfully."
	            );

	        } else if ("REJECTED".equals(finalStatus)) {

	            redirectAttributes.addFlashAttribute(
	                    "successMessage",
	                    "KYC rejected successfully."
	            );
	        }


	        // =====================================================
	        // 8. REDIRECT
	        // =====================================================

	        return "redirect:/admin/need-correction-application";


	    } catch (Exception e) {

	        e.printStackTrace();

	        redirectAttributes.addFlashAttribute(
	                "errorMessage",
	                "Unable to update KYC decision: "
	                        + e.getMessage()
	        );

	        return "redirect:/admin/admin_NeedCorrection_Kyc/"
	                + profileId;
	    }
	}
	

}
