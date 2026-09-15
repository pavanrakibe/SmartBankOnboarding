<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>




<%@ include file="../admin/admin_Header.jsp" %>





<c:if test="${not empty successMessage}">

    <script>

        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: '${successMessage}',
            timer: 2500,
            showConfirmButton: false
        });

    </script>

</c:if>


<c:if test="${not empty errorMessage}">

    <script>

        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '${errorMessage}'
        });

    </script>

</c:if>





<!-- ================================
     BANK ACCOUNTS CONTENT
================================ -->

<div class="bank-content">

    <!-- PAGE HEADER -->
    <div class="bank-page-header">

        <div>
            <h1>Bank Accounts</h1>

            <p>
                Create and manage customer bank accounts
            </p>
        </div>

        <button class="create-account-btn"
                onclick="openAccountModal()">

            <span>+</span>
            Create Bank Account

        </button>

    </div>


    <!-- STAT CARDS -->
    <div class="bank-stat-grid">

        <div class="bank-stat-card">

            <div class="bank-stat-icon blue">
                🏦
            </div>

            <div>
                <p>Total Accounts</p>
               <h2>${totalAccounts}</h2>
            </div>

        </div>


        <div class="bank-stat-card">

            <div class="bank-stat-icon green">
                ✓
            </div>

            <div>
                <p>Active Accounts</p>
               <h2>${activeAccounts}</h2>
            </div>

        </div>


        <div class="bank-stat-card">

            <div class="bank-stat-icon orange">
                ⏳
            </div>

            <div>
                <p>Pending Accounts</p>
                <h2>${pendingAccounts}</h2>
            </div>

        </div>


        <div class="bank-stat-card">

            <div class="bank-stat-icon red">
                ×
            </div>

            <div>
                <p>Closed Accounts</p>
               <h2>${closedAccounts}</h2>
            </div>

        </div>

    </div>


    <!-- BANK ACCOUNT TABLE -->
    <div class="bank-table-card">

        <div class="bank-table-top">

            <div>
                <h2>Customer Bank Accounts</h2>

                <p>
                    View and manage all customer bank accounts
                </p>
            </div>

        </div>


     


        <!-- TABLE -->
        <div class="bank-table-wrapper">

            <table class="bank-account-table">

                <thead>

                <tr>

                    <th>CUSTOMER</th>
					
					<th>EMAIL</th>

                    <th>ACCOUNT NUMBER</th>

                    <th>ACCOUNT TYPE</th>

                    <th>IFSC CODE</th>

                    <th>BALANCE</th>

                    <th>DATE</th>

                    <th>STATUS</th>

                    <th>ACTION</th>

                </tr>

                </thead>


			<tbody>

    <c:choose>

        <c:when test="${not empty accountPage.content}">

            <c:forEach
                    var="account"
                    items="${accountPage.content}">

                <tr>

                    <!-- CUSTOMER -->

                    <td>

                        <div class="customer-info">

                            <strong>
                                ${account.customerName}
                            </strong>

                        </div>

                    </td>


					<!-- User email -->

					 <td>
					  ${account.email}
					  </td>
									  
									  
                    <!-- ACCOUNT NUMBER -->

                    <td>
                        ${account.accountNumber}
                    </td>


                    <!-- ACCOUNT TYPE -->

                    <td>
                        ${account.accountType}
                    </td>


                    <!-- IFSC -->

                    <td>
                        ${account.ifscCode}
                    </td>


                    <!-- BALANCE -->

                    <td>

                        ₹${account.balance}

                    </td>


                    <!-- DATE -->

					<td>
					    ${account.createdAt.toLocalDate()}
					</td>

                    <!-- STATUS -->

                    <td>

                        <span class="status-badge">

                            ${account.accountStatus}

                        </span>

                    </td>


                    <!-- ACTION -->

                    <td>

                        <a
                            href="${pageContext.request.contextPath}/admin/bank-account/edit_bank_account/${account.accountId}"
                            class="action-btn">

                            Edit

                        </a>

                    </td>

                </tr>

            </c:forEach>

        </c:when>


        <c:otherwise>

            <tr>

                <td
                    colspan="8"
                    style="text-align:center;">

                    No bank accounts found.

                </td>

            </tr>

        </c:otherwise>

    </c:choose>

