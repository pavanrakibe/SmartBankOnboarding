
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../commonUser/header.jsp" %>
	
	
	
	<link rel="stylesheet"
	       href="${baseUrl}/resources/css/user-bank-account.css">


    <main class="user-main">


        <div class="page-header">

            <div>

                <h1>
                    Account Details
                </h1>

                <p>
                    Complete information about your bank account
                </p>

            </div>


            <a
                href="${pageContext.request.contextPath}/user/bank-account"
                class="secondary-btn">

                ← Back to Account

            </a>

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
                    No Bank Account Found
                </h2>

                <p>
                    You currently do not have a bank account.
                </p>

            </div>

        </c:if>



        <!-- ========================================= -->
        <!-- ACCOUNT DETAILS -->
        <!-- ========================================= -->

        <c:if test="${not empty account}">


            <div class="details-card">


                <div class="details-card-header">

                    <div class="bank-icon">
                        🏦
                    </div>

                    <div>

                        <h2>
                            ${account.accountType} Account
                        </h2>

                        <p>
                            ${account.accountNumber}
                        </p>

                    </div>


                    <span class="status
                        ${account.accountStatus == 'ACTIVE'
                            ? 'status-active'
                            : 'status-inactive'}">

                        ${account.accountStatus}

                    </span>

                </div>



                <!-- ================================= -->
                <!-- CUSTOMER INFORMATION -->
                <!-- ================================= -->

                <div class="section-title">

                    Customer Information

                </div>


                <div class="details-grid">


                    <div class="detail-item">

                        <label>
                            Customer Name
                        </label>

                        <span>
                            ${account.customerName}
                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            Email Address
                        </label>

                        <span>
                            ${account.email}
                        </span>

                    </div>

                </div>



                <!-- ================================= -->
                <!-- BANK ACCOUNT INFORMATION -->
                <!-- ================================= -->

                <div class="section-title">

                    Bank Account Information

                </div>


                <div class="details-grid">


                    <div class="detail-item">

                        <label>
                            Account Number
                        </label>

                        <span>
                            ${account.accountNumber}
                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            Account Type
                        </label>

                        <span>
                            ${account.accountType}
                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            IFSC Code
                        </label>

                        <span>
                            ${account.ifscCode}
                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            Branch
                        </label>

                        <span>
                            ${account.branch}
                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            Current Balance
                        </label>

                        <span class="balance">

                            ₹ ${account.balance}

                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            Account Status
                        </label>

                        <span>

                            ${account.accountStatus}

                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            Created Date
                        </label>

                        <span>

                            <c:choose>

                                <c:when test="${not empty account.createdAt}">

                                    ${account.createdAt.toLocalDate()}

                                </c:when>

                                <c:otherwise>

                                    -

                                </c:otherwise>

                            </c:choose>

                        </span>

                    </div>


                    <div class="detail-item">

                        <label>
                            Last Updated
                        </label>

                        <span>

                            <c:choose>

                                <c:when test="${not empty account.updatedAt}">

                                    ${account.updatedAt}

                                </c:when>

                                <c:otherwise>

                                    -

                                </c:otherwise>

                            </c:choose>

                        </span>

                    </div>

                </div>



                <!-- ================================= -->
                <!-- ADMIN REMARKS -->
                <!-- ================================= -->

                <c:if test="${not empty account.adminRemarks}">

                    <div class="remarks-section">

                        <h3>
                            Bank Remarks
                        </h3>

                        <p>
                            ${account.adminRemarks}
                        </p>

                    </div>

                </c:if>


            </div>

        </c:if>


    </main>
	
	



	<%@ include file="../commonUser/footer.jsp" %>



