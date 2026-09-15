<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}" />




<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard | Digital Account Gateway</title>
	
	
	<!-- Favicon / Website Logo --> 
		<link rel="icon" type="image/png" href="${baseUrl}/resources/images/smartbank-logo.png">
		

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

	  
	  <link rel="stylesheet"
	        href="${baseUrl}/resources/css/admin_css/admin_dashboard.css">

			
			
			<!-- SweetAlert2 -->
				    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				

					
					
					
					<style>
						
						.customer-error-message {
						    display: flex;
						    align-items: center;
						    gap: 10px;

						    padding: 15px 20px;
						    margin-bottom: 20px;

						    border-radius: 8px;

						    background: #fff3cd;
						    border: 1px solid #ffc107;

						    color: #856404;

						    font-size: 14px;
						    font-weight: 500;
						}

						.error-icon {
						    font-size: 20px;
						}
						
						</style>
</head>

<body>

<div class="dashboard-container">

<!-- =====================================================
     SIDEBAR
===================================================== -->

<aside class="sidebar">

<div class="logo-section">

<!--    Smart<span>Bank</span>-->
	
	Digital Account<span> Gateway</span>

    <div class="admin-label">
        ADMIN PORTAL
    </div>

</div>


<div class="menu">


    <div class="menu-title">
        Main Menu
    </div>


    <!-- Dashboard -->

    <a href="/admin/dashboard"
       class="${activeMenu == 'dashboard' ? 'active' : ''}">

        <span class="menu-icon">📊</span>

        <span>Dashboard</span>

    </a>

	
	
	<!-- My Profile -->

	<a href="/admin/profile" class="${activeMenu == 'profile' ? 'active' : ''}">

	    <span class="menu-icon">👤</span>

	    <span>My Profile</span>

	</a>

	
	

    <!-- Customers -->

    <a href="/admin/customer-list" class="${activeMenu == 'customer' ? 'active' : ''}">

        <span class="menu-icon">👥</span>

        <span>Customers</span>

    </a>

	
	
	
	

	<!-- KYC Applications Dropdown -->

	<div class="sidebar-dropdown">

	    <a href="javascript:void(0);"
	       class="dropdown-toggle ${activeMenu == 'kycApplication' ? 'active' : ''}"
	       onclick="toggleKycMenu()">

	        <span class="menu-icon">📋</span>

	        <span>KYC Applications</span>

	        <span class="dropdown-arrow">▾</span>

	    </a>


	    <div class="dropdown-menu" id="kycMenu">

	        <!-- Pending Applications -->
	        <a href="/admin/pending-application">

	            <span>⏳</span>
	            <span>Pending Applications</span>

	        </a>


	        <!-- Approved Applications -->
	        <a href="/admin/approve-application">

	            <span>✓</span>
	            <span>Approve Applications</span>

	        </a>


	        <!-- Rejected Applications -->
	        <a href="/admin/reject-application">

	            <span>✕</span>
	            <span>Rejected Applications</span>

	        </a>
			
			
			
			<!-- Need correction Applications -->
			        <a href="/admin/need-correction-application">

			             <span>✏️</span>
			            <span>Need Corrections Applications</span>

			        </a>

	    </div>

	</div>


  

    <div class="menu-title">
        Banking
    </div>


    <!-- Bank Accounts -->
	<a href="${baseUrl}/admin/bank-account"
	   class="${activeMenu == 'bankAccount' ? 'active' : ''}">

	    <span class="menu-icon">🏦</span>
	    <span>Bank Accounts</span>

	</a>



    <!-- Logout -->

    <div class="logout">

        <a href="/admin/adminLogout">

            <span class="menu-icon">⏻</span>

            <span>Logout</span>

        </a>

    </div>


</div>

</aside>






<!-- =====================================================
     MAIN CONTENT
===================================================== -->

<main class="main-content">

<!-- =====================================================
     TOPBAR
===================================================== -->

<header class="topbar">

<div class="page-title">

    <h2>Admin Dashboard</h2>

    <p>
        Digital Account Gateway
    </p>

</div>


<div class="topbar-right">


  


    <!-- Admin Profile -->

    <a href="/admin/profile"
       class="admin-profile-link">


        <div class="admin-profile">


            <div class="profile-image">
                A
            </div>


            <div class="profile-info">

                <strong>
                    ${adminName}
                </strong>

                <small>
                    Administrator
                </small>

            </div>

        </div>
    </a>
</div>

</header>