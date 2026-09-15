<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
	
	  
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<c:set var="baseUrl" value="${pageContext.request.contextPath}" />
	
	
	
	
	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>Digital Account Gateway</title>
		
		
		<!-- Favicon / Website Logo --> 
			<link rel="icon" type="image/png" href="${baseUrl}/resources/images/smartbank-logo.png">
			

		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
			rel="stylesheet">

		
			    <link rel="stylesheet"
          href="${baseUrl}/resources/css/home_css/home.css">
		  
		  
		  
		  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


	</head>

	<body>

		<nav>

			<div class="logo">
				
				<img src="${baseUrl}/resources/images/dag-logo.png"
				           alt="Digital Account Gateway Logo">

			</div>
			
			<!-- Mobile Toggle -->
			 <button class="menu-toggle" onclick="toggleSidebar()">
			     ☰
			 </button>
			
			<div class="ul_header" id="mobileSidebar">
				
				<button class="close-sidebar" onclick="toggleSidebar()">
				           ×
				 </button>

			<ul>

				<li><a href="/">Home</a></li>

				<li><a href="/service">Services</a></li>

				<li><a href="/about">About</a></li>

				<li><a href="/contact">Contact</a></li>
				
				<!-- Desktop Login -->
							  <li class="header_btn" id="header_btn">
							      <a href="/auth/login" class="login-btn">
							          Login
							      </a>
							  </li>

			</ul>

			</div>
			
			<div class="header_btn">
			<a href="/auth/login" class="login-btn">Login</a>
			</div>
			
			

		</nav>

		
		
		
		
		
		<!-- sidebar -->
		<script>

		function toggleSidebar() {

		    const sidebar = document.getElementById("mobileSidebar");

		    sidebar.classList.toggle("active");

		}

		</script>
		