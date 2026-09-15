<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<%@ include file="../admin/admin_Header.jsp" %>


<style>

/* =========================================================
   GLOBAL
========================================================= */

.kyc-edit-page {
    width: 100%;
    padding: 25px 20px 50px;
    box-sizing: border-box;
    background: #f6f8fb;
}

.kyc-edit-card {
    width: 100%;
    max-width: 1180px;
    margin: 0 auto;
    background: #ffffff;
    border-radius: 18px;
    padding: 30px;
    box-sizing: border-box;
    box-shadow: 0 8px 30px rgba(15, 23, 42, 0.07);
}


/* =========================================================
   HEADER
========================================================= */

.kyc-edit-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;

    padding-bottom: 22px;
    margin-bottom: 25px;

    border-bottom: 1px solid #e8edf3;
}

.kyc-edit-header-content h2 {
    margin: 0;
    color: #073b6f;
    font-size: 27px;
    font-weight: 700;
    line-height: 1.3;
}

.kyc-edit-header-content p {
    margin: 7px 0 0;
    color: #7b8798;
    font-size: 14px;
}

.kyc-edit-badge {
    display: inline-flex;
    align-items: center;
    justify-content: center;

    min-width: 90px;

    padding: 8px 14px;

    border-radius: 20px;

    background: #fff4d8;
    color: #a56600;

    font-size: 12px;
    font-weight: 700;

    text-transform: uppercase;
    letter-spacing: 0.3px;
}


/* =========================================================
   ERROR
========================================================= */

.kyc-error-message {
    display: flex;
    align-items: center;
    gap: 10px;

    padding: 13px 16px;
    margin-bottom: 22px;

    border-radius: 9px;

    background: #fff1f1;
    border: 1px solid #f3c2c2;

    color: #b42318;

    font-size: 14px;
    font-weight: 500;
}


/* =========================================================
   SECTION TITLE
========================================================= */

.kyc-section-title {
    margin-bottom: 18px;
}

.kyc-section-title h3 {
    margin: 0;
    color: #073b6f;
    font-size: 19px;
    font-weight: 700;
}

.kyc-section-title p {
    margin: 5px 0 0;
    color: #7b8798;
    font-size: 13px;
}


/* =========================================================
   CUSTOMER INFORMATION
========================================================= */

.kyc-information-section {
    margin-bottom: 30px;
}

.kyc-information-grid {
    display: grid;

    grid-template-columns:
        repeat(2, minmax(0, 1fr));

    gap: 18px 22px;
}

.kyc-form-group {
    display: flex;
    flex-direction: column;
    gap: 7px;

    min-width: 0;
}

.kyc-form-group.full-width {
    grid-column: 1 / -1;
}

.kyc-form-group label {
    color: #344054;

    font-size: 13px;
    font-weight: 600;
}

.kyc-form-group input,
.kyc-form-group select,
.kyc-form-group textarea {

    width: 100%;

    padding: 12px 14px;

    box-sizing: border-box;

    border: 1px solid #d9e0e8;

    border-radius: 9px;

    background: #ffffff;

    color: #1f2937;

    font-family: inherit;

    font-size: 14px;

    outline: none;

    transition:
        border-color 0.2s ease,
        box-shadow 0.2s ease,
        background 0.2s ease;
}

.kyc-form-group input,
.kyc-form-group select {
    height: 45px;
}

.kyc-form-group textarea {
    min-height: 100px;
    resize: vertical;
    line-height: 1.5;
}

.kyc-form-group input[readonly] {
    background: #f7f9fc;
    color: #667085;
    cursor: default;
}

.kyc-form-group input:focus,
.kyc-form-group select:focus,
.kyc-form-group textarea:focus {

    border-color: #0b67c1;

    box-shadow:
        0 0 0 3px rgba(11, 103, 193, 0.10);
}


/* =========================================================
   DOCUMENT SECTION
========================================================= */

.kyc-documents-section {

    padding-top: 27px;
    margin-top: 5px;

    border-top: 1px solid #e8edf3;
}

