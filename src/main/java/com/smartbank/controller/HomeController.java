package com.smartbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smartbank.dto.Contact_Dto;
import com.smartbank.service.Contact_Service;

import jakarta.servlet.http.HttpSession;





@Controller
@RequestMapping("/")
public class HomeController {
	
	
	@Autowired
	private Contact_Service contact_Service;

	
	@GetMapping
	public String getHomepage(HttpSession session,Model model)
	{
		  // Get userId from session
		String name =
	              (String) session.getAttribute("name");
	      
		System.out.println(name);
		
		model.addAttribute("name",name);
		
		return "home/index";
	}
	
	
	 
	 @GetMapping("/service")
	 public String getServicePage()
	 {
		 return "home/service";
	 }

	
	 @GetMapping("/about")
	 public String getAboutPage()
	 {
		 return "home/about";
	 }
	 
	 
	 
	 @GetMapping("/contact")
	 public String getContactPage()
	 {
		 return "home/contact";
	 }
	 
	 
	 
	 
	 
	 //  Store Contact Leads
	 @PostMapping("/customer_leads")
	 public String customer_Leads_Insert(@ModelAttribute Contact_Dto dto,
			 							RedirectAttributes  redirectAttributes
			                           )
	 {
//		 System.out.println(dto.getName());
//		 System.out.println(dto.getEmail());
//		 System.out.println(dto.getMobile());
//		 System.out.println(dto.getSubject());
//		 System.out.println(dto.getMessage());
		 
		 try {
			 
			 contact_Service.saveContactLeads(dto);
			 
			 redirectAttributes.addFlashAttribute(
					   "successMessage",
					   "Your message has been sent successfully!"
					 );
			 
			 
		 }catch(Exception e) {
			 
			 redirectAttributes.addFlashAttribute(
					   "errorMessage",
					   e.getMessage()
					 );
			 
		 }
		 
		 
		 return "redirect:/contact";
		
	 }
	 
	
}