</tbody>
            </table>

        </div>


        <!-- PAGINATION -->
		<div class="bank-pagination">

		    <!-- ============================= -->
		    <!-- Showing X to Y of Z accounts -->
		    <!-- ============================= -->

		    <span>

		        <c:choose>

		            <c:when test="${totalAccounts > 0}">

		                <c:set
		                    var="startRecord"
		                    value="${currentPage * pageSize + 1}" />

		                <c:set
		                    var="endRecord"
		                    value="${(currentPage + 1) * pageSize}" />

		                <c:if test="${endRecord > totalAccounts}">

		                    <c:set
		                        var="endRecord"
		                        value="${totalAccounts}" />

		                </c:if>

		                Showing
		                ${startRecord}
		                to
		                ${endRecord}
		                of
		                ${totalAccounts}
		                accounts

		            </c:when>

		            <c:otherwise>

		                Showing 0 to 0 of 0 accounts

		            </c:otherwise>

		        </c:choose>

		    </span>


		    <!-- ============================= -->
		    <!-- Pagination Buttons -->
		    <!-- ============================= -->

		    <div>

		        <!-- Previous -->

		        <c:choose>

		            <c:when test="${currentPage > 0}">

		                <a
		                    href="${pageContext.request.contextPath}/admin/bank-account?page=${currentPage - 1}">

		                    <button type="button">
		                        ‹
		                    </button>

		                </a>

		            </c:when>

		            <c:otherwise>

		                <button
		                    type="button"
		                    disabled>

		                    ‹

		                </button>

		            </c:otherwise>

		        </c:choose>


		        <!-- ============================= -->
		        <!-- Page 1 -->
		        <!-- ============================= -->

		        <a
		            href="${pageContext.request.contextPath}/admin/bank-account?page=0">

		            <button
		                type="button"
		                class="${currentPage == 0 ? 'active-page' : ''}">

		                1

		            </button>

		        </a>


		        <!-- ============================= -->
		        <!-- Page 2 -->
		        <!-- ============================= -->

		        <c:if test="${totalPages >= 2}">

		            <a
		                href="${pageContext.request.contextPath}/admin/bank-account?page=1">

		                <button
		                    type="button"
		                    class="${currentPage == 1 ? 'active-page' : ''}">

		                    2

		                </button>

		            </a>

		        </c:if>


		        <!-- ============================= -->
		        <!-- Page 3 -->
		        <!-- ============================= -->

		        <c:if test="${totalPages >= 3}">

		            <a
		                href="${pageContext.request.contextPath}/admin/bank-account?page=2">

		                <button
		                    type="button"
		                    class="${currentPage == 2 ? 'active-page' : ''}">

		                    3

		                </button>

		            </a>

		        </c:if>


		        <!-- ============================= -->
		        <!-- Dots -->
		        <!-- ============================= -->

		        <c:if test="${totalPages > 5}">

		            <button
		                type="button"
		                disabled>

		                ...

		            </button>

		        </c:if>


		        <!-- ============================= -->
		        <!-- Last Page -->
		        <!-- ============================= -->

		        <c:if test="${totalPages > 3}">

		            <a
		                href="${pageContext.request.contextPath}/admin/bank-account?page=${totalPages - 1}">

		                <button
		                    type="button"
		                    class="${currentPage == totalPages - 1
		                            ? 'active-page'
		                            : ''}">

		                    ${totalPages}

		                </button>

		            </a>

		        </c:if>


		        <!-- ============================= -->
		        <!-- Next -->
		        <!-- ============================= -->

		        <c:choose>

		            <c:when test="${currentPage < totalPages - 1}">

		                <a
		                    href="${pageContext.request.contextPath}/admin/bank-account?page=${currentPage + 1}">

		                    <button type="button">
		                        ›
		                    </button>

		                </a>

		            </c:when>

		            <c:otherwise>

		                <button
		                    type="button"
		                    disabled>

		                    ›

		                </button>

		            </c:otherwise>

		        </c:choose>

		    </div>

		</div>
    </div>

</div>











<!-- ================================
     CREATE ACCOUNT MODAL
================================ -->



