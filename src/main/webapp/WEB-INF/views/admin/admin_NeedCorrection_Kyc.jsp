<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<%@ include file="../admin/admin_Header.jsp" %>


<style>

/* =========================================================
   PAGE
========================================================= */

.correction-page {

    width: 100%;
    padding: 30px 20px 50px;
    box-sizing: border-box;
    background: #f6f8fb;
}


.correction-card {

    width: 100%;
    max-width: 1000px;
    margin: 0 auto;
    padding: 30px;
    box-sizing: border-box;

    background: #ffffff;

    border-radius: 16px;

    box-shadow:
        0 8px 30px rgba(15, 23, 42, 0.08);
}


/* =========================================================
   ALERT
========================================================= */

.correction-alert {

    display: flex;
    align-items: center;

    gap: 10px;

    padding: 13px 16px;

    margin-bottom: 22px;

    border-radius: 9px;

    font-size: 14px;
    font-weight: 500;
}


.correction-alert-error {

    background: #fff1f1;

    border: 1px solid #f3c2c2;

    color: #b42318;
}


.correction-alert-success {

    background: #ecfdf3;

    border: 1px solid #abefc6;

    color: #067647;
}


/* =========================================================
   HEADER
========================================================= */

.page-header {

    display: flex;

    align-items: flex-start;

    justify-content: space-between;

    gap: 20px;

    padding-bottom: 22px;

    margin-bottom: 28px;

    border-bottom: 1px solid #e5e7eb;
}


.page-header h2 {

    margin: 0;

    color: #073b6f;

    font-size: 26px;

    font-weight: 700;
}


.page-header p {

    margin: 7px 0 0;

    color: #667085;

    font-size: 14px;

    line-height: 1.5;
}


.status-badge {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 8px 14px;

    border-radius: 20px;

    background: #fff4d8;

    color: #a56600;

    font-size: 12px;

    font-weight: 700;

    white-space: nowrap;

    text-transform: uppercase;
}


/* =========================================================
   SECTION
========================================================= */

.section {

    margin-bottom: 30px;
}


.section-title {

    margin-bottom: 16px;
}


.section-title h3 {

    margin: 0;

    color: #073b6f;

    font-size: 19px;

    font-weight: 700;
}


.section-title p {

    margin: 5px 0 0;

    color: #7b8798;

    font-size: 13px;
}


/* =========================================================
   ISSUE CARD
========================================================= */

.issue-container {

    border: 1px solid #dfe5ec;

    border-radius: 13px;

    overflow: hidden;

    background: #ffffff;
}


.issue-container-header {

    padding: 17px 20px;

    background: #fff7ed;

    border-bottom: 1px solid #fed7aa;
}


.issue-container-header h4 {

    margin: 0;

    color: #9a3412;

    font-size: 15px;

    font-weight: 700;
}


.issue-container-header p {

    margin: 5px 0 0;

    color: #c2410c;

    font-size: 13px;
}


/* =========================================================
   ISSUE ITEM
========================================================= */

.issue-item {

    padding: 20px;

    border-bottom: 1px solid #e5e7eb;
}


.issue-item:last-child {

    border-bottom: none;
}


.issue-item:hover {

    background: #fafcff;
}


.issue-main {

    display: flex;

    gap: 15px;
}


.issue-number {

    width: 32px;
    height: 32px;

    min-width: 32px;

    display: flex;

    align-items: center;

    justify-content: center;

    border-radius: 50%;

    background: #eef6ff;

    color: #0b67c1;

    font-size: 13px;

    font-weight: 700;
}


.issue-content {

    flex: 1;

    min-width: 0;
}


.issue-title {

    margin: 0 0 8px;

    color: #344054;

    font-size: 15px;

    font-weight: 700;
}


.issue-current {

    margin: 0 0 8px;

    color: #667085;

    font-size: 13px;

    line-height: 1.5;
}


.issue-current strong {

    color: #344054;
}


.issue-description {

    padding: 11px 13px;

    margin-top: 10px;

    border-radius: 8px;

    background: #fff1f1;

    border: 1px solid #f3c2c2;

    color: #b42318;

    font-size: 13px;

    line-height: 1.5;
}


/* =========================================================
   VERIFICATION
========================================================= */

