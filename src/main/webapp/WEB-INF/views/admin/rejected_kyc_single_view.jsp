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

.error-icon {
    font-size: 17px;
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

    transition:
        background 0.2s ease,
        color 0.2s ease;
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
   REVIEW FORM
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
   REVIEW ITEMS
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
}

.review-content h4 {

    margin: 0 0 5px;

    color: #344054;

    font-size: 14px;

    font-weight: 700;
}

.review-content p {

    margin: 0;

    color: #667085;

    font-size: 13px;

    line-height: 1.5;

    word-break: break-word;
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
   REVIEW REMARKS
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

.review-field textarea:focus,
.review-field select:focus {

    border-color: #0b67c1;

    box-shadow:
        0 0 0 3px rgba(11, 103, 193, 0.10);
}


/* =========================================================
   REVIEW STATUS
========================================================= */

.review-status-row {

    display: grid;

    grid-template-columns:
        minmax(0, 1fr)
        minmax(0, 1fr);

    gap: 18px;
}


/* =========================================================
   BUTTONS
========================================================= */

.kyc-form-buttons {

    display: flex;

    align-items: center;

    justify-content: flex-end;

    gap: 12px;

    margin-top: 22px;

    padding-top: 22px;

    border-top: 1px solid #e8edf3;
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

    text-decoration: none;

    cursor: pointer;

    box-sizing: border-box;

    transition:
        transform 0.15s ease,
        background 0.2s ease,
        box-shadow 0.2s ease;
}

.kyc-btn:hover {

    transform: translateY(-1px);
}

.kyc-btn-primary {

    background: #0b67c1;

    color: #ffffff;

    box-shadow:
        0 5px 14px rgba(11, 103, 193, 0.18);
}

.kyc-btn-primary:hover {

    background: #0959a7;

    box-shadow:
        0 7px 18px rgba(11, 103, 193, 0.24);
}

.kyc-btn-secondary {

    background: #eef2f6;

    color: #344054;
}

.kyc-btn-secondary:hover {

    background: #e1e7ee;
}


/* =========================================================
   REVIEW SUBMIT AREA
========================================================= */

.review-submit-area {

    display: flex;

    align-items: center;

    justify-content: flex-end;

    gap: 12px;

    margin-top: 20px;
}


/* =========================================================
   RESPONSIVE - 1000px
========================================================= */

@media (max-width: 1000px) {

    .kyc-documents-grid {

        grid-template-columns:
            repeat(2, minmax(0, 1fr));
    }
}


/* =========================================================
   RESPONSIVE - 900px
========================================================= */

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


/* =========================================================
   RESPONSIVE - 600px
========================================================= */

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

        gap: 13px;
    }

    .kyc-edit-header-content h2 {

        font-size: 22px;
    }

    .kyc-edit-header-content p {

        font-size: 13px;
    }

    .kyc-edit-badge {

        align-self: flex-start;
    }

    .kyc-information-grid {

        gap: 15px;
    }

    .kyc-document-card {

        padding: 13px;
    }

    .kyc-document-preview,
    .kyc-video-preview,
    .kyc-document-empty {

        height: 180px;
    }

    .review-item {

        flex-direction: column;

        align-items: flex-start;

        gap: 13px;

        padding: 16px;
    }

    .review-check {

        width: 100%;

        box-sizing: border-box;

        justify-content: flex-start;
    }

    .review-bottom {

        padding: 16px;
    }

    .kyc-form-buttons,
    .review-submit-area {

        flex-direction: column;

        align-items: stretch;
    }

    .kyc-btn {

        width: 100%;
    }
}


/* =========================================================
   RESPONSIVE - 400px
========================================================= */

@media (max-width: 400px) {

    .kyc-edit-card {

        padding: 15px 12px;
    }

    .kyc-edit-header-content h2 {

        font-size: 20px;
    }

    .kyc-form-group input,
    .kyc-form-group select,
    .kyc-form-group textarea,
    .review-field textarea,
    .review-field select {

        font-size: 13px;
    }

    .kyc-document-preview,
    .kyc-video-preview,
    .kyc-document-empty {

        height: 160px;
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

                <span class="error-icon">
                    ⚠️
                </span>

                <span>
                    ${errorMessage}
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

            <span class="active-badge blocked-icon">
                ${kycData.kycStatus}
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


           
                <input
                    type="hidden"
                    name="profileId"
                    value="${kycData.profileId}">


                <div class="kyc-information-grid">


                    <!-- USER ID -->

                    <div class="kyc-form-group">

                        <label>
                            User ID
                        </label>

                        <input
                            type="text"
                            name="userId"
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
                            name="fullName"
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
                            name="dob"
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
                            name="gender"
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
                            name="address"
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
                            name="city"
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
                            name="state"
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
                            name="pincode"
                            value="${kycData.pincode}"
                            readonly>

                    </div>


                    <!-- AADHAAR -->

                    <div class="kyc-form-group">

                        <label>
                            Aadhaar Number
                        </label>

                        <input
                            type="text"
                            name="aadhaarNo"
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
                            name="panNo"
                            value="${kycData.panNo}"
                            readonly>

                    </div>


                </div>


                <!-- =================================================
                     DOCUMENTS
                ================================================== -->

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
                             AADHAAR
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
                             PAN
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

	
		
		


    </div>

</div>


<%@ include file="../admin/admin_Footer.jsp" %>