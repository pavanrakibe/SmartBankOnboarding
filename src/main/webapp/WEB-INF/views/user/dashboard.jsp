<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<%@ include file="../commonUser/header.jsp" %>


<!-- ===========================
        DASHBOARD CONTENT
============================ -->





<!-- ===========================
        WELCOME SECTION
============================ -->

<c:if test="${empty kycData}">
	
<section class="welcome">

                                                           

    <div class="welcome-text">



        <h1>
            Welcome Back 👋
        </h1>



        <p>

            Welcome to your SmartBank Dashboard.

            Complete your KYC,
            upload required documents,
            manage your profile,
            check your application status
            and access all banking services
            from one secure dashboard.

        </p>




        <a href="${baseUrl}/kyc/completekyc" class="primary-btn">

            Complete KYC

        </a>



    </div>






    <div class="welcome-image">



        <img
        src="https://images.unsplash.com/photo-1554224155-6726b3ff858f?auto=format&fit=crop&w=900&q=80"
        alt="Dashboard">



    </div>



</section>



</c:if>








<c:if test="${not empty kycData}">

<section class="welcome">

    <div class="welcome-text">

        <h1>Welcome Back, ${kycData.fullName} 👋</h1>

        <p>
            Your KYC has already been submitted.
        </p>

		<a href="${baseUrl}/user/applicationStatus"
		   class="btn btn-primary btn-lg rounded-pill px-4 py-3 shadow">
		    <i class="fas fa-file-alt me-2"></i>
		    Check Application Status
		</a>
    </div>

</section>

</c:if>




<!-- ===========================
        DASHBOARD CARDS
============================ -->


<section class="cards">


                         
    <div class="card">



        <div class="card-icon">

            📄

        </div>



        <div class="card-info">



            <h2>
                01
            </h2>



            <p>
                Total Applications
            </p>



        </div>



    </div>







    <div class="card">



        <div class="card-icon">

            📂

        </div>



        <div class="card-info">



            <h2>
                04
            </h2>



            <p>
                Documents Uploaded
            </p>



        </div>



    </div>







    <div class="card">



        <div class="card-icon">

            ✅

        </div>



        <div class="card-info">



            <h2>
                80%
            </h2>



            <p>
                KYC Completed
            </p>



        </div>



    </div>







    <div class="card">



        <div class="card-icon">

            🏦

        </div>



        <div class="card-info">



            <h2>
                Pending
            </h2>



            <p>
                Account Status
            </p>



        </div>



    </div>



</section>








<!-- ===========================
        QUICK ACTIONS
============================ -->


<section class="quick-actions">



    <div class="section-title">



        <h2>
            Quick Actions
        </h2>



        <p>
            Access frequently used services.
        </p>



    </div>







    <div class="actions-grid">





        <div class="action-card">



            <div class="action-icon">
                📝
            </div>



            <h3>
                Complete KYC
            </h3>



            <p>
                Finish your KYC verification
                to activate your account.
            </p>



            <a href="${baseUrl}/kyc/completekyc">
                Continue →
            </a>



        </div>







       <!--  <div class="action-card">



            <div class="action-icon">
                📤
            </div>



            <h3>
                Upload Documents
            </h3>



            <p>
                Upload Aadhaar, PAN Card
                and other required documents.
            </p>



            <a href="#">
                Upload →
            </a>



        </div>
		






        <div class="action-card">



            <div class="action-icon">
                🏦
            </div>



            <h3>
                Open Account
            </h3>



            <p>
                Complete your onboarding
                and open your SmartBank account.
            </p>



            <a href="#">
                Apply →
            </a>



        </div>
		-->






        <div class="action-card">



            <div class="action-icon">
                👤
            </div>



            <h3>
                Update Profile
            </h3>



            <p>
                Update your personal
                information anytime.
            </p>



            <a href="profile">
                Edit →
            </a>



        </div>







        <div class="action-card">



            <div class="action-icon">
                📋
            </div>



            <h3>
                Application Status
            </h3>



            <p>
                Track the latest status
                of your onboarding request.
            </p>



            <a href="${baseUrl}/user/applicationStatus">
                View →
            </a>



        </div>







        <!--  <div class="action-card">



            <div class="action-icon">
                🔔
            </div>



            <h3>
                Notifications
            </h3>



            <p>
                View recent updates
                and important alerts.
            </p>



            <a href="#">
                Open →
            </a>



        </div>-->







        <div class="action-card">



            <div class="action-icon">
                📞
            </div>



            <h3>
                Customer Support
            </h3>



            <p>
                Need help?
                Contact SmartBank support.
            </p>



            <a href="${baseUrl}/contact">
                Contact →
            </a>



        </div>




<!--  
         <div class="action-card">



            <div class="action-icon">
                ⚙
            </div>



            <h3>
                Settings
            </h3>



            <p>
                Manage password,
                preferences and security.
            </p>



            <a href="#">
                Manage →
            </a>



        </div>
		-->




    </div>



</section>




<%@ include file="../commonUser/footer.jsp" %>