<div
    class="account-modal"
    id="accountModal">

    <div class="account-modal-box">


        <!-- =================================================
             HEADER
        ================================================== -->

        <div class="account-modal-header">

            <div>

                <h2>
                    Create Bank Account
                </h2>

                <p>
                    Create a new account for a verified customer
                </p>

            </div>


            <button
                type="button"
                onclick="closeAccountModal()">

                ×

            </button>

        </div>


        <!-- =================================================
             FORM
        ================================================== -->

        <form
            action="${baseUrl}/admin/bank-account/create"
            method="post">

            <div class="account-form">


                <!-- =================================================
                     CUSTOMER
                ================================================== -->

                <div class="form-field">

                    <label for="userId">
                        Customer
                    </label>

                    <select
                        id="userId"
                        name="userId"
                        required>

                        <option value="">
                            Select Customer
                        </option>


                        <c:forEach
                            var="customer"
                            items="${customers}">

                            <option
                                value="${customer.userId}">

                                ${customer.name}
                                -
                                ${customer.email}

                            </option>

                        </c:forEach>

                    </select>

                </div>


                <!-- =================================================
                     ACCOUNT TYPE + INITIAL DEPOSIT
                ================================================== -->

                <div class="form-two-column">


                    <!-- ACCOUNT TYPE -->

                    <div class="form-field">

                        <label for="accountType">
                            Account Type
                        </label>

                        <select
                            id="accountType"
                            name="accountType"
                            required>

                            <option value="">
                                Select Account Type
                            </option>

                            <option value="SAVINGS">
                                Savings Account
                            </option>

                            <option value="CURRENT">
                                Current Account
                            </option>

                            <option value="SALARY">
                                Salary Account
                            </option>

                        </select>

                    </div>


                    <!-- INITIAL DEPOSIT -->

                    <div class="form-field">

                        <label for="balance">
                            Initial Deposit
                        </label>

                        <input
                            type="number"
                            id="balance"
                            name="balance"
                            step="0.01"
                            min="0"
                            value="0.00"
                            placeholder="₹ 0.00">

                    </div>

                </div>


                <!-- =================================================
                     BRANCH
                ================================================== -->

                <div class="form-field">

                    <label for="branch">
                        Branch
                    </label>

                    <select
                        id="branch"
                        name="branch"
                        required
                        onchange="updateIFSC()">

                        <option value="">
                            Select Branch
                        </option>

                        <option value="MAIN">
                            Main Branch
                        </option>

                        <option value="MUMBAI">
                            Mumbai Branch
                        </option>

                        <option value="DELHI">
                            Delhi Branch
                        </option>

                    </select>

                </div>


                <!-- =================================================
                     IFSC CODE
                ================================================== -->

                <div class="form-field">

                    <label for="ifscCode">
                        IFSC Code
                    </label>

                    <input
                        type="text"
                        id="ifscCode"
                        name="ifscCode"
                        value=""
                        placeholder="IFSC Code"
                        readonly>

                    <small>
                        IFSC code is automatically assigned based on branch.
                    </small>

                </div>


                <!-- =================================================
                     ADMIN REMARKS
                ================================================== -->

                <div class="form-field">

                    <label for="adminRemarks">
                        Admin Remarks
                    </label>

                    <textarea
                        id="adminRemarks"
                        name="adminRemarks"
                        rows="4"
                        maxlength="500"
                        placeholder="Enter remarks..."></textarea>

                </div>




                <!-- =================================================
                     BUTTONS
                ================================================== -->

                <div class="account-form-buttons">


                    <button
                        type="button"
                        class="cancel-account"
                        onclick="closeAccountModal()">

                        Cancel

                    </button>


                    <button
                        type="submit"
                        class="save-account">

                        Create Account

                    </button>

                </div>


            </div>

        </form>

    </div>

</div>


<!-- =====================================================
     ACCOUNT MODAL JAVASCRIPT
===================================================== -->

<script>

    function openAccountModal() {

        document
            .getElementById("accountModal")
            .classList.add("show");

    }


    function closeAccountModal() {

        document
            .getElementById("accountModal")
            .classList.remove("show");

    }


    function updateIFSC() {

        const branch =
            document.getElementById("branch").value;

        const ifsc =
            document.getElementById("ifscCode");


        if (branch === "MAIN") {

            ifsc.value = "SMART0000001";

        }

        else if (branch === "MUMBAI") {

            ifsc.value = "SMART0000002";

        }

        else if (branch === "DELHI") {

            ifsc.value = "SMART0000003";

        }

        else {

            ifsc.value = "";

        }

    }

</script>

<script>

function openAccountModal() {

    document
        .getElementById("accountModal")
        .classList.add("show");

}

function closeAccountModal() {

    document
        .getElementById("accountModal")
        .classList.remove("show");

}

</script>









<%@ include file="../admin/admin_Footer.jsp" %>