.kyc-documents-grid {

    display: grid;

    grid-template-columns:
        repeat(3, minmax(0, 1fr));

    gap: 20px;
}

.kyc-document-card {

    display: flex;
    flex-direction: column;

    min-width: 0;

    padding: 16px;

    border: 1px solid #e1e7ee;

    border-radius: 13px;

    background: #f9fafb;

    transition:
        box-shadow 0.2s ease,
        transform 0.2s ease;
}

.kyc-document-card:hover {

    transform: translateY(-2px);

    box-shadow:
        0 6px 18px rgba(15, 23, 42, 0.07);
}

.kyc-document-card h4 {

    margin: 0 0 13px;

    color: #344054;

    font-size: 14px;

    font-weight: 700;
}

.kyc-document-preview {

    width: 100%;
    height: 190px;

    object-fit: contain;

    background: #ffffff;

    border: 1px solid #e1e7ee;

    border-radius: 8px;

    display: block;
}

.kyc-video-preview {

    width: 100%;
    height: 190px;

    background: #000000;

    border-radius: 8px;

    display: block;
}

.kyc-document-link {

    display: inline-flex;

    align-items: center;
    justify-content: center;

    margin-top: 11px;

    min-height: 38px;

    padding: 0 12px;

    border-radius: 7px;

    background: #eef6ff;

    color: #0b67c1;

    font-size: 13px;

    font-weight: 600;

    text-decoration: none;
}

.kyc-document-link:hover {

    background: #0b67c1;

    color: #ffffff;
}

.kyc-document-empty {

    display: flex;

    align-items: center;
    justify-content: center;

    height: 190px;

    padding: 15px;

    box-sizing: border-box;

    text-align: center;

    border: 1px dashed #cbd5e1;

    border-radius: 8px;

    background: #ffffff;

    color: #98a2b3;

    font-size: 13px;
}


/* =========================================================
   REVIEW SECTION
========================================================= */

.kyc-review-section {

    margin-top: 32px;

    padding-top: 28px;

    border-top: 1px solid #e8edf3;
}

.kyc-review-card {

    border: 1px solid #dce4ed;

    border-radius: 14px;

    background: #fbfcfe;

    overflow: hidden;
}


/* =========================================================
   REVIEW ITEM
========================================================= */

.review-item {

    display: flex;

    align-items: center;

    justify-content: space-between;

    gap: 20px;

    padding: 18px 20px;

    border-bottom: 1px solid #e8edf3;

    background: #ffffff;
}

.review-item:last-child {
    border-bottom: none;
}

.review-content {
    min-width: 0;
    flex: 1;
}

.review-content h4 {

    margin: 0 0 5px;

    color: #344054;

    font-size: 14px;

    font-weight: 700;
}

.review-content p {

    margin: 0 0 10px;

    color: #667085;

    font-size: 13px;

    line-height: 1.5;

    word-break: break-word;
}


/* =========================================================
   ISSUE INPUT
========================================================= */

.review-issue-input {

    width: 100%;

    box-sizing: border-box;

    padding: 11px 13px;

    border: 1px solid #d0d5dd;

    border-radius: 8px;

    background: #ffffff;

    color: #344054;

    font-size: 13px;

    outline: none;
}

.review-issue-input:focus {

    border-color: #0b67c1;

    box-shadow:
        0 0 0 3px rgba(11, 103, 193, 0.10);
}


/* =========================================================
   CHECKBOX
========================================================= */

.review-check {

    display: inline-flex;

    align-items: center;

    gap: 8px;

    flex-shrink: 0;

    padding: 8px 12px;

    border-radius: 8px;

    background: #f2f7fc;

    color: #344054;

    font-size: 13px;

    font-weight: 600;

    cursor: pointer;
}

.review-check input {

    width: 17px;
    height: 17px;

    margin: 0;

    accent-color: #0b67c1;

    cursor: pointer;
}


/* =========================================================
   REVIEW BOTTOM
========================================================= */

