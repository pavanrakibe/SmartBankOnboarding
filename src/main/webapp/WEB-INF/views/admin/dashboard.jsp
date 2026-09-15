<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>




<%@ include file="../admin/admin_Header.jsp" %>




<!-- =====================================================
     CONTENT
===================================================== -->

<div class="content">

<!-- =====================================================
     WELCOME
===================================================== -->

<div class="welcome-box">
<div>

    <h2>
        Welcome back, ${adminName} 👋
    </h2>

    <p>
        Here's what's happening with Digital Account Gateway onboarding today.
    </p>

</div>


<div class="welcome-icon">
    🏦
</div>

</div>

<!-- =====================================================
     STATISTICS
===================================================== -->

<div class="stats-grid">

<!-- Customers -->

<a href="/admin/customer-list" style="text-decoration:none;">
<div class="stat-card">

    <div class="stat-top">

        <div>

            <p>
                Total Customers
            </p>

        </div>


        <div class="stat-icon">
            👥
        </div>

    </div>


    <h3>
        ${not empty customer_count ? customer_count:0}
    </h3>


    <div class="stat-change">
        ↑ 12.5% this month
    </div>

</div>
</a>





<!-- Applications -->
<a href="/admin/pending-application" style="text-decoration:none;">

<div class="stat-card">

    <div class="stat-top">

        <div>

            <p>
                Total Kyc Applications
            </p>

        </div>


        <div class="stat-icon">
            📋
        </div>

    </div>


    <h3>
		${not empty application_count ? application_count : 0}
    </h3>


    <div class="stat-change">
        ↑ 7.2% this month
    </div>

</div>
</a>




<!-- Contact Leads -->

<div class="stat-card">

    <div class="stat-top">

        <div>

            <p>
                Total Leads
            </p>

        </div>

		<!-- Total Leads -->
		<div class="stat-icon">
		    👥
		</div>

    </div>


    <h3>
        ${not empty contactLead_count ? contactLead_count:0}
    </h3>


    <div class="stat-change">
        ↑ 8.2% this month
    </div>

</div>







<!-- Bank Accounts -->

<div class="stat-card">

    <div class="stat-top">

        <div>

            <p>
                Total Bank Accounts
            </p>

        </div>

		<div class="stat-icon">
		    🏦
		</div>

    </div>


    <h3>
		${not empty totalAccounts ? totalAccounts : 0}

		
    </h3>


    <div class="stat-change">
        ↑ 8.2% this month
    </div>

</div>


</div>

<!-- =====================================================
     APPLICATIONS + QUICK ACTIONS
===================================================== -->


<!-- RECENT APPLICATIONS -->

<div class="section">


<!-- ================= INQUIRY LEADS TABLE ================= -->

<div class="customer-table-card">

	
	<!-- Table Header -->
<div class="customer-table-header">

    <div>
        <h2> Customer Inquiry Leads</h2>

        <p>
            View and manage customer inquiry leads
        </p>
    </div>

</div>


<!-- ================= TABLE ================= -->

<div class="customer-table-wrapper">

	<table class="customer-table">

	    <thead>

	        <tr>

	            <th>
	                ID
	            </th>

	            <th>
	                CUSTOMER NAME
	            </th>

	            <th>
	                EMAIL ID
	            </th>

	            <th>
	                MOBILE
	            </th>

	            <th>
	                SUBJECT
	            </th>

	            <th>
	                MESSAGE
	            </th>

	            <th>
	                DATE
	            </th>

	            <th>
	                ACTION
	            </th>

	        </tr>

	    </thead>


	    <tbody>


	        <!-- ==========================================
	             DATABASE CUSTOMER LEADS
	        =========================================== -->

				<c:forEach var="lead" items="${leads}" varStatus="status">

	            <tr>


	                <!-- ==================================
	                     ID
	                =================================== -->

	                <td>

	                   ${currentPage * pageSize + status.index + 1}

	                </td>



	                <!-- ==================================
	                     CUSTOMER NAME
	                =================================== -->

	                <td>

	                    <div class="customer-info">


	                        <div class="customer-avatar">

	                            ${lead.name.substring(0,1).toUpperCase()}

	                        </div>


	                        <div>

	                            <strong>

	                                ${lead.name}

	                            </strong>


	                            <small>

	                                ${lead.name}

	                            </small>

	                        </div>


	                    </div>

	                </td>



	                <!-- ==================================
	                     EMAIL
	                =================================== -->

	                <td>

	                    ${lead.email}

	                </td>



	                <!-- ==================================
	                     MOBILE
	                =================================== -->

	                <td>

	                    ${lead.mobile}

	                </td>



	                <!-- ==================================
	                     SUBJECT
	                =================================== -->

	                <td>

	                    ${lead.subject}

	                </td>



	                <!-- ==================================
	                     MESSAGE
	                =================================== -->

	                <td>

	                    <div class="message-text"
	                         title="${lead.message}">

	                        ${lead.message}

	                    </div>

	                </td>



	                <!-- ==================================
	                     DATE
	                =================================== -->

	                <td>

	                     ${lead.createdDate.toLocalDate()}
	                </td>



	                <!-- ==================================
	                     ACTION
	                =================================== -->

	                <td>

	                    <div class="action-buttons">


	                  

	                        <!-- DELETE -->

	                        <button
	                            type="button"
	                            class="action-btn block-btn"
	                            title="Delete"
	                            onclick="deleteLead('${lead.id}')">

	                              ⛔

	                        </button>


	                    </div>

	                </td>


	            </tr>


	        </c:forEach>



	        <!-- ==========================================
	             NO DATA
	        =========================================== -->

	        <c:if test="${empty leads}">

	            <tr>

	                <td
	                    colspan="8"
	                    style="text-align:center; padding:40px;">

	                    No customer inquiry leads found.

	                </td>

	            </tr>

	        </c:if>


	    </tbody>

	</table>

