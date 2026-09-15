<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<%@ include file="../commonUser/header.jsp" %>


<style>

/* =========================================
   MAIN PAGE
========================================= */

.correction-page {
    background: #f5f7fb;
    min-height: 100vh;
    padding: 30px 15px;
}


/* =========================================
   CARD
========================================= */

.correction-card {
    max-width: 900px;
    margin: auto;
    background: #ffffff;
    border-radius: 18px;
    padding: 30px;

    box-shadow:
        0 10px 30px rgba(0,0,0,.08);
}


/* =========================================
   HEADER
========================================= */

.correction-header {
    background: #fff7ed;
    border: 1px solid #fed7aa;
    border-radius: 12px;

    padding: 20px;
    margin-bottom: 25px;
}

.correction-header h2 {
    color: #9a3412;
    margin: 0 0 8px;
}

.correction-header p {
    color: #7c2d12;
    margin: 0;
}


/* =========================================
   ISSUE SECTION
========================================= */

.issue-section {
    margin-bottom: 25px;

    border: 1px solid #e5e7eb;
    border-radius: 12px;

    padding: 20px;

    background: #ffffff;
}

.issue-section h4 {
    color: #073b6f;
    margin: 0 0 12px;
}


/* =========================================
   ISSUE MESSAGE
========================================= */

.issue-message {
    background: #fff1f1;

    color: #b42318;

    border: 1px solid #f3c2c2;

    border-radius: 8px;

    padding: 12px;

    margin-bottom: 15px;

    font-size: 13px;

    line-height: 1.5;
}


/* =========================================
   FORM GROUP
========================================= */

.form-group {
    margin-bottom: 18px;
}

.form-group:last-child {
    margin-bottom: 0;
}


/* =========================================
   LABEL
========================================= */

.form-group label {
    display: block;

    margin-bottom: 7px;

    font-weight: 600;

    color: #344054;
}


/* =========================================
   INPUT
========================================= */

.form-control {
    width: 100%;

    box-sizing: border-box;

    padding: 11px 13px;

    border: 1px solid #d0d5dd;

    border-radius: 8px;

    font-size: 14px;

    background: #ffffff;
}

.form-control:focus {
    outline: none;

    border-color: #0d6efd;

    box-shadow:
        0 0 0 3px rgba(13,110,253,.1);
}


/* =========================================
   TEXTAREA
========================================= */

textarea.form-control {
    min-height: 100px;
    resize: vertical;
}


/* =========================================
   FILE INPUT
========================================= */

input[type="file"].form-control {
    padding: 9px;
    cursor: pointer;
}


/* =========================================
   ACTION AREA
========================================= */

.action-area {
    display: flex;

    justify-content: flex-end;

    gap: 12px;

    padding-top: 20px;

    border-top: 1px solid #e5e7eb;
}


/* =========================================
   BUTTON
========================================= */

.btn {
    padding: 12px 25px;

    border-radius: 8px;

    border: none;

    cursor: pointer;

    text-decoration: none;

    font-weight: 600;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 7px;
}


/* =========================================
   PRIMARY BUTTON
========================================= */

.btn-primary {
    background: #0d6efd;
    color: #ffffff;
}

.btn-primary:hover {
    background: #0b5ed7;
}


/* =========================================
   SECONDARY BUTTON
========================================= */

.btn-secondary {
    background: #e9ecef;
    color: #344054;
}

.btn-secondary:hover {
    background: #dfe2e6;
}


/* =========================================
   MOBILE
========================================= */

@media(max-width:600px) {

    .correction-page {
        padding: 20px 10px;
    }

    .correction-card {
        padding: 20px;
        border-radius: 12px;
    }

    .action-area {
        flex-direction: column;
    }

    .btn {
        width: 100%;
        box-sizing: border-box;
    }
}

</style>