.review-bottom {

    padding: 20px;

    background: #ffffff;

    border-top: 1px solid #e8edf3;
}

.review-field {

    display: flex;

    flex-direction: column;

    gap: 7px;

    margin-bottom: 18px;
}

.review-field label {

    color: #344054;

    font-size: 13px;

    font-weight: 600;
}

.review-field textarea,
.review-field select {

    width: 100%;

    box-sizing: border-box;

    border: 1px solid #d9e0e8;

    border-radius: 9px;

    padding: 12px 14px;

    font-family: inherit;

    font-size: 14px;

    color: #1f2937;

    background: #ffffff;

    outline: none;
}

.review-field textarea {

    min-height: 100px;

    resize: vertical;

    line-height: 1.5;
}

.review-field select {
    height: 45px;
}


/* =========================================================
   STATUS
========================================================= */

.review-status-row {

    display: grid;

    grid-template-columns:
        minmax(0, 1fr)
        minmax(0, 1fr);

    gap: 18px;
}


/* =========================================================
   BUTTON
========================================================= */

.review-submit-area {

    display: flex;

    align-items: center;

    justify-content: flex-end;

    gap: 12px;

    margin-top: 20px;
}

.kyc-btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    min-width: 140px;

    height: 45px;

    padding: 0 20px;

    border: none;

    border-radius: 9px;

    font-family: inherit;

    font-size: 14px;

    font-weight: 600;

    cursor: pointer;
}

.kyc-btn-primary {

    background: #0b67c1;

    color: #ffffff;

    box-shadow:
        0 5px 14px rgba(11, 103, 193, 0.18);
}

.kyc-btn-primary:hover {

    background: #0959a7;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 1000px) {

    .kyc-documents-grid {

        grid-template-columns:
            repeat(2, minmax(0, 1fr));
    }
}


@media (max-width: 900px) {

    .kyc-edit-card {

        max-width: 100%;

        padding: 25px;
    }

    .kyc-information-grid {

        grid-template-columns: 1fr;
    }

    .kyc-form-group.full-width {

        grid-column: auto;
    }

    .kyc-documents-grid {

        grid-template-columns: 1fr;
    }

    .review-status-row {

        grid-template-columns: 1fr;
    }
}


@media (max-width: 600px) {

    .kyc-edit-page {

        padding: 12px 8px 30px;
    }

    .kyc-edit-card {

        padding: 18px 15px;

        border-radius: 13px;
    }

    .kyc-edit-header {

        flex-direction: column;

        align-items: flex-start;
    }

    .review-item {

        flex-direction: column;

        align-items: flex-start;
    }

    .review-check {

        width: 100%;

        box-sizing: border-box;
    }

    .review-status-row {

        grid-template-columns: 1fr;
    }

    .review-submit-area {

        flex-direction: column;
    }

    .kyc-btn {

        width: 100%;
    }
}

</style>


