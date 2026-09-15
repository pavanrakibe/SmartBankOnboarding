<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../commonUser/header.jsp" %>

	
	<link rel="stylesheet"
	      href="${baseUrl}/resources/css/profile.css">
	  
	  
	  
	  
	  
	  
	  
	  

<div class="profile-container">

    <div class="profile-header">
        <h2>My Profile</h2>
        <p>View and manage your personal information.</p>
    </div>

	
	
	
	
	
	
    <div class="profile-card">

        <div class="profile-image">

            <img src="${baseUrl}/resources/images/profile.avif"
                 alt="Profile Image">

         <h3 style="text-transform: capitalize;">${userData.name}</h3>

            <span>Customer</span>

        </div>   

        <div class="profile-details">

			<form method="post" action="/auth/updateUser_Logic">
				
				<input type="hidden" name="userId" value="${userData.userId}">
				
            <div class="profile-row">

                <div class="profile-group">
                    <label>Full Name</label>
                    <input type="text" name="name" value="${userData.name}">
                </div>

				
							  
							  
							  <div class="profile-group">
							                 <label>Mobile Number</label>
							                 <input type="text" name="mobile" value="${userData.mobile}">
							             </div>



            </div>

            <div class="profile-row">

                <div class="profile-group">
                    <label>Email</label>
                    <input type="email" name="email" value="${userData.email}" readonly>
                </div>

				
				<div class="profile-group">
						<label>Role</label>
								<input type="text" value="${userData.role}" readonly>
						</div>
           
            </div>


            <div class="button-group">

                <button type="submit" class="edit-btn">
                    Update Profile
                </button>

				
				<a href="${baseUrl}/auth/forgotpassword" class="password-btn">
				    Change Password
				</a>
				
				
				<a href="${baseUrl}/user/customerLogout" class="edit-btn">
							    Logout
							</a>

            </div>
			</form>

        </div>

    </div>                 

</div>



<script>
    document.addEventListener("DOMContentLoaded", function () {

        <c:if test="${not empty successMessage}">
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: '${successMessage}',
                confirmButtonText: 'OK'
            });
        </c:if>

        <c:if test="${not empty errorMessage}">
            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: '${errorMessage}',
                confirmButtonText: 'OK'
            });
        </c:if>

    });
</script>


<%@ include file="../commonUser/footer.jsp" %>