.verification-area {

    margin-top: 18px;

    padding-top: 16px;

    border-top: 1px solid #edf0f4;
}


.verification-label {

    display: block;

    margin-bottom: 10px;

    color: #344054;

    font-size: 13px;

    font-weight: 700;
}


.verification-options {

    display: flex;

    gap: 12px;

    flex-wrap: wrap;
}


.verify-option {

    position: relative;

    cursor: pointer;
}


.verify-option input {

    position: absolute;

    opacity: 0;
}


.verify-option span {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    min-width: 130px;

    height: 40px;

    padding: 0 15px;

    box-sizing: border-box;

    border-radius: 8px;

    border: 1px solid #d9e0e8;

    background: #ffffff;

    color: #344054;

    font-size: 13px;

    font-weight: 600;

    transition: all .2s ease;
}


.verify-correct input:checked + span {

    background: #ecfdf3;

    border-color: #12b76a;

    color: #067647;
}


.verify-wrong input:checked + span {

    background: #fff1f1;

    border-color: #f04438;

    color: #b42318;
}


/* =========================================================
   REMARKS PER ISSUE
========================================================= */

.issue-remarks {

    width: 100%;

    min-height: 75px;

    margin-top: 12px;

    padding: 11px 13px;

    box-sizing: border-box;

    border: 1px solid #d9e0e8;

    border-radius: 8px;

    resize: vertical;

    font-family: inherit;

    font-size: 13px;

    color: #344054;

    outline: none;
}


.issue-remarks:focus {

    border-color: #0b67c1;

    box-shadow:
        0 0 0 3px rgba(11, 103, 193, .08);
}


/* =========================================================
   FINAL DECISION
========================================================= */

.final-section {

    margin-top: 30px;

    padding: 22px;

    border: 1px solid #dfe5ec;

    border-radius: 12px;

    background: #fafbfc;
}


.final-title {

    margin: 0 0 5px;

    color: #073b6f;

    font-size: 17px;

    font-weight: 700;
}


.final-description {

    margin: 0 0 18px;

    color: #667085;

    font-size: 13px;
}


.final-options {

    display: grid;

    grid-template-columns:
        repeat(3, minmax(0, 1fr));

    gap: 12px;
}


.final-option {

    position: relative;

    cursor: pointer;
}


.final-option input {

    position: absolute;

    opacity: 0;
}


.final-option span {

    min-height: 75px;

    padding: 12px;

    display: flex;

    flex-direction: column;

    align-items: center;

    justify-content: center;

    text-align: center;

    box-sizing: border-box;

    border: 1px solid #d9e0e8;

    border-radius: 9px;

    background: #ffffff;

    transition: all .2s ease;
}


.final-option strong {

    display: block;

    margin-bottom: 4px;

    font-size: 14px;
}


.final-option small {

    color: #667085;

    font-size: 11px;
}


.final-approve input:checked + span {

    background: #ecfdf3;

    border-color: #12b76a;

    color: #067647;
}


.final-correction input:checked + span {

    background: #fff7ed;

    border-color: #f79009;

    color: #b54708;
}


.final-reject input:checked + span {

    background: #fff1f1;

    border-color: #f04438;

    color: #b42318;
}


/* =========================================================
   ADMIN REMARKS
========================================================= */

.admin-remarks {

    margin-top: 18px;
}


.admin-remarks label {

    display: block;

    margin-bottom: 7px;

    color: #344054;

    font-size: 13px;

    font-weight: 700;
}


.admin-remarks textarea {

    width: 100%;

    min-height: 110px;

    padding: 12px 14px;

    box-sizing: border-box;

    border: 1px solid #d9e0e8;

    border-radius: 9px;

    resize: vertical;

    font-family: inherit;

    font-size: 14px;

    outline: none;
}


.admin-remarks textarea:focus {

    border-color: #0b67c1;

    box-shadow:
        0 0 0 3px rgba(11,103,193,.08);
}


/* =========================================================
   ACTION
========================================================= */

.action-area {

    display: flex;

    justify-content: flex-end;

    gap: 12px;

    margin-top: 25px;

    padding-top: 22px;

    border-top: 1px solid #e5e7eb;
}


.btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    min-width: 150px;

    height: 45px;

    padding: 0 20px;

    border-radius: 8px;

    box-sizing: border-box;

    font-size: 14px;

    font-weight: 600;

    text-decoration: none;

    cursor: pointer;
}


