package com.smartbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smartbank.dto.User_Dto;
import com.smartbank.entity.User_Entity;
import com.smartbank.enum_package.Enum_File;
import com.smartbank.exception.InvalidOtpException;
import com.smartbank.exception.LoginException;
import com.smartbank.exception.PasswordMismatchException;
import com.smartbank.exception.UserNotFoundException;
import com.smartbank.service.EmailService;
import com.smartbank.service.AuthService;
import com.smartbank.util.OTPGenerator;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	private AuthService authService;

	@Autowired
	private EmailService emailService;



	// ==========================================================
	// REGISTER
	// ==========================================================

	// Open Register Page
	@GetMapping("/register")
	public String registerPage(Model model) {

		model.addAttribute("user", new User_Entity());

		return "auth/register";
	}

	// Submit Register Form
	@PostMapping("/register")
	public String register(@ModelAttribute User_Dto dto, @RequestParam("confirmPassword") String confirmPassword,
			Model model) {
		
		
	 
		// Password null check
		if (dto.getPassword() == null || confirmPassword == null) {

			model.addAttribute("error", "Password is required.");

			return "auth/register";
		}

		// Confirm Password Check
		if (!dto.getPassword().equals(confirmPassword)) {

			throw new PasswordMismatchException("Password and Confirm Password do not match.");
		}

		// Register User
		authService.register(dto);

		// Registration successful
		return "redirect:/auth/login";
	}

	// ==========================================================
	// LOGIN
	// ==========================================================

	// Open Login Page
	@GetMapping("/login")
	public String loginPage(Model model) {

		model.addAttribute("loginDTO", new User_Dto());

		return "auth/login";
	}

	
	
	
	
	// Login
	@PostMapping("/login")
	public String login(
	        @ModelAttribute User_Dto dto,
	        Model model,
	        HttpSession session,
	        HttpServletRequest request) {

	    if (dto.getEmail() == null || dto.getEmail().trim().isEmpty()) {
	        model.addAttribute("message", "Email is required.");
	        return "auth/login";
	    }

	    if (dto.getPassword() == null || dto.getPassword().trim().isEmpty()) {
	        model.addAttribute("message", "Password is required.");
	        return "auth/login";
	    }

	    try {

	        User_Dto loginDTO = authService.login(dto);

	        String role = loginDTO.getRole();

	        // Change session ID after successful authentication
	        request.changeSessionId();

	        // Remove old authentication attributes
	        session.removeAttribute("userId");
	        session.removeAttribute("name");
	        session.removeAttribute("useremail");

	        session.removeAttribute("adminUserId");
	        session.removeAttribute("adminName");
	        session.removeAttribute("adminemail");

	        session.removeAttribute("role");


	        // =========================
	        // CUSTOMER
	        // =========================
	        if (Enum_File.CUSTOMER.name().equalsIgnoreCase(role)) {

	            session.setAttribute("userId", loginDTO.getUserId());
	            session.setAttribute("name", loginDTO.getName());
	            session.setAttribute("useremail", loginDTO.getEmail());
	            session.setAttribute("role", "CUSTOMER");

	            return "redirect:/user/dashboard";
	        }


	        // =========================
	        // ADMIN
	        // =========================
	        if (Enum_File.ADMIN.name().equalsIgnoreCase(role)) {

	            session.setAttribute("adminUserId", loginDTO.getUserId());
	            session.setAttribute("adminName", loginDTO.getName());
	            session.setAttribute("adminemail", loginDTO.getEmail());
	            session.setAttribute("adminRole", "ADMIN");

	            return "redirect:/admin/dashboard";
	        }


	        model.addAttribute("message", "Invalid user role.");       
	        return "auth/login";

	    } catch (LoginException e) {

	        model.addAttribute("message", e.getMessage());

	        System.out.println(e.getMessage());
	        return "auth/login";
	    }
	}
	
	
	
	
	
	
	
	
	
	
	

	// ==========================================================
	// FORGOT PASSWORD
	// ==========================================================

	// Open Forgot Password Page
	@GetMapping("/forgotpassword")
	public String forgotPassword() {

		return "auth/forgotpassword";
	}

	// ==========================================================
	// SEND OTP
	// ==========================================================

	@PostMapping("/sendOtp")
	public String sendOtp(@RequestParam String email, HttpSession session) {

		// Email validation
		if (email == null || email.trim().isEmpty()) {

			throw new UserNotFoundException("Email is required.");
		}

		// Find user
		User_Entity user = authService.findByEmail(email);

		// User does not exist
		if (user == null) {

			throw new UserNotFoundException("No account found with this email.");
		}

		// Generate OTP
		String otp = OTPGenerator.generateOTP();

		// Send OTP
		emailService.sendOtp(user.getEmail(), otp);

		// Store OTP in session
		session.setAttribute("otp", otp);

		session.setAttribute("email", email);

		// Open Verify OTP Page
		return "auth/verifyotp";
	}

	// ==========================================================
	// VERIFY OTP
	// ==========================================================

	@PostMapping("/verifyOtp")
	public String verifyOtp(@RequestParam String otp, HttpSession session) {

		// Get OTP from session
		String sessionOtp = (String) session.getAttribute("otp");

		// OTP does not exist
		if (sessionOtp == null) {

			throw new InvalidOtpException("OTP has expired. Please request a new OTP.");
		}

		// Empty OTP
		if (otp == null || otp.trim().isEmpty()) {

			throw new InvalidOtpException("Please enter OTP.");
		}

		// Compare OTP
		if (!sessionOtp.equals(otp)) {

			throw new InvalidOtpException("Invalid OTP. Please enter the correct OTP.");
		}

		// OTP correct
		return "auth/resetpassword";
	}

	// ==========================================================
	// RESET PASSWORD
	// ==========================================================

	@PostMapping("/resetPassword")
	public String resetPassword(@RequestParam String password, @RequestParam String confirmPassword,
			HttpSession session) {

		// Password validation
		if (password == null || password.trim().isEmpty()) {

			throw new PasswordMismatchException("Password is required.");
		}

		// Confirm password validation
		if (confirmPassword == null || confirmPassword.trim().isEmpty()) {

			throw new PasswordMismatchException("Confirm Password is required.");
		}

		// Password match check
		if (!password.equals(confirmPassword)) {

			throw new PasswordMismatchException("Password and Confirm Password do not match.");
		}

		// Get email from session
		String email = (String) session.getAttribute("email");

		// Email missing from session
		if (email == null || email.trim().isEmpty()) {

			throw new UserNotFoundException("Session expired. Please restart the password reset process.");
		}

		// Update Password
		authService.updatePassword(email, password);

		// Remove OTP data
		session.removeAttribute("otp");
		session.removeAttribute("email");

		// Redirect to Login
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

	    return "redirect:/user/profile";
	}
	
}