<div class="correction-page">

    <div class="correction-card">


        <!-- =========================================
             HEADER
        ========================================== -->

        <div class="correction-header">

            <h2>

                <i class="fas fa-edit"></i>

                Correct Your KYC

            </h2>

            <p>

                Please correct the information mentioned
                by our verification team and resubmit your KYC.

            </p>

        </div>



        <!-- =========================================
             CORRECTION FORM
        ========================================== -->

        <form
            method="post"
            enctype="multipart/form-data"
            action="${baseUrl}/user/update-correction"
            id="correctionForm">


            <!-- =========================================
                 USER ID
            ========================================== -->

            <input
                type="hidden"
                name="userId"
                value="${kycData.userId}">


            <!-- =========================================
                 PROFILE ID
            ========================================== -->

            <input
                type="hidden"
                name="profileId"
                value="${kycData.profileId}">



            <!-- =========================================
                 FULL NAME
                 
                 SHOW ONLY IF:
                 kycReview.fullNameIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.fullNameIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-user"></i>

                        Full Name

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.fullNameIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="fullName">

                            Correct Full Name

                        </label>


                        <input
                            type="text"
                            id="fullName"
                            name="fullName"
                            class="form-control"
                            value="${kycData.fullName}"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 DATE OF BIRTH
                 
                 SHOW ONLY IF:
                 kycReview.dobIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.dobIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-calendar"></i>

                        Date of Birth

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.dobIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="dob">

                            Correct Date of Birth

                        </label>


                        <input
                            type="date"
                            id="dob"
                            name="dob"
                            class="form-control"
                            value="${kycData.dob}"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 ADDRESS
                 
                 SHOW ONLY IF:
                 kycReview.addressIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.addressIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-map-marker-alt"></i>

                        Address

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.addressIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="address">

                            Correct Address

                        </label>


                        <textarea
                            id="address"
                            name="address"
                            class="form-control"
                            rows="4"
                            required>${kycData.address}</textarea>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 CITY
                 
                 SHOW ONLY IF:
                 kycReview.cityIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.cityIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-city"></i>

                        City

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.cityIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="city">

                            Correct City

                        </label>


                        <input
                            type="text"
                            id="city"
                            name="city"
                            class="form-control"
                            value="${kycData.city}"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 STATE
                 
                 SHOW ONLY IF:
                 kycReview.stateIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.stateIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-map"></i>

                        State

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.stateIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="state">

                            Correct State

                        </label>


                        <input
                            type="text"
                            id="state"
                            name="state"
                            class="form-control"
                            value="${kycData.state}"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 PINCODE
                 
                 SHOW ONLY IF:
                 kycReview.pincodeIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.pincodeIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-map-pin"></i>

                        Pincode

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.pincodeIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="pincode">

                            Correct Pincode

                        </label>


                        <input
                            type="text"
                            id="pincode"
                            name="pincode"
                            class="form-control"
                            value="${kycData.pincode}"
                            maxlength="6"
                            minlength="6"
                            inputmode="numeric"
                            pattern="[0-9]{6}"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 GENDER
                 
                 SHOW ONLY IF:
                 kycReview.genderIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.genderIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-venus-mars"></i>

                        Gender

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.genderIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="gender">

                            Correct Gender

                        </label>


                        <select
                            id="gender"
                            name="gender"
                            class="form-control"
                            required>


                            <option value="">

                                Select Gender

                            </option>


                            <option
                                value="MALE"
                                <c:if test="${kycData.gender == 'MALE'}">
                                    selected
                                </c:if>>

                                Male

                            </option>


                            <option
                                value="FEMALE"
                                <c:if test="${kycData.gender == 'FEMALE'}">
                                    selected
                                </c:if>>

                                Female

                            </option>


                            <option
                                value="OTHER"
                                <c:if test="${kycData.gender == 'OTHER'}">
                                    selected
                                </c:if>>

                                Other

                            </option>


                        </select>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 AADHAAR NUMBER
                 
                 IMPORTANT:
                 
                 This section ONLY depends on:
                 
                 kycReview.aadhaarNoIssue
                 
                 It does NOT depend on:
                 
                 kycReview.aadhaarIssue
            ========================================== -->

            <c:if test="${not empty kycReview.aadhaarNoIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-id-card"></i>

                        Aadhaar Number

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.aadhaarNoIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="aadhaarNo">

                            Correct Aadhaar Number

                        </label>


                        <input
                            type="text"
                            id="aadhaarNo"
                            name="aadhaarNo"
                            class="form-control"
                            value="${kycData.aadhaarNo}"
                            maxlength="12"
                            minlength="12"
                            inputmode="numeric"
                            pattern="[0-9]{12}"
                            placeholder="Enter 12 digit Aadhaar number"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 AADHAAR DOCUMENT
                 
                 IMPORTANT:
                 
                 This section ONLY depends on:
                 
                 kycReview.aadhaarIssue
                 
                 If aadhaarIssue is NULL or EMPTY,
                 this section WILL NOT SHOW.
            ========================================== -->

            <c:if test="${not empty kycReview.aadhaarIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-file-upload"></i>

                        Aadhaar Document

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.aadhaarIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="aadhaarFile">

                            Upload New Aadhaar Document

                        </label>


                        <input
                            type="file"
                            id="aadhaarFile"
                            name="aadhaarFile"
                            class="form-control"
                            accept=".jpg,.jpeg,.png,.pdf"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 PAN NUMBER
                 
                 SHOW ONLY IF:
                 kycReview.panNoIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.panNoIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-credit-card"></i>

                        PAN Number

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.panNoIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="panNo">

                            Correct PAN Number

                        </label>


                        <input
                            type="text"
                            id="panNo"
                            name="panNo"
                            class="form-control"
                            value="${kycData.panNo}"
                            maxlength="10"
                            minlength="10"
                            pattern="[A-Za-z]{5}[0-9]{4}[A-Za-z]"
                            placeholder="ABCDE1234F"
                            style="text-transform: uppercase;"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 PAN DOCUMENT
                 
                 SHOW ONLY IF:
                 kycReview.panIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.panIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-file-upload"></i>

                        PAN Document

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.panIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="panFile">

                            Upload New PAN Document

                        </label>


                        <input
                            type="file"
                            id="panFile"
                            name="panFile"
                            class="form-control"
                            accept=".jpg,.jpeg,.png,.pdf"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 FACE VIDEO
                 
                 SHOW ONLY IF:
                 kycReview.faceVideoIssue EXISTS
            ========================================== -->

            <c:if test="${not empty kycReview.faceVideoIssue}">

                <div class="issue-section">

                    <h4>

                        <i class="fas fa-video"></i>

                        Face Verification

                    </h4>


                    <div class="issue-message">

                        <strong>
                            Correction required:
                        </strong>

                        <c:out
                            value="${kycReview.faceVideoIssue}" />

                    </div>


                    <div class="form-group">

                        <label for="faceVideo">

                            Upload New Face Verification Video

                        </label>


                        <input
                            type="file"
                            id="faceVideo"
                            name="faceVideo"
                            class="form-control"
                            accept="video/*"
                            required>

                    </div>

                </div>

            </c:if>



            <!-- =========================================
                 VERIFICATION INSTRUCTIONS
            ========================================== -->

            <div class="issue-section">

                <h4>

                    <i class="fas fa-info-circle"></i>

                    Verification Instructions

                </h4>


                <div class="issue-message">

                    Please make sure all requested corrections
                    are completed before submitting your KYC again.

                </div>

            </div>



            <!-- =========================================
                 ACTION BUTTONS
            ========================================== -->

            <div class="action-area">


                <a
                    href="${baseUrl}/user/applicationStatus"
                    class="btn btn-secondary">

                    <i class="fas fa-times"></i>

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn btn-primary">

                    <i class="fas fa-paper-plane"></i>

                    Submit Corrections

                </button>


            </div>


        </form>

    </div>