.btn-back {

    background: #eef2f6;

    color: #344054;

    border: 1px solid #d9e0e8;
}


.btn-submit {

    background: #067647;

    color: #ffffff;

    border: 1px solid #067647;
}


.btn-submit:hover {

    background: #05603a;
}


/* =========================================================
   NO ISSUE
========================================================= */

.no-issue {

    padding: 40px 20px;

    text-align: center;

    color: #667085;

    font-size: 14px;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 700px) {

    .correction-page {

        padding: 15px 10px 30px;
    }


    .correction-card {

        padding: 20px;
    }


    .page-header {

        flex-direction: column;
    }


    .final-options {

        grid-template-columns: 1fr;
    }


    .action-area {

        flex-direction: column;
    }


    .btn {

        width: 100%;
    }

}

</style>


<div class="correction-page">

    <div class="correction-card">


        <!-- =====================================================
             ALERT
        ====================================================== -->

        <c:if test="${not empty errorMessage}">

            <div class="correction-alert correction-alert-error">

                <span>⚠️</span>

                <span>
                    <c:out value="${errorMessage}" />
                </span>

            </div>

        </c:if>


        <c:if test="${not empty successMessage}">

            <div class="correction-alert correction-alert-success">

                <span>✅</span>

                <span>
                    <c:out value="${successMessage}" />
                </span>

            </div>

        </c:if>


        <!-- =====================================================
             HEADER
        ====================================================== -->

        <div class="page-header">

            <div>

                <h2>
                    KYC Correction Review
                </h2>

                <p>
                    Verify each correction submitted by the customer
                    before making the final KYC decision.
                </p>

            </div>


            <span class="status-badge">
                NEED CORRECTION
            </span>

        </div>


        <!-- =====================================================
             CORRECTION ISSUES
        ====================================================== -->

        <div class="section">

            <div class="section-title">

                <h3>
                    Correction Issues
                </h3>

                <p>
                    Only the issues identified during the previous
                    KYC verification are shown below.
                </p>

            </div>


            <form
                method="post"
                action="${pageContext.request.contextPath}/admin/admin-update-corrected-kyc"
                id="correctionForm">


                <!-- USER ID -->

                <input
                    type="hidden"
                    name="userId"
                    value="<c:out value='${kycData.userId}' />">


                <!-- PROFILE ID -->

                <input
                    type="hidden"
                    name="profileId"
                    value="<c:out value='${kycReview.profileId}' />">


                <div class="issue-container">


                    <div class="issue-container-header">

                        <h4>
                            Admin Verification
                        </h4>

                        <p>
                            Check every submitted correction and
                            mark whether it is correct.
                        </p>

                    </div>


                    <!-- =================================================
                         1. FULL NAME
                    ================================================== -->

                    <c:if test="${not empty kycReview.fullNameIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    1
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Full Name
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.fullName}" />
                                        </strong>

                                    </p>

                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.fullNameIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this correction correct?
                                        </label>


                                        <div class="verification-options">

                                            <label
                                                class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="fullNameStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label
                                                class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="fullNameStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="fullNameRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Full Name..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         2. DATE OF BIRTH
                    ================================================== -->

                    <c:if test="${not empty kycReview.dobIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    2
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Date of Birth
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.dob}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.dobIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this correction correct?
                                        </label>


                                        <div class="verification-options">

                                            <label
                                                class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="dobStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label
                                                class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="dobStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="dobRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Date of Birth..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         3. GENDER
                    ================================================== -->

                    <c:if test="${not empty kycReview.genderIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    3
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Gender
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.gender}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.genderIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this correction correct?
                                        </label>


                                        <div class="verification-options">

                                            <label
                                                class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="genderStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label
                                                class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="genderStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="genderRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Gender..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         4. ADDRESS
                    ================================================== -->

                    <c:if test="${not empty kycReview.addressIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    4
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Address
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.address}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.addressIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this correction correct?
                                        </label>


                                        <div class="verification-options">

                                            <label
                                                class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="addressStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label
                                                class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="addressStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="addressRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Address..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         5. CITY
                    ================================================== -->

                    <c:if test="${not empty kycReview.cityIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    5
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        City
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.city}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.cityIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this correction correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="cityStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="cityStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="cityRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for City..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         6. STATE
                    ================================================== -->

                    <c:if test="${not empty kycReview.stateIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    6
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        State
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.state}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.stateIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this correction correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="stateStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="stateStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="stateRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for State..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         7. PINCODE
                    ================================================== -->

                    <c:if test="${not empty kycReview.pincodeIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    7
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Pincode
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.pincode}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.pincodeIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this correction correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="pincodeStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="pincodeStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="pincodeRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Pincode..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         8. AADHAAR NUMBER
                    ================================================== -->

                    <c:if test="${not empty kycReview.aadhaarNoIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    8
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Aadhaar Number
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.aadhaarNo}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.aadhaarNoIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this Aadhaar number correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="aadhaarNoStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="aadhaarNoStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="aadhaarNoRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Aadhaar Number..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         9. AADHAAR DOCUMENT
                    ================================================== -->

                    <c:if test="${not empty kycReview.aadhaarIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    9
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Aadhaar Number
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Aadhar Number:

                                        <strong>
                                            Aadhaar Number
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.aadhaarIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this document correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="aadhaarStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="aadhaarStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="aadhaarRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Aadhaar Document..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         10. PAN NUMBER
                    ================================================== -->

                    <c:if test="${not empty kycReview.panNoIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    10
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        PAN Number
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Value:

                                        <strong>
                                            <c:out
                                                value="${kycData.panNo}" />
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.panNoIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this PAN number correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="panNoStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="panNoStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="panNoRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for PAN Number..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         11. PAN DOCUMENT
                    ================================================== -->

                    <c:if test="${not empty kycReview.panIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    11
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        PAN Document
                                    </h4>

                                    <p class="issue-current">

                                        Submitted Document:

                                        <strong>
                                            PAN document
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.panIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is this document correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="panStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="panStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="panRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for PAN Document..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         12. FACE VERIFICATION
                    ================================================== -->

                    <c:if test="${not empty kycReview.faceVideoIssue}">

                        <div class="issue-item">

                            <div class="issue-main">

                                <div class="issue-number">
                                    12
                                </div>

                                <div class="issue-content">

                                    <h4 class="issue-title">
                                        Face Verification
                                    </h4>

                                    <p class="issue-current">

                                        Submitted:

                                        <strong>
                                            Face verification video
                                        </strong>

                                    </p>


                                    <div class="issue-description">

                                        <strong>Previous Issue:</strong>

                                        <c:out
                                            value="${kycReview.faceVideoIssue}" />

                                    </div>


                                    <div class="verification-area">

                                        <label class="verification-label">
                                            Is the face verification correct?
                                        </label>


                                        <div class="verification-options">

                                            <label class="verify-option verify-correct">

                                                <input
                                                    type="radio"
                                                    name="faceVideoStatus"
                                                    value="CORRECT"
                                                    required>

                                                <span>
                                                    ✓ Correct
                                                </span>

                                            </label>


                                            <label class="verify-option verify-wrong">

                                                <input
                                                    type="radio"
                                                    name="faceVideoStatus"
                                                    value="NOT_CORRECT">

                                                <span>
                                                    ✗ Not Correct
                                                </span>

                                            </label>

                                        </div>


                                        <textarea
                                            name="faceVideoRemarks"
                                            class="issue-remarks"
                                            placeholder="Admin remarks for Face Verification..."></textarea>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:if>



                    <!-- =================================================
                         NO ISSUE
                    ================================================== -->

                    <c:if test="${empty kycReview.fullNameIssue
                        and empty kycReview.dobIssue
                        and empty kycReview.genderIssue
                        and empty kycReview.addressIssue
                        and empty kycReview.cityIssue
                        and empty kycReview.stateIssue
                        and empty kycReview.pincodeIssue
                        and empty kycReview.aadhaarNoIssue
                        and empty kycReview.aadhaarIssue
                        and empty kycReview.panNoIssue
                        and empty kycReview.panIssue
                        and empty kycReview.faceVideoIssue}">

                        <div class="no-issue">

                            No correction issues are available
                            for this application.

                        </div>

                    </c:if>


                </div>


                <!-- =====================================================
                     FINAL DECISION
                ====================================================== -->

                <div class="final-section">

                    <h3 class="final-title">
                        Final KYC Decision
                    </h3>


                    <p class="final-description">

                        After checking all correction items,
                        select the final status for this KYC application.

                    </p>


                    <div class="final-options">


                        <!-- APPROVED -->

                        <label
                            class="final-option final-approve">

                            <input
                                type="radio"
                                name="finalStatus"
                                value="APPROVED"
                                required>

                            <span>

                                <strong>
                                    ✓ Approve KYC
                                </strong>

                                <small>
                                    All corrections are valid
                                </small>

                            </span>

                        </label>



                        <!-- NEED CORRECTION -->

                        <label
                            class="final-option final-correction">

                            <input
                                type="radio"
                                name="finalStatus"
                                value="NEED_CORRECTION">

                            <span>

                                <strong>
                                    ↻ Need Correction
                                </strong>

                                <small>
                                    One or more items are incorrect
                                </small>

                            </span>

                        </label>



                        <!-- REJECT -->

                        <label
                            class="final-option final-reject">

                            <input
                                type="radio"
                                name="finalStatus"
                                value="REJECTED">

                            <span>

                                <strong>
                                    ✕ Reject KYC
                                </strong>

                                <small>
                                    Application cannot be approved
                                </small>

                            </span>

                        </label>

                    </div>


                    <!-- ADMIN REMARKS -->

                    <div class="admin-remarks">

                        <label>
                            Admin Remarks
                        </label>

                        <textarea
                            name="adminRemarks"
                            id="adminRemarks"
                            placeholder="Enter final verification remarks..."
                            required></textarea>

                    </div>

                </div>



                <!-- =====================================================
                     ACTION
                ====================================================== -->

                <div class="action-area">


                    <a
                        href="${pageContext.request.contextPath}/admin/need_correction_application"
                        class="btn btn-back">

                        ← Back

                    </a>


                    <button
                        type="submit"
                        class="btn btn-submit">

                        Submit KYC Decision

                    </button>


                </div>


            </form>

        </div>

    </div>

