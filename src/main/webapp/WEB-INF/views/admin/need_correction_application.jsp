<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>




	<%@ include file="../admin/admin_Header.jsp" %>

	
	
	

	<!-- ================= message pop handle backend show ================= -->

	<c:if test="${not empty successMessage}">
	    <script>
	        document.addEventListener("DOMContentLoaded", function () {
	            Swal.fire({
	                icon: 'success',
	                title: 'Success!',
	                text: '${successMessage}',
	                confirmButtonText: 'OK',
	                confirmButtonColor: '#198754',
	                allowOutsideClick: false,
	                allowEscapeKey: false
	            });
	        });
	    </script>
	</c:if>


	<c:if test="${not empty errorMessage}">
	    <script>
	        document.addEventListener("DOMContentLoaded", function () {
	            Swal.fire({
	                icon: 'error',
	                title: 'Error!',
	                text: '${errorMessage}',
	                confirmButtonText: 'OK',
	                confirmButtonColor: '#dc3545',
	                allowOutsideClick: false,
	                allowEscapeKey: false
	            });
	        });
	    </script>
	</c:if>



		<div class="admin-profile-page">

			<div class="customer-table-card">


				
					
				
				
				
				
				
				
				<!-- ================= HEADER ================= -->

				<div class="customer-table-header">

					<div>

						<h2>Need Correction In KYC Applications</h2>

						<p>
							Need Correction KYC applications
						</p>

					</div>

				</div>

				
				
				
		
				<!-- ================= TABLE ================= -->

				<div class="customer-table-wrapper">

					<table class="customer-table">

						<thead>

							<tr>

								<th>SR.NO</th>


								<th>FULL NAME</th>
							

								<th>KYC STATUS</th>


								<th>UPLOAD DATE</th>

								<th>ACTION</th>
							</tr>

						</thead>


						<tbody>

							<!-- ================= DYNAMIC DATA ================= -->

							<c:forEach var="kyc" items="${kycList}" varStatus="status">

								<tr>

									<!-- PROFILE ID -->

									<td>
										<span class="customer-id">

											${currentPage * pageSize + status.index + 1}

										</span>
									</td>





									<!-- FULL NAME -->

									<td>
										${kyc.fullName}
									</td>


								

									<!-- KYC STATUS -->

									<td>

										<span class="status-badge status-pending">

											${kyc.kycStatus}

										</span>

									</td>


								


									<!-- UPLOAD DATE -->

									<td>
										${kyc.uploadDate.toLocalDate()}
									</td>


									
									
									<td>

									    <div class="action-buttons">

									        <!-- EDIT -->

											<a 
											    href="${pageContext.request.contextPath}/admin/admin_NeedCorrection_Kyc/${kyc.profileId}" 
											    class="action-btn edit-btn" 
											    title="Edit KYC">

											    ✏️

											</a>


									        <!-- DELETE -->

									        <form
									            action="${pageContext.request.contextPath}/admin/deleteKyc/${kyc.profileId}"
									            method="post"
									            style="display:inline;"
									            onsubmit="return confirm('Are you sure you want to delete this KYC application?');">

									            <button
									                type="submit"
									                class="action-btn delete-btn"
									                title="Delete KYC">

									                🗑️

									            </button>

									        </form>

									    </div>

									</td>


								</tr>

							</c:forEach>


							<!-- ================= NO DATA ================= -->

							<c:if test="${empty kycList}">

								<tr>

									<td colspan="14" style="text-align:center;">

										No need to correction KYC applications found.

									</td>

								</tr>

							</c:if>

						</tbody>

					</table>

				</div>


				<!-- ================= PAGINATION ================= -->


				<c:if test="${totalElements > 0}">

				    <div class="customer-pagination">

				        <!-- PAGINATION INFO -->

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

				            pending applications

				        </span>


				        <!-- PAGINATION BUTTONS -->

				        <div class="pagination-buttons">


				            <!-- PREVIOUS -->

				            <c:choose>

				                <c:when test="${currentPage > 0}">

				                    <a
				                        href="${pageContext.request.contextPath}/admin/pending-application?page=${currentPage - 1}"
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


				            <!-- PAGE NUMBERS -->

				            <c:if test="${totalPages > 0}">

				                <c:forEach
				                    begin="0"
				                    end="${totalPages - 1}"
				                    var="i">

				                    <a
				                        href="${pageContext.request.contextPath}/admin/pending-application?page=${i}"
				                        class="page-btn ${i == currentPage ? 'active' : ''}">

				                        ${i + 1}

				                    </a>

				                </c:forEach>

				            </c:if>


				            <!-- NEXT -->

				            <c:choose>

				                <c:when test="${currentPage < totalPages - 1}">

				                    <a
				                        href="${pageContext.request.contextPath}/admin/pending-application?page=${currentPage + 1}"
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

			</div>

		</div>


		<%@ include file="../admin/admin_Footer.jsp" %>


