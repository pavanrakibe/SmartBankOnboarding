<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>




<%@ include file="../admin/admin_Header.jsp" %>




<div class="admin-profile-page">


    <!-- Page Header -->

    <div class="page-header">

        <div>

            <h1>Admin Profile</h1>

        </div>

    </div>




    <!-- Profile Overview -->

    <div class="profile-overview-card">


        <div class="admin-avatar">

            ${userData.name.substring(0,1).toUpperCase()}

        </div>


        <div class="admin-profile-info">

            <h2>
                ${userData.name}
            </h2>

            <p>
                ${userData.role}
            </p>

            <span class="active-badge">
                ● Active
            </span>

        </div>


    </div>




    <!-- Personal Information -->

    <div class="admin-section-card">


        <div class="section-title">

            <div>

                <h2>Personal Information</h2>

                <p>
                    Basic information about the administrator account.
                </p>

            </div>

        </div>



		
		<form method="post" action="/admin/updateUser_Logic">
							
							<input type="hidden" name="userId" value="${userData.userId}">

        <div class="admin-form-grid">

		
            <!-- Full Name -->

            <div class="form-group">

                <label>
                    Full Name
                </label>


                <input
                    type="text"
					name="name"
                    value="${userData.name}"
                    placeholder="Enter full name"
                    >

            </div>




        



            <!-- Mobile -->

            <div class="form-group">

                <label>
                    Mobile Number
                </label>


                <input
                    type="text"
					name="mobile"
                    value="${userData.mobile}"
                    placeholder="Enter mobile number">

            </div>
			
			
			
			<!-- Email -->

			        <div class="form-group">

			            <label>
			                Email Address
			            </label>


			            <input
			                type="email"
							name="email"
			                value="${userData.email}"
			                placeholder="Enter email address"
			                readonly>

			        </div>


			

        </div>


    </div>




    <!-- Account Information -->

    <div class="admin-section-card">


        <div class="section-title">

            <div>

                <h2>
                    Account Information
                </h2>

                <p>
                    Administrator account details and access information.
                </p>

            </div>

        </div>




        <div class="admin-form-grid">


            <!-- Role -->

            <div class="form-group">

                <label>
                    Role
                </label>


                <input
                    type="text"
                    value="${userData.role}"
                    readonly>

            </div>




            <!-- Created Date -->

            <div class="form-group">

                <label>
                    Account Created
                </label>


                <input
                    type="text"
                    value="${userData.createdAt}"
                    readonly>

            </div>


        </div>


    </div>

	<!-- Bottom Actions -->

	  <div class="profile-actions">


	      <button
	          type="submit"
	          class="save-btn">

	          Save Changes

	      </button>


	  </div>

	  
	  <form>


    <!-- Security -->

    <div class="admin-section-card">


        <div class="section-title">

            <div>

                <h2>
                    Security
                </h2>

                <p>
                    Update your administrator password.
                </p>

            </div>

        </div>




        <div class="admin-form-grid">


          <a href="/auth/forgotpassword" class="cancel-btn" style="text-decoration:none;">
			Update Password
			
			</a>



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



<%@ include file="../admin/admin_Footer.jsp" %>