</div>



<script>

document
    .getElementById("correctionForm")
    .addEventListener("submit", function(event) {


        const finalStatus =
            document.querySelector(
                'input[name="finalStatus"]:checked'
            );


        /* =====================================================
           FINAL STATUS REQUIRED
        ===================================================== */

        if (!finalStatus) {

            event.preventDefault();

            alert(
                "Please select the final KYC status."
            );

            return;
        }


        const status =
            finalStatus.value;


        /* =====================================================
           APPROVED
           Every displayed issue must be CORRECT
        ===================================================== */

        if (status === "APPROVED") {


            const issueItems =
                document.querySelectorAll(
                    ".issue-item"
                );


            let invalid = false;


            issueItems.forEach(function(item) {


                const correct =
                    item.querySelector(
                        'input[value="CORRECT"]:checked'
                    );


                if (!correct) {

                    invalid = true;

                }

            });


            if (invalid) {

                event.preventDefault();

                alert(
                    "Before approving KYC, please mark every correction item as Correct."
                );

                return;
            }

        }


        /* =====================================================
           NEED CORRECTION
           At least one item must be NOT_CORRECT
        ===================================================== */

        if (status === "NEED_CORRECTION") {


            const wrongItems =
                document.querySelectorAll(
                    'input[value="NOT_CORRECT"]:checked'
                );


            if (wrongItems.length === 0) {

                event.preventDefault();

                alert(
                    "Please mark at least one correction item as Not Correct."
                );

                return;
            }

        }


        /* =====================================================
           REJECT
           ADMIN REMARKS REQUIRED
        ===================================================== */

        if (status === "REJECTED") {


            const remarks =
                document
                    .getElementById("adminRemarks")
                    .value
                    .trim();


            if (remarks.length === 0) {

                event.preventDefault();

                alert(
                    "Please enter remarks before rejecting the KYC."
                );

                return;
            }

        }


        /* =====================================================
           FINAL CONFIRMATION
        ===================================================== */

        const confirmed =
            confirm(
                "Are you sure you want to submit this KYC decision?"
            );


        if (!confirmed) {

            event.preventDefault();

        }

    });

</script>


<%@ include file="../admin/admin_Footer.jsp" %>