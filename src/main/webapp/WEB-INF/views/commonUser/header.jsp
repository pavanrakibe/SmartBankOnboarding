<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
	
	  
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<c:set var="baseUrl" value="${pageContext.request.contextPath}" />
	
	
	
	<%
	String currentPath = request.getRequestURI();
	%>
	
	
	



<!DOCTYPE html>
<html lang="en">


<head>


    <meta charset="UTF-8">


    <meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>User Dashboard | Digital Account Gateway</title>
		
		
		<!-- Favicon / Website Logo --> 
			<link rel="icon" type="image/png" href="${baseUrl}/resources/images/smartbank-logo.png">
			
			

    <link rel="stylesheet"
          href="${baseUrl}/resources/css/dashboard.css">

	

		

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

		  
		

<!--   Jquery validatio Link -->
		  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

		  <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.21.0/dist/jquery.validate.min.js"></script>

		  <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.21.0/dist/additional-methods.min.js"></script>


		  
		  <!-- SweetAlert2 -->
		    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			
			
			
			<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

			


</head>



<body>




<!-- ==========================
        NAVBAR
========================== 
-->

<header class="navbar">


    <div class="logo">

		
		Digital Account<span> Gateway</span>

    </div>




    <div class="user-info">

  <a href="${baseUrl}/user/profile" class="profile_anchor">
        <span class="user-name">

            Welcome,

            <strong>
                ${name}
            </strong>

        </span>




        <img src="${baseUrl}/resources/images/profile.avif"
             alt="Profile">

</a>

    </div>



</header>







<!-- ==========================
        SIDEBAR
========================== 
-->

<aside class="sidebar">



    <ul>



        <li>


        
			
			
			<a href="${baseUrl}/user/dashboard"
			class="${activeMenu == 'dashboard' ? 'active' : ''}">
			
						<span>
			                 🏠
			             </span>


			             Dashboard
			</a>


        </li>







        <li>


          
			
			<a href="${baseUrl}/user/profile"
			class="${activeMenu == 'profile' ? 'active' : ''}">

			    <span>
			        👤
			    </span>


			    My Profile


			</a>


        </li>



        <li>


			<a href="${baseUrl}/kyc/completekyc"
						class="${activeMenu == 'completekyc' ? 'active' : ''}">


                <span>
                    📝
                </span>


                Complete KYC


            </a>


        </li>










        <li>


				
				<a href="${baseUrl}/user/applicationStatus"
									class="${activeMenu == 'applicationStatus' ? 'active' : ''}">




                <span>
                    📋
                </span>


                Application Status


            </a>


        </li>








		<li>


			<a href="${pageContext.request.contextPath}/user/bank-account">


		        <span>
		            🏦
		        </span>


		        Bank Account


		    </a>


		</li>














        <li>


            <a href="/user/customerLogout">


             <span class="menu-icon">⏻</span>

                Logout


            </a>


        </li>





    </ul>



</aside>








<!-- ==========================
        CONTENT START
========================== 
-->

<main class="content">