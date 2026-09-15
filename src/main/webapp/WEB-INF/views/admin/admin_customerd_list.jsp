<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../admin/admin_Header.jsp" %>



<style>
	
	
	/* =========================================================
	   CUSTOMER MODAL
	========================================================= */

	.customer-modal {
	    display: none;

	    position: fixed;
	    inset: 0;

	    width: 100%;
	    height: 100%;

	    z-index: 99999;

	    align-items: center;
	    justify-content: center;
	}

	.customer-modal.show {
	    display: flex;
	}


	/* =========================================================
	   OVERLAY
	========================================================= */

	.customer-modal-overlay {
	    position: fixed;

	    inset: 0;

	    width: 100%;
	    height: 100%;

	    background: rgba(0, 0, 0, 0.55);

	    /* IMPORTANT:
	       Do NOT use filter: blur()
	       Do NOT use backdrop-filter: blur()
	    */
	}


	/* =========================================================
	   MODAL BOX
	========================================================= */

	.customer-modal-box {
	    position: relative;

	    z-index: 100000;

	    width: 650px;
	    max-width: 90%;

	    max-height: 90vh;

	    overflow-y: auto;

	    background: #ffffff;

	    border-radius: 12px;

	    padding: 28px;

	    box-shadow:
	        0 15px 50px rgba(0, 0, 0, 0.30);

	    /* IMPORTANT */
	    filter: none;

	    backdrop-filter: none;

	    opacity: 1;
	}


	/* =========================================================
	   HEADER
	========================================================= */

	.customer-modal-header {
	    display: flex;

	    justify-content: space-between;

	    align-items: flex-start;

	    margin-bottom: 25px;

	    padding-bottom: 18px;

	    border-bottom: 1px solid #eeeeee;
	}

	.customer-modal-header h2 {
	    margin: 0;

	    font-size: 23px;

	    color: #222;
	}

	.customer-modal-header p {
	    margin: 5px 0 0;

	    color: #777;

	    font-size: 14px;
	}


	/* =========================================================
	   CLOSE BUTTON
	========================================================= */

	.customer-modal-close {
	    width: 35px;
	    height: 35px;

	    border: none;

	    border-radius: 50%;

	    background: #f1f1f1;

	    color: #333;

	    font-size: 22px;

	    cursor: pointer;
	}


	/* =========================================================
	   FORM ROW
	========================================================= */

	.edit-form-row {
	    display: grid;

	    grid-template-columns: 1fr 1fr;

	    gap: 20px;

	    margin-bottom: 18px;
	}


	/* =========================================================
	   FORM GROUP
	========================================================= */

	.edit-form-group {
	    display: flex;

	    flex-direction: column;
	}

	.edit-form-group label {
	    margin-bottom: 7px;

	    font-size: 14px;

	    font-weight: 600;

	    color: #444;
	}

	.edit-form-group input {
	    width: 100%;

	    height: 42px;

	    padding: 0 12px;

	    border: 1px solid #ddd;

	    border-radius: 6px;

	    outline: none;

	    background: #fff;

	    color: #222;

	    font-size: 14px;

	    box-sizing: border-box;
	}

	.edit-form-group input:focus {
	    border-color: #0d6efd;

	    box-shadow:
	        0 0 0 3px rgba(13, 110, 253, 0.10);
	}

	.edit-form-group input[readonly] {
	    background: #f5f5f5;

	    color: #777;
	}


	/* =========================================================
	   BUTTONS
	========================================================= */

	.customer-modal-actions {
	    display: flex;

	    justify-content: flex-end;

	    gap: 10px;

	    margin-top: 25px;
	}

	.modal-cancel-btn {
	    padding: 11px 20px;

	    border: none;

	    border-radius: 6px;

	    background: #eeeeee;

	    color: #333;

	    cursor: pointer;
	}

	.modal-update-btn {
	    padding: 11px 20px;

	    border: none;

	    border-radius: 6px;

	    background: #0d6efd;

	    color: #ffffff;

	    cursor: pointer;
	}

	.modal-update-btn:hover {
	    background: #0b5ed7;
	}


	/* =========================================================
	   MOBILE
	========================================================= */

	@media (max-width: 600px) {

	    .edit-form-row {
	        grid-template-columns: 1fr;
	    }

	    .customer-modal-box {
	        width: 90%;
	        padding: 20px;
	    }
	}
	</style>