</div>







<!-- ================= PAGINATION ================= -->

<div class="customer-pagination">


    <!-- ================= RECORD COUNT ================= -->

    <span class="pagination-info">

        <c:choose>

            <c:when test="${totalElements > 0}">

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

                inquiry leads

            </c:when>

            <c:otherwise>

                No inquiry leads

            </c:otherwise>

        </c:choose>

    </span>



    <!-- ================= PAGE BUTTONS ================= -->
	<!-- ================= PAGE BUTTONS ================= -->

	<div class="pagination-buttons">


	    <!-- PREVIOUS -->

	    <c:choose>

	        <c:when test="${currentPage > 0}">

	            <a
	                href="${baseUrl}/admin/dashboard?page=${currentPage - 1}&size=${pageSize}"
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



	    <!-- PAGE 1 -->

	    <c:if test="${totalPages >= 1}">

	        <a
	            href="${baseUrl}/admin/dashboard?page=0&size=${pageSize}"
	            class="page-btn ${currentPage == 0 ? 'active' : ''}">

	            1

	        </a>

	    </c:if>



	    <!-- PAGE 2 -->

	    <c:if test="${totalPages >= 2}">

	        <a
	            href="${baseUrl}/admin/dashboard?page=1&size=${pageSize}"
	            class="page-btn ${currentPage == 1 ? 'active' : ''}">

	            2

	        </a>

	    </c:if>



	    <!-- PAGE 3 -->

	    <c:if test="${totalPages >= 3}">

	        <a
	            href="${baseUrl}/admin/dashboard?page=2&size=${pageSize}"
	            class="page-btn ${currentPage == 2 ? 'active' : ''}">

	            3

	        </a>

	    </c:if>



	    <!-- DOTS -->

	    <c:if test="${totalPages > 4}">

	        <span class="page-dots">

	            ...

	        </span>

	    </c:if>



	    <!-- LAST PAGE -->

	    <c:if test="${totalPages > 3}">

	        <a
	            href="${baseUrl}/admin/dashboard?page=${totalPages - 1}&size=${pageSize}"
	            class="page-btn ${currentPage == totalPages - 1 ? 'active' : ''}">

	            ${totalPages}

	        </a>

	    </c:if>



	    <!-- NEXT -->

	    <c:choose>

	        <c:when test="${currentPage < totalPages - 1}">

	            <a
	                href="${baseUrl}/admin/dashboard?page=${currentPage + 1}&size=${pageSize}"
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





</div>


</div>







</div>

</div>




<script>
	
	
	function deleteLead(id)
	{
		if(!confirm("Are you sure you want to delete this inquiry lead?"))
		{
			return;
		}
		
		window.location.href="${baseUrl}/admin/deleteLead?id="+id;
	}
	
</script>



	
	

	<script>

	    <c:if test="${not empty successMessage}">

	        Swal.fire({
	            icon: 'success',
	            title: 'Success',
	            text: '${successMessage}',
	            confirmButtonText: 'OK'
	        });

	    </c:if>


	    <c:if test="${not empty errorMessage}">

	        Swal.fire({
	            icon: 'error',
	            title: 'Error',
	            text: '${errorMessage}',
	            confirmButtonText: 'OK'
	        });

	    </c:if>

	</script>


<%@ include file="../admin/admin_Footer.jsp" %>