</div>



<script>


/* =========================================
   FORM SUBMIT CONFIRMATION
========================================= */

document
    .getElementById("correctionForm")
    .addEventListener("submit", function(event) {

        const confirmed = confirm(
            "Are you sure you want to submit your corrected KYC?"
        );

        if (!confirmed) {

            event.preventDefault();

        }

    });



/* =========================================
   AADHAAR NUMBER
   ONLY NUMBERS
========================================= */

const aadhaarInput =
    document.getElementById("aadhaarNo");


if (aadhaarInput) {

    aadhaarInput.addEventListener(
        "input",
        function() {

            this.value =
                this.value
                    .replace(/[^0-9]/g, "")
                    .substring(0, 12);

        }
    );

}



/* =========================================
   PAN NUMBER
   UPPERCASE
========================================= */

const panInput =
    document.getElementById("panNo");


if (panInput) {

    panInput.addEventListener(
        "input",
        function() {

            this.value =
                this.value
                    .replace(/[^a-zA-Z0-9]/g, "")
                    .toUpperCase()
                    .substring(0, 10);

        }
    );

}



/* =========================================
   PINCODE
   ONLY NUMBERS
========================================= */

const pincodeInput =
    document.getElementById("pincode");


if (pincodeInput) {

    pincodeInput.addEventListener(
        "input",
        function() {

            this.value =
                this.value
                    .replace(/[^0-9]/g, "")
                    .substring(0, 6);

        }
    );

}


</script>



<%@ include file="../commonUser/footer.jsp" %>