<div class="customer-page">


    <!-- =========================================================
         CUSTOMER TABLE CARD
    ========================================================== -->

    <div class="customer-table-card">


        <!-- =====================================================
             HEADER
        ====================================================== -->

        <div class="customer-table-header">

            <div>

                <h2>Customer List</h2>

                <p>
                    View and manage registered customers
                </p>

            </div>


          
        </div>


		
		<c:if test="${not empty errorMessage}">

		    <div class="customer-error-message">

		        <span class="error-icon">⚠️</span>

		        <span>
		            ${errorMessage}
		        </span>

		    </div>

		</c:if>
		
		
        <!-- =====================================================
             TABLE
        ====================================================== -->

        <div class="customer-table-wrapper">

            <table class="customer-table">


                <!-- ================= TABLE HEADER ================= -->

                <thead>

                    <tr>

                        <th>Sr.No</th>

                        <th>NAME</th>

                        <th>EMAIL</th>

                        <th>MOBILE</th>

                        <th>ROLE</th>

                        <th>PASSWORD</th>

                        <th>CREATED DATE</th>

                        <th>ACTION</th>

                    </tr>

                </thead>


                <!-- ================= TABLE BODY ================= -->

                <tbody>


                    <c:forEach
                        var="user"
                        items="${customers}"
                        varStatus="status">

                        <tr>


                            <!-- =================================================
                                 SERIAL NUMBER
                            ================================================== -->

                            <td>

                                <span class="customer-id">

                                    ${currentPage * pageSize + status.index + 1}

                                </span>

                            </td>


                            <!-- =================================================
                                 NAME
                            ================================================== -->

                            <td>

                                <strong>
                                    ${user.name}
                                </strong>

                            </td>


                            <!-- =================================================
                                 EMAIL
                            ================================================== -->

                            <td>

                                ${user.email}

                            </td>


                            <!-- =================================================
                                 MOBILE
                            ================================================== -->

                            <td>

                                ${user.mobile}

                            </td>


                            <!-- =================================================
                                 ROLE
                            ================================================== -->

                            <td>

                                <span class="role-badge">

                                    ${user.role}

                                </span>

                            </td>


                            <!-- =================================================
                                 PASSWORD
                            ================================================== -->

                            <td>

                                <span class="password-mask">
                                    ••••••••••
                                </span>

                            </td>


                            <!-- =================================================
                                 CREATED DATE
                            ================================================== -->

                            <td>

                                ${user.createdAt.toLocalDate()}

                            </td>


                            <!-- =================================================
                                 ACTION
                            ================================================== -->

                            <td>

                                <div class="customer-action-buttons">


                                    <!-- EDIT -->
									<button
									    type="button"
									    class="customer-action edit-action"
									    title="Edit Customer"

									    data-user-id="${user.userId}"
									    data-name="${user.name}"
									    data-email="${user.email}"
									    data-mobile="${user.mobile}"

									    onclick="openEditModal(this)">

									    ✎

									</button>

                                    <!-- DELETE -->

                                    <form
                                        action="/admin/customer/delete/${user.userId}"
                                        method="post"
                                        class="delete-customer-form"
                                        onsubmit="return confirmDelete('${user.name}');">

                                        <button
                                            type="submit"
                                            class="customer-action delete-action"
                                            title="Delete Customer">

                                            🗑

                                        </button>

                                    </form>


                                </div>

                            </td>


                        </tr>

                    </c:forEach>


                    <!-- =================================================
                         NO DATA
                    ================================================== -->

                    <c:if test="${empty customers}">

                        <tr>

                            <td
                                colspan="8"
                                class="no-customer-data">

                                <div class="no-data-content">

                                    <span class="no-data-icon">
                                        👥
                                    </span>

                                    <strong>
                                        No customers found
                                    </strong>

                                    <small>
                                        There are currently no registered customers.
                                    </small>

                                </div>

                            </td>

                        </tr>

                    </c:if>


                </tbody>

            </table>

        </div>


		<!-- ================= PAGINATION ================= -->

		<c:if test="${totalElements > 0}">

		    <div class="customer-pagination">

		        <!-- ================= PAGINATION INFO ================= -->

		        <span class="pagination-info">

		            Showing

		            <strong>
		                ${currentPage * pageSize + 1}
		            </strong>

		            –

		            <strong>
		                <c:choose>

		                    <c:when test="${(currentPage + 1) * pageSize < totalElements}">
		                        ${(currentPage + 1) * pageSize}
		                    </c:when>

		                    <c:otherwise>
		                        ${totalElements}
		                    </c:otherwise>

		                </c:choose>
		            </strong>

		            of

		            <strong>
		                ${totalElements}
		            </strong>

		            customers

		        </span>


		        <!-- ================= PAGINATION BUTTONS ================= -->

		        <div class="pagination-buttons">


		            <!-- PREVIOUS BUTTON -->

		            <c:choose>

		                <c:when test="${currentPage > 0}">

		                    <a
		                        href="?page=${currentPage - 1}&size=${pageSize}"
		                        class="page-btn">

		                        ‹

		                    </a>

		                </c:when>

		                <c:otherwise>

		                    <span class="page-btn disabled">
		                        ‹
		                    </span>

		                </c:otherwise>

		            </c:choose>


		            <!-- ================= PAGE NUMBERS ================= -->

		            <c:forEach
		                begin="0"
		                end="${totalPages - 1}"
		                var="i">

		                <a
		                    href="?page=${i}&size=${pageSize}"
		                    class="page-btn ${i == currentPage ? 'active' : ''}">

		                    ${i + 1}

		                </a>

		            </c:forEach>


		            <!-- NEXT BUTTON -->

		            <c:choose>

		                <c:when test="${currentPage < totalPages - 1}">

		                    <a
		                        href="?page=${currentPage + 1}&size=${pageSize}"
		                        class="page-btn">

		                        ›

		                    </a>

		                </c:when>

		                <c:otherwise>

		                    <span class="page-btn disabled">
		                        ›
		                    </span>

		                </c:otherwise>

		            </c:choose>


		        </div>

		    </div>

		</c:if>

		
		
		
		
		
		
		
		<!-- =========================================================
		     EDIT CUSTOMER MODAL
		========================================================= -->

		<div id="editCustomerModal" class="customer-modal">

		    <div class="customer-modal-overlay"
		         onclick="closeEditModal()">
		    </div>


		    <div class="customer-modal-box">


		        <!-- HEADER -->

		        <div class="customer-modal-header">

		            <div>
		                <h2>Edit Customer</h2>

		                <p>
		                    Update customer information
		                </p>
		            </div>

		            <button
		                type="button"
		                class="customer-modal-close"
		                onclick="closeEditModal()">

		                ×

		            </button>

		        </div>


		        <!-- FORM -->

		        <form
		            action="/admin/customer/update"
		            method="post">


		            <!-- USER ID -->

		            <input
		                type="hidden"
		                id="editUserId"
		                name="userId">


		            <div class="edit-form-row">


		                <!-- NAME -->

		                <div class="edit-form-group">

		                    <label>
		                        Name
		                    </label>

		                    <input
		                        type="text"
		                        id="editName"
		                        name="name"
		                        required>

		                </div>


		                <!-- EMAIL -->

		                <div class="edit-form-group">

		                    <label>
		                        Email
		                    </label>

		                    <input
		                        type="email"
		                        id="editEmail"
		                        name="email"
		                        readonly>

		                </div>


		            </div>


		            <div class="edit-form-row">


		                <!-- MOBILE -->

		                <div class="edit-form-group">

		                    <label>
		                        Mobile
		                    </label>

		                    <input
		                        type="text"
		                        id="editMobile"
		                        name="mobile"
		                        maxlength="10"
		                        required>

		                </div>


		           


		            </div>


		          

		            <!-- BUTTONS -->

		            <div class="customer-modal-actions">

		                <button
		                    type="button"
		                    class="modal-cancel-btn"
		                    onclick="closeEditModal()">

		                    Cancel

		                </button>


		                <button
		                    type="submit"
		                    class="modal-update-btn">

		                    Update Customer

		                </button>

		            </div>


		        </form>

		    </div>

		</div>
		
		
		

