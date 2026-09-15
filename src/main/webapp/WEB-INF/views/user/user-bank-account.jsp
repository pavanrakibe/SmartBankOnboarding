
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../commonUser/header.jsp" %>
	
	
	
	<link rel="stylesheet"
	       href="${baseUrl}/resources/css/user-bank-account.css">


    <main class="user-main">


        <!-- ========================================= -->
        <!-- PAGE HEADER -->
        <!-- ========================================= -->

        <div class="page-header">

            <div>

                <h1>My Bank Account</h1>

                <p>
                    View and manage your bank account information
                </p>

            </div>

        </div>



        <!-- ========================================= -->
        <!-- NO ACCOUNT -->
        <!-- ========================================= -->

        <c:if test="${empty account}">

            <div class="no-account-card">

                <div class="no-account-icon">
                    🏦
                </div>

                <h2>
                    Bank Account Not Available
                </h2>

                <p>
                    Your bank account has not been created yet.
                </p>

                <p>
                    Please contact the bank administrator
                    for more information.
                </p>

            </div>

        </c:if>



        <!-- ========================================= -->
        <!-- ACCOUNT AVAILABLE -->
        <!-- ========================================= -->

        <c:if test="${not empty account}">


            <!-- ===================================== -->
            <!-- ACCOUNT SUMMARY -->
            <!-- ===================================== -->

            <div class="account-summary-card">


                <div class="account-summary-left">

                    <div class="bank-icon">
                        🏦
                    </div>


                    <div>

                        <span class="small-label">
                            Account Number
                        </span>

                        <h2>
                            ${account.accountNumber}
                        </h2>

                        <span class="account-type">
                            ${account.accountType}
                        </span>

                    </div>

                </div>



                <div class="account-summary-right">

                    <span class="small-label">
                        Available Balance
                    </span>

                    <h2>
                        ₹ ${account.balance}
                    </h2>


                    <span class="status
                        ${account.accountStatus == 'ACTIVE'
                            ? 'status-active'
                            : 'status-inactive'}">

                        ${account.accountStatus}

                    </span>

                </div>

            </div>



            <!-- ===================================== -->
            <!-- ACCOUNT INFORMATION -->
            <!-- ===================================== -->

            <div class="content-card">

                <div class="card-header">

                    <div>

                        <h2>
                            Account Information
                        </h2>

                        <p>
                            Your registered bank account details
                        </p>

                    </div>

                </div>


                <div class="account-grid">


                    <div class="info-item">

                        <span>
                            Customer Name
                        </span>

                        <strong>
                            ${account.customerName}
                        </strong>

                    </div>



                    <div class="info-item">

                        <span>
                            Email
                        </span>

                        <strong>
                            ${account.email}
                        </strong>

                    </div>



                    <div class="info-item">

                        <span>
                            Account Number
                        </span>

                        <strong>
                            ${account.accountNumber}
                        </strong>

                    </div>



                    <div class="info-item">

                        <span>
                            Account Type
                        </span>

                        <strong>
                            ${account.accountType}
                        </strong>

                    </div>



                    <div class="info-item">

                        <span>
                            IFSC Code
                        </span>

                        <strong>
                            ${account.ifscCode}
                        </strong>

                    </div>



                    <div class="info-item">

                        <span>
                            Branch
                        </span>

                        <strong>
                            ${account.branch}
                        </strong>

                    </div>



                    <div class="info-item">

                        <span>
                            Account Status
                        </span>

                        <strong>
                            ${account.accountStatus}
                        </strong>

                    </div>



                    <div class="info-item">

                        <span>
                            Created Date
                        </span>

                        <strong>

                            <c:choose>

                                <c:when test="${not empty account.createdAt}">

                                    ${account.createdAt.toLocalDate()}

                                </c:when>

                                <c:otherwise>

                                    -

                                </c:otherwise>

                            </c:choose>

                        </strong>

                    </div>


                </div>


                <!-- ================================= -->
                <!-- DETAILS BUTTON -->
                <!-- ================================= -->

                <div class="card-footer">

                    <a
                        href="${pageContext.request.contextPath}/user/bank-account/details"
                        class="primary-btn">

                        View Full Account Details

                    </a>

                </div>


            </div>


        </c:if>


    </main>
	
	
	
	
	
	

	<%@ include file="../commonUser/footer.jsp" %>