<div class="kyc-edit-page">

    <div class="kyc-edit-card">


        <!-- =====================================================
             ERROR MESSAGE
        ====================================================== -->

        <c:if test="${not empty errorMessage}">

            <div class="kyc-error-message">

                <span>
                    ⚠️
                </span>

                <span>
                    <c:out value="${errorMessage}" />
                </span>

            </div>

        </c:if>


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="kyc-edit-header">

            <div class="kyc-edit-header-content">

                <h2>
                    KYC Application Review
                </h2>

                <p>
                    Review customer information and verify uploaded documents.
                </p>

            </div>

            <span class="kyc-edit-badge">

                <c:out value="${kycData.kycStatus}" />

            </span>

        </div>



        <!-- =====================================================
             CUSTOMER INFORMATION
        ====================================================== -->

        <div class="kyc-information-section">

            <div class="kyc-section-title">

                <h3>
                    Customer Information
                </h3>

                <p>
                    Verify the customer's registered KYC information.
                </p>

            </div>


            <div class="kyc-information-grid">


                <!-- USER ID -->

                <div class="kyc-form-group">

                    <label>
                        User ID
                    </label>

                    <input
                        type="text"
                        value="${kycData.userId}"
                        readonly>

                </div>


                <!-- FULL NAME -->

                <div class="kyc-form-group">

                    <label>
                        Full Name
                    </label>

                    <input
                        type="text"
                        value="${kycData.fullName}"
                        readonly>

                </div>


                <!-- DOB -->

                <div class="kyc-form-group">

                    <label>
                        Date of Birth
                    </label>

                    <input
                        type="date"
                        value="${kycData.dob}"
                        readonly>

                </div>


                <!-- GENDER -->

                <div class="kyc-form-group">

                    <label>
                        Gender
                    </label>

                    <input
                        type="text"
                        value="${kycData.gender}"
                        readonly>

                </div>


                <!-- ADDRESS -->

                <div class="kyc-form-group full-width">

                    <label>
                        Address
                    </label>

                    <input
                        type="text"
                        value="${kycData.address}"
                        readonly>

                </div>


                <!-- CITY -->

                <div class="kyc-form-group">

                    <label>
                        City
                    </label>

                    <input
                        type="text"
                        value="${kycData.city}"
                        readonly>

                </div>


                <!-- STATE -->

                <div class="kyc-form-group">

                    <label>
                        State
                    </label>

                    <input
                        type="text"
                        value="${kycData.state}"
                        readonly>

                </div>


                <!-- PINCODE -->

                <div class="kyc-form-group">

                    <label>
                        Pincode
                    </label>

                    <input
                        type="text"
                        value="${kycData.pincode}"
                        readonly>

                </div>


                <!-- =================================================
                     AADHAAR NUMBER
                ================================================== -->

                <div class="kyc-form-group">

                    <label>
                        Aadhaar Number
                    </label>

                    <input
                        type="text"
                        value="${kycData.aadhaarNo}"
                        readonly>

                </div>


                <!-- PAN -->

                <div class="kyc-form-group">

                    <label>
                        PAN Number
                    </label>

                    <input
                        type="text"
                        value="${kycData.panNo}"
                        readonly>

                </div>


            </div>



            <!-- =====================================================
                 DOCUMENTS
            ====================================================== -->

            <div class="kyc-documents-section">

                <div class="kyc-section-title">

                    <h3>
                        KYC Documents
                    </h3>

                    <p>
                        Review the uploaded Aadhaar, PAN and face verification video.
                    </p>

                </div>


                <div class="kyc-documents-grid">


                    <!-- =================================================
                         AADHAAR DOCUMENT
                    ================================================== -->

                    <div class="kyc-document-card">

                        <h4>
                            Aadhaar Card
                        </h4>

                        <c:if test="${not empty kycData.aadhaarFileName}">

                            <img
                                src="${pageContext.request.contextPath}${kycData.aadhaarFileName}"
                                alt="Aadhaar Card"
                                class="kyc-document-preview">

                            <a
                                href="${pageContext.request.contextPath}${kycData.aadhaarFileName}"
                                target="_blank"
                                class="kyc-document-link">

                                View Aadhaar

                            </a>

                        </c:if>


                        <c:if test="${empty kycData.aadhaarFileName}">

                            <div class="kyc-document-empty">

                                Aadhaar document not uploaded.

                            </div>

                        </c:if>

                    </div>



                    <!-- =================================================
                         PAN DOCUMENT
                    ================================================== -->

                    <div class="kyc-document-card">

                        <h4>
                            PAN Card
                        </h4>

                        <c:if test="${not empty kycData.panFileName}">

                            <img
                                src="${pageContext.request.contextPath}${kycData.panFileName}"
                                alt="PAN Card"
                                class="kyc-document-preview">

                            <a
                                href="${pageContext.request.contextPath}${kycData.panFileName}"
                                target="_blank"
                                class="kyc-document-link">

                                View PAN

                            </a>

                        </c:if>


                        <c:if test="${empty kycData.panFileName}">

                            <div class="kyc-document-empty">

                                PAN document not uploaded.

                            </div>

                        </c:if>

                    </div>



                    <!-- =================================================
                         FACE VIDEO
                    ================================================== -->

                    <div class="kyc-document-card">

                        <h4>
                            Face Verification Video
                        </h4>

                        <c:if test="${not empty kycData.faceVideoPath}">

                            <video
                                class="kyc-video-preview"
                                controls
                                preload="metadata">

                                <source
                                    src="${pageContext.request.contextPath}${kycData.faceVideoPath}"
                                    type="video/webm">

                                Your browser does not support video playback.

                            </video>


                            <a
                                href="${pageContext.request.contextPath}${kycData.faceVideoPath}"
                                target="_blank"
                                class="kyc-document-link">

                                Open Video

                            </a>

                        </c:if>


                        <c:if test="${empty kycData.faceVideoPath}">

                            <div class="kyc-document-empty">

                                Face verification video not uploaded.

                            </div>

                        </c:if>

                    </div>


                </div>

            </div>

        </div>



        <!-- =====================================================
             ADMIN KYC REVIEW
        ====================================================== -->

        <div class="kyc-review-section">

            <div class="kyc-section-title">

                <h3>
                    Admin KYC Verification
                </h3>

                <p>
                    Verify each customer detail and uploaded document before
                    approving or requesting correction.
                </p>

            </div>


            <div class="kyc-review-card">


                <form
                    id="kycReviewForm"
                    action="${pageContext.request.contextPath}/admin/saveKycReview"
                    method="post">


                    <!-- PROFILE ID -->

                    <input
                        type="hidden"
                        name="profileId"
                        value="${kycData.profileId}">



                    <!-- =================================================
                         FULL NAME
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Full Name
                            </h4>

                            <p>
                                <c:out value="${kycData.fullName}" />
                            </p>

                            <input
                                type="text"
                                name="fullNameIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if Full Name is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="fullNameVerified"
                                value="true">

                            Verified

                        </label>

                    </div>



                    <!-- =================================================
                         DOB
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Date of Birth
                            </h4>

                            <p>
                                <c:out value="${kycData.dob}" />
                            </p>

                            <input
                                type="text"
                                name="dobIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if Date of Birth is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="dobVerified"
                                value="true">

                            Verified

                        </label>

                    </div>



                    <!-- =================================================
                         GENDER
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Gender
                            </h4>

                            <p>
                                <c:out value="${kycData.gender}" />
                            </p>

                            <input
                                type="text"
                                name="genderIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if Gender is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="genderVerified"
                                value="true">

                            Verified

                        </label>

                    </div>



                    <!-- =================================================
                         ADDRESS
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Address
                            </h4>

                            <p>
                                <c:out value="${kycData.address}" />
                            </p>

                            <input
                                type="text"
                                name="addressIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if Address is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="addressVerified"
                                value="true">

                            Verified

                        </label>

                    </div>



                    <!-- =================================================
                         CITY
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                City
                            </h4>

                            <p>
                                <c:out value="${kycData.city}" />
                            </p>

                            <input
                                type="text"
                                name="cityIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if City is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="cityVerified"
                                value="true">

                            Verified

                        </label>

                    </div>



                    <!-- =================================================
                         STATE
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                State
                            </h4>

                            <p>
                                <c:out value="${kycData.state}" />
                            </p>

                            <input
                                type="text"
                                name="stateIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if State is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="stateVerified"
                                value="true">

                            Verified

                        </label>

                    </div>



                    <!-- =================================================
                         PINCODE
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Pincode
                            </h4>

                            <p>
                                <c:out value="${kycData.pincode}" />
                            </p>

                            <input
                                type="text"
                                name="pincodeIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if Pincode is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="pincodeVerified"
                                value="true">

                            Verified

                        </label>

                    </div>



                    <!-- =================================================
                         IMPORTANT: AADHAAR NUMBER
                         
                         This field ONLY maps to:
                         aadhaar_no_issue
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Aadhaar Number
                            </h4>

                            <p>
                                <c:out value="${kycData.aadhaarNo}" />
                            </p>

                            <input
                                type="text"
                                name="aadhaarNoIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if Aadhaar NUMBER is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="aadhaarNoVerified"
                                value="true">

                            Number Verified

                        </label>

                    </div>



                    <!-- =================================================
                         PAN NUMBER
                         
                         This field ONLY maps to:
                         pan_no_issue
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                PAN Number
                            </h4>

                            <p>
                                <c:out value="${kycData.panNo}" />
                            </p>

                            <input
                                type="text"
                                name="panNoIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if PAN NUMBER is incorrect...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="panNoVerified"
                                value="true">

                            Number Verified

                        </label>

                    </div>



                    <!-- =================================================
                         IMPORTANT: AADHAAR DOCUMENT
                         
                         This field ONLY maps to:
                         aadhaar_issue
                         
                         DO NOT put Aadhaar number errors here.
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Aadhaar Document
                            </h4>

                            <p>
                                Verify the Aadhaar document displayed above.
                            </p>

                            <input
                                type="text"
                                name="aadhaarIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if Aadhaar DOCUMENT/file is invalid...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="aadhaarVerified"
                                value="true">

                            Document Verified

                        </label>

                    </div>



                    <!-- =================================================
                         PAN DOCUMENT
                         
                         This field ONLY maps to:
                         pan_issue
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                PAN Document
                            </h4>

                            <p>
                                Verify the PAN document displayed above.
                            </p>

                            <input
                                type="text"
                                name="panIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if PAN DOCUMENT/file is invalid...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="panVerified"
                                value="true">

                            Document Verified

                        </label>

                    </div>



                    <!-- =================================================
                         FACE VIDEO
                    ================================================== -->

                    <div class="review-item">

                        <div class="review-content">

                            <h4>
                                Face Verification Video
                            </h4>

                            <p>
                                Verify the customer's face verification video.
                            </p>

                            <input
                                type="text"
                                name="faceVideoIssue"
                                class="review-issue-input"
                                placeholder="Enter issue ONLY if face verification fails...">

                        </div>

                        <label class="review-check">

                            <input
                                type="checkbox"
                                name="faceVideoVerified"
                                value="true">

                            Video Verified

                        </label>

                    </div>



                    <!-- =================================================
                         REVIEW BOTTOM
                    ================================================== -->

                    <div class="review-bottom">


                        <div class="review-status-row">


                            <!-- ADMIN REMARKS -->

                            <div class="review-field">

                                <label>
                                    Admin Remarks
                                </label>

                                <textarea
                                    name="adminRemarks"
                                    placeholder="Enter overall verification remarks..."></textarea>

                            </div>


                            <!-- REVIEW STATUS -->

                            <div class="review-field">

                                <label>
                                    Review Status
                                </label>

                                <select
                                    name="reviewStatus"
                                    required>

                                    <option value="">
                                        Select Status
                                    </option>

                                    <option value="PENDING">
                                        PENDING
                                    </option>

                                    <option value="APPROVED">
                                        APPROVED
                                    </option>

                                    <option value="REJECTED">
                                        REJECTED
                                    </option>

                                    <option value="NEED_CORRECTION">
                                        NEED CORRECTION
                                    </option>

                                </select>

                            </div>

                        </div>


                        <!-- SUBMIT -->

                        <div class="review-submit-area">

                            <button
                                type="submit"
                                class="kyc-btn kyc-btn-primary">

                                Submit Review

                            </button>

                        </div>


                    </div>


                </form>

            </div>

        </div>


    </div>

</div>



<script>

/* =========================================================
   KYC REVIEW VALIDATION
========================================================= */

document
    .getElementById("kycReviewForm")
    .addEventListener("submit", function(event) {

        /*
         * Each object contains:
         *
         * issue  = issue input
         * check  = verification checkbox
         *
         * If admin enters an issue:
         * checkbox MUST NOT be checked.
         */

        const fields = [

            {
                issue: "fullNameIssue",
                check: "fullNameVerified",
                label: "Full Name"
            },

            {
                issue: "dobIssue",
                check: "dobVerified",
                label: "Date of Birth"
            },

            {
                issue: "genderIssue",
                check: "genderVerified",
                label: "Gender"
            },

            {
                issue: "addressIssue",
                check: "addressVerified",
                label: "Address"
            },

            {
                issue: "cityIssue",
                check: "cityVerified",
                label: "City"
            },

            {
                issue: "stateIssue",
                check: "stateVerified",
                label: "State"
            },

            {
                issue: "pincodeIssue",
                check: "pincodeVerified",
                label: "Pincode"
            },

            /*
             * IMPORTANT
             *
             * Aadhaar NUMBER
             *
             * aadhaarNoIssue
             *        ↓
             * aadhaar_no_issue
             */

            {
                issue: "aadhaarNoIssue",
                check: "aadhaarNoVerified",
                label: "Aadhaar Number"
            },

            /*
             * PAN NUMBER
             */

            {
                issue: "panNoIssue",
                check: "panNoVerified",
                label: "PAN Number"
            },

            /*
             * Aadhaar DOCUMENT
             *
             * aadhaarIssue
             *        ↓
             * aadhaar_issue
             */

            {
                issue: "aadhaarIssue",
                check: "aadhaarVerified",
                label: "Aadhaar Document"
            },

            /*
             * PAN DOCUMENT
             */

            {
                issue: "panIssue",
                check: "panVerified",
                label: "PAN Document"
            },

            /*
             * FACE VIDEO
             */

            {
                issue: "faceVideoIssue",
                check: "faceVideoVerified",
                label: "Face Verification Video"
            }

        ];


        for (let i = 0; i < fields.length; i++) {

            const issueInput =
                document.querySelector(
                    '[name="' + fields[i].issue + '"]'
                );

            const checkbox =
                document.querySelector(
                    '[name="' + fields[i].check + '"]'
                );


            if (!issueInput || !checkbox) {
                continue;
            }


            const issue =
                issueInput.value.trim();


            /*
             * Issue entered + Verified checked
             * = invalid combination
             */

            if (issue !== "" && checkbox.checked) {

                alert(
                    fields[i].label
                    + " has an issue entered. "
                    + "Please either remove the issue or uncheck Verified."
                );

                issueInput.focus();

                event.preventDefault();

                return;
            }

        }


        /*
         * NEED_CORRECTION validation
         *
         * At least one issue should exist.
         */

        const status =
            document.querySelector(
                '[name="reviewStatus"]'
            ).value;


        if (status === "NEED_CORRECTION") {

            let hasIssue = false;


            for (let i = 0; i < fields.length; i++) {

                const input =
                    document.querySelector(
                        '[name="' + fields[i].issue + '"]'
                    );


                if (
                    input &&
                    input.value.trim() !== ""
                ) {

                    hasIssue = true;

                    break;
                }

            }


            if (!hasIssue) {

                alert(
                    "You selected NEED CORRECTION, "
                    + "but no correction issue has been entered."
                );

                event.preventDefault();

                return;
            }

        }


        /*
         * APPROVED validation
         *
         * There should not be any correction issue.
         */

        if (status === "APPROVED") {

            let hasIssue = false;

            for (let i = 0; i < fields.length; i++) {

                const input =
                    document.querySelector(
                        '[name="' + fields[i].issue + '"]'
                    );


                if (
                    input &&
                    input.value.trim() !== ""
                ) {

                    hasIssue = true;

                    break;
                }

            }


            if (hasIssue) {

                alert(
                    "You selected APPROVED, "
                    + "but one or more correction issues are entered."
                );

                event.preventDefault();

                return;
            }

        }


        /*
         * Final confirmation
         */

        const confirmed =
            confirm(
                "Are you sure you want to submit this KYC review?"
            );


        if (!confirmed) {

            event.preventDefault();

        }

    });

</script>


<%@ include file="../admin/admin_Footer.jsp" %>