<!-- =========================================================
     DELETE CONFIRMATION
========================================================== -->

<script>

function confirmDelete(customerName) {

    return confirm(
        "Are you sure you want to delete customer '" +
        customerName +
        "'?"
    );

}

</script>





<script>

function openEditModal(button) {

    document.getElementById("editUserId").value =
        button.dataset.userId;

    document.getElementById("editName").value =
        button.dataset.name;

    document.getElementById("editEmail").value =
        button.dataset.email;

    document.getElementById("editMobile").value =
        button.dataset.mobile;



    document.getElementById("editCustomerModal")
        .classList.add("show");
}


function closeEditModal() {

    document.getElementById("editCustomerModal")
        .classList.remove("show");

}

</script>





<script>

document.addEventListener("DOMContentLoaded", function () {

    <%-- SUCCESS MESSAGE --%>

    <c:if test="${not empty successMessage}">

        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: '${successMessage}',
            confirmButtonText: 'OK',
            confirmButtonColor: '#0d6efd'
        });

    </c:if>


    <%-- ERROR MESSAGE --%>

    <c:if test="${not empty errorMessage}">

        Swal.fire({
            icon: 'error',
            title: 'Error!',
            text: '${errorMessage}',
            confirmButtonText: 'OK',
            confirmButtonColor: '#dc3545'
        });

    </c:if>

});

</script>




<%@ include file="../admin/admin_Footer.jsp" %>