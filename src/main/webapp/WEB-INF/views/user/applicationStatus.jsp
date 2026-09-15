
<%@ include file="../commonUser/header.jsp" %>

<style>

    /* =====================================================
       SmartBank - Application Status
       ===================================================== */

    body{
        background:#f4f7fc;
        font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
    }

    /* =========================================
       Header
    ========================================= */

    .status-header{
        background:linear-gradient(135deg,#0d6efd,#0047b3);
        color:#fff;
        border-radius:20px;
        padding:35px;
        text-align:center;
        margin-bottom:30px;
        box-shadow:0 10px 30px rgba(0,0,0,.15);
    }

    .status-header h2{
        font-size:32px;
        font-weight:700;
        margin-bottom:10px;
    }

    .status-header p{
        font-size:16px;
        opacity:.9;
        margin:0;
    }

    /* =========================================
       Card
    ========================================= */

    .app-card{
        border:none;
        border-radius:18px;
        overflow:hidden;
        margin-bottom:35px;
        box-shadow:0 12px 25px rgba(0,0,0,.08);
    }

    .app-card .card-header{
        background:#0d6efd;
        color:#fff;
        padding:18px 25px;
        border:none;
    }

    .app-card .card-header h4{
        margin:0;
        font-size:22px;
        font-weight:600;
    }

    .app-card .card-body{
        padding:30px;
    }

    /* =========================================
       Information Boxes
    ========================================= */

    .info-box{
        background:#fff;
        border-radius:15px;
        padding:18px;
        border-left:5px solid #0d6efd;
        box-shadow:0 6px 15px rgba(0,0,0,.05);
        transition:.3s;
        height:100%;
    }

    .info-box:hover{
        transform:translateY(-4px);
        box-shadow:0 15px 30px rgba(0,0,0,.10);
    }

    .info-box small{
        display:block;
        color:#6c757d;
        font-size:14px;
        margin-bottom:6px;
    }

    .info-box h5{
        margin:0;
        font-size:18px;
        font-weight:600;
        color:#222;
        word-break:break-word;
    }

    /* =========================================
       Badges
    ========================================= */

    .badge{
        padding:10px 22px;
        border-radius:30px;
        font-size:15px;
        font-weight:600;
        color:#fff;
    }

    .pending{
        background:#ffc107;
        color:#222;
    }

    .approved{
        background:#198754;
    }

    .rejected{
        background:#dc3545;
    }

    .correction{
        background:#f79009;
        color:#fff;
    }

    /* =========================================
       Status Card
    ========================================= */

    .status-card{
        background:#fff;
        border-radius:20px;
        padding:45px;
        text-align:center;
        box-shadow:0 12px 30px rgba(0,0,0,.08);
        animation:fadeIn .5s ease;
    }

    .status-card h3{
        margin-top:20px;
        font-weight:700;
        color:#1b1b1b;
    }

    .status-card p{
        color:#666;
        margin-top:12px;
        font-size:16px;
        line-height:1.8;
    }

    /* =========================================
       Circle Icon
    ========================================= */

    .status-circle{
        width:110px;
        height:110px;
        border-radius:50%;
        display:flex;
        justify-content:center;
        align-items:center;
        margin:auto;
        font-size:42px;
        color:#fff;
    }

    .pending-bg{
        background:#ffc107;
    }

    .success-bg{
        background:#198754;
    }

    .danger-bg{
        background:#dc3545;
    }

    .correction-bg{
        background:#f79009;
    }

    /* =========================================
       Timeline
    ========================================= */

    .timeline{
        margin-top:35px;
        text-align:left;
        max-width:500px;
        margin-left:auto;
        margin-right:auto;
    }

    .timeline .step{
        background:#f8f9fa;
        padding:14px 20px;
        margin-bottom:15px;
        border-radius:12px;
        border-left:5px solid #dee2e6;
        font-weight:500;
    }

    .timeline .complete{
        background:#d1e7dd;
        border-left:5px solid #198754;
        color:#155724;
    }

    .timeline .active{
        background:#fff3cd;
        border-left:5px solid #ffc107;
        color:#856404;
    }

    /* =========================================
       Success Grid
    ========================================= */

    .success-grid{
        margin-top:30px;
        display:grid;
        grid-template-columns:repeat(2,1fr);
        gap:18px;
    }

    .success-grid div{
        background:#d1e7dd;
        color:#155724;
        padding:18px;
        border-radius:12px;
        font-weight:600;
        box-shadow:0 4px 10px rgba(0,0,0,.05);
    }

    /* =========================================
       Alerts
    ========================================= */

    .alert{
        border:none;
        border-radius:15px;
        padding:18px;
    }

    /* =========================================
       Buttons
    ========================================= */

    .btn{
        padding:12px 30px;
        border-radius:30px;
        font-weight:600;
        margin:8px;
        transition:.3s;
    }

    .btn:hover{
        transform:translateY(-3px);
        box-shadow:0 10px 18px rgba(0,0,0,.20);
    }

    .btn-primary{
        background:#0d6efd;
        border:none;
        color:#fff;
    }

    .btn-success{
        background:#198754;
        border:none;
    }

    .btn-warning{
        border:none;
    }

    /* =========================================
       Correction Section
    ========================================= */

    .correction-user-list{
        margin-top:25px;
        text-align:left;
        background:#fffaf0;
        border:1px solid #f8d58b;
        border-radius:15px;
        padding:20px;
    }

    .correction-user-list h4{
        margin-bottom:15px;
        color:#8a5a00;
        font-size:18px;
    }

    .user-issue{
        background:#ffffff;
        border-left:4px solid #f79009;
        border-radius:9px;
        padding:14px 16px;
        margin-bottom:10px;
    }

    .user-issue strong{
        display:block;
        color:#344054;
        font-size:14px;
    }

    .user-issue p{
        margin:5px 0 0;
        color:#667085;
        font-size:13px;
        line-height:1.5;
    }

    .correction-card{
        animation:fadeIn .5s ease;
    }

    /* =========================================
       Animation
    ========================================= */

    @keyframes fadeIn{

        from{
            opacity:0;
            transform:translateY(20px);
        }

        to{
            opacity:1;
            transform:translateY(0);
        }

    }

    /* =========================================
       Responsive
    ========================================= */

    @media(max-width:992px){

        .success-grid{
            grid-template-columns:1fr;
        }

    }

    @media(max-width:768px){

        .status-header{
            padding:25px;
        }

        .status-header h2{
            font-size:25px;
        }

        .app-card .card-body{
            padding:20px;
        }

        .status-card{
            padding:25px;
        }

        .status-circle{
            width:85px;
            height:85px;
            font-size:32px;
        }

        .btn{
            width:100%;
            margin-bottom:12px;
        }

    }

    @media(max-width:576px){

        .info-box{
            margin-bottom:15px;
        }

        .status-header h2{
            font-size:22px;
        }

        .status-header p{
            font-size:14px;
        }

        .timeline .step{
            font-size:14px;
        }

    }

    /* =========================================
       Mobile 320px - 480px
    ========================================= */

    @media screen and (min-width:320px) and (max-width:480px){

        html,
        body{
            width:100%;
            max-width:100%;
            overflow-x:hidden;
        }

        .status-header{
            width:100%;
            box-sizing:border-box;
            padding:25px 15px;
            margin-bottom:20px;
            border-radius:14px;
        }

        .status-header h2{
            font-size:23px;
            line-height:1.3;
            margin-bottom:8px;
        }

        .status-header p{
            font-size:13px;
            line-height:21px;
        }

        .app-card{
            width:100%;
            box-sizing:border-box;
            margin-bottom:22px;
            border-radius:14px;
        }

        .app-card .card-header{
            padding:14px 15px;
        }

        .app-card .card-header h4{
            font-size:18px;
            line-height:1.4;
        }

        .app-card .card-body{
            padding:15px;
        }

        .info-box{
            width:100%;
            box-sizing:border-box;
            padding:15px;
            margin-bottom:12px;
            border-radius:11px;
        }

        .info-box:hover{
            transform:none;
            box-shadow:0 6px 15px rgba(0,0,0,.05);
        }

        .info-box small{
            font-size:12px;
            margin-bottom:5px;
        }

        .info-box h5{
            font-size:15px;
            line-height:21px;
            word-break:break-word;
        }

        .badge{
            display:inline-block;
            padding:7px 15px;
            font-size:12px;
            border-radius:20px;
        }

        .status-card{
            width:100%;
            box-sizing:border-box;
            padding:25px 15px;
            border-radius:15px;
        }

        .status-card h3{
            margin-top:15px;
            font-size:21px;
            line-height:1.3;
        }

        .status-card p{
            margin-top:10px;
            font-size:13px;
            line-height:24px;
        }

        .status-circle{
            width:80px;
            height:80px;
            font-size:30px;
        }

        .timeline{
            width:100%;
            max-width:none;
            margin-top:25px;
            box-sizing:border-box;
        }

        .timeline .step{
            padding:12px 13px;
            margin-bottom:10px;
            border-left-width:4px;
            border-radius:9px;
            font-size:12px;
            line-height:20px;
        }

        .success-grid{
            width:100%;
            display:grid;
            grid-template-columns:1fr;
            gap:10px;
            margin-top:22px;
        }

        .success-grid div{
            padding:14px;
            border-radius:10px;
            font-size:13px;
            line-height:20px;
        }

        .alert{
            width:100%;
            box-sizing:border-box;
            padding:14px;
            border-radius:11px;
            font-size:13px;
            line-height:21px;
        }

        .btn{
            display:block;
            width:100%;
            box-sizing:border-box;
            padding:11px 15px;
            margin:8px 0;
            font-size:13px;
            text-align:center;
            border-radius:25px;
        }

        .btn:hover{
            transform:none;
            box-shadow:none;
        }

        .btn-primary,
        .btn-success,
        .btn-warning{
            width:100%;
        }

    }

</style>


<div class="container py-5">

    <div class="status-header">

        <h2>
            <i class="fas fa-id-card"></i>
            KYC Application Status
        </h2>

        <p>
            Track your SmartBank KYC verification progress
        </p>

    </div>


    <div class="card app-card shadow">

        <div class="card-header">

            <h4>
                Application Details
            </h4>

        </div>


        <div class="card-body">

            <div class="row">

                <div class="col-md-6">

                    <div class="info-box">

                        <small>Application ID</small>

                        <h5>
                            KYC${kycData.createdDate.year}${kycData.profileId}
                        </h5>

                    </div>

                </div>


                <div class="col-md-6">

                    <div class="info-box">

                        <small>Applicant Name</small>

                        <h5>
                            ${kycData.fullName}
                        </h5>

                    </div>

                </div>


                <div class="col-md-6 mt-3">

                    <div class="info-box">

                        <small>Submitted Date</small>

                        <h5>
                            ${kycData.createdDate.toLocalDate()}
                        </h5>

                    </div>

                </div>


                <div class="col-md-6 mt-3">

                    <div class="info-box">

                        <small>Status</small>

                        <c:choose>

                            <c:when test="${kycData.kycStatus == 'PENDING'}">

                                <span class="badge pending">
                                    Pending
                                </span>

                            </c:when>


                            <c:when test="${kycData.kycStatus == 'NEED_CORRECTION'}">

                                <span class="badge correction">
                                    Correction Required
                                </span>

                            </c:when>


                            <c:when test="${kycData.kycStatus == 'APPROVED'}">

                                <span class="badge approved">
                                    Approved
                                </span>

                            </c:when>


                            <c:when test="${kycData.kycStatus == 'REJECTED'}">

                                <span class="badge rejected">
                                    Rejected
                                </span>

                            </c:when>


                            <c:otherwise>

                                <span class="badge rejected">
                                    Unknown
                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <c:choose>


        <c:when test="${kycData.kycStatus == 'PENDING'}">

            <div class="status-card pending-card">

                <div class="status-circle pending-bg">

                    <i class="fas fa-hourglass-half"></i>

                </div>


                <h3>
                    Verification In Progress
                </h3>


                <p>
                    Thank you for submitting your KYC.
                    Our verification team is reviewing your documents.
                </p>


                <div class="timeline">

                    <div class="step complete">

                        <i class="fas fa-check-circle step-icon"></i>

                        <span>
                            Documents Uploaded
                        </span>

                    </div>


                    <div class="step complete">

                        <i class="fas fa-check-circle step-icon"></i>

                        <span>
                            Application Submitted
                        </span>

                    </div>


                    <div class="step active">

                        <i class="fas fa-spinner fa-spin step-icon"></i>

                        <span>
                            Verification
                        </span>

                    </div>


                    <div class="step">

                        <i class="fas fa-lock step-icon"></i>

                        <span>
                            Final Approval
                        </span>

                    </div>

                </div>


                <div class="alert alert-warning mt-4">

                    Estimated verification time

                    <strong>
                        24-48 Hours
                    </strong>

                </div>


                <div class="text-center mt-4">

                    <a href="${baseUrl}/user/applicationStatus"
                       class="btn btn-warning">

                        Refresh Status

                    </a>


                    <a href="${baseUrl}/user/dashboard"
                       class="btn btn-primary text-white">

                        Dashboard

                    </a>

                </div>

            </div>

        </c:when>


        <c:when test="${kycData.kycStatus == 'NEED_CORRECTION'}">

            <div class="status-card correction-card">

                <div class="status-circle correction-bg">

                    <i class="fas fa-edit"></i>

                </div>


                <h3>
                    Correction Required
                </h3>


                <p>

                    Our verification team has reviewed your KYC
                    application and found some information or
                    documents that need correction.

                </p>


                <c:if test="${not empty kycReview.adminRemarks}">

                    <div class="alert alert-warning mt-4">

                        <strong>
                            Admin Feedback
                        </strong>

                        <br><br>

                        <c:out value="${kycReview.adminRemarks}" />

                    </div>

                </c:if>


                <div class="correction-user-list">

                    <h4>

                        <i class="fas fa-exclamation-circle"></i>

                        Information Requiring Correction

                    </h4>


                    <c:if test="${not empty kycReview.fullNameIssue}">

                        <div class="user-issue">

                            <strong>
                                Full Name
                            </strong>

                            <p>
                                <c:out value="${kycReview.fullNameIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.dobIssue}">

                        <div class="user-issue">

                            <strong>
                                Date of Birth
                            </strong>

                            <p>
                                <c:out value="${kycReview.dobIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.addressIssue}">

                        <div class="user-issue">

                            <strong>
                                Address
                            </strong>

                            <p>
                                <c:out value="${kycReview.addressIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.cityIssue}">

                        <div class="user-issue">

                            <strong>
                                City
                            </strong>

                            <p>
                                <c:out value="${kycReview.cityIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.stateIssue}">

                        <div class="user-issue">

                            <strong>
                                State
                            </strong>

                            <p>
                                <c:out value="${kycReview.stateIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.pincodeIssue}">

                        <div class="user-issue">

                            <strong>
                                Pincode
                            </strong>

                            <p>
                                <c:out value="${kycReview.pincodeIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.genderIssue}">

                        <div class="user-issue">

                            <strong>
                                Gender
                            </strong>

                            <p>
                                <c:out value="${kycReview.genderIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.aadhaarNoIssue}">

                        <div class="user-issue">

                            <strong>
                                Aadhaar Number
                            </strong>

                            <p>
                                <c:out value="${kycReview.aadhaarNoIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.aadhaarIssue}">

                        <div class="user-issue">

                            <strong>
                                Aadhaar Document
                            </strong>

                            <p>
                                <c:out value="${kycReview.aadhaarIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.panNoIssue}">

                        <div class="user-issue">

                            <strong>
                                PAN Number
                            </strong>

                            <p>
                                <c:out value="${kycReview.panNoIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.panIssue}">

                        <div class="user-issue">

                            <strong>
                                PAN Document
                            </strong>

                            <p>
                                <c:out value="${kycReview.panIssue}" />
                            </p>

                        </div>

                    </c:if>


                    <c:if test="${not empty kycReview.faceVideoIssue}">

                        <div class="user-issue">

                            <strong>
                                Face Verification
                            </strong>

                            <p>
                                <c:out value="${kycReview.faceVideoIssue}" />
                            </p>

                        </div>

                    </c:if>


                </div>


                <div class="text-center mt-4">

                    <a href="${baseUrl}/user/correction"
                       class="btn btn-warning">

                        <i class="fas fa-edit"></i>

                        Fix Correction Issues

                    </a>


                    <a href="${baseUrl}/user/dashboard"
                       class="btn btn-primary">

                        Dashboard

                    </a>

                </div>

            </div>

        </c:when>


        <c:when test="${kycData.kycStatus == 'APPROVED'}">

            <div class="status-card approved-card">

                <div class="status-circle success-bg">

                    <i class="fas fa-check"></i>

                </div>


                <h3>
                    KYC Approved Successfully
                </h3>


                <p>

                    Congratulations! Your KYC verification has
                    been successfully completed and approved.

                </p>


                <div class="success-grid">

                    <div>

                        <i class="fas fa-check-circle"></i>

                        Identity Verified

                    </div>


                    <div>

                        <i class="fas fa-check-circle"></i>

                        Documents Verified

                    </div>


                    <div>

                        <i class="fas fa-check-circle"></i>

                        KYC Approved

                    </div>


                    <div>

                        <i class="fas fa-shield-alt"></i>

                        Account Secured

                    </div>

                </div>


                <div class="text-center mt-4">

                    <a href="${baseUrl}/user/dashboard"
                       class="btn btn-success text-white">

                        Go To Dashboard

                    </a>

                </div>

            </div>

        </c:when>


        <c:when test="${kycData.kycStatus == 'REJECTED'}">

            <div class="status-card rejected-card">

                <div class="status-circle danger-bg">

                    <i class="fas fa-times"></i>

                </div>


                <h3>
                    Verification Failed
                </h3>


                <p>
                    Unfortunately your KYC could not be approved.
                </p>


                <div class="alert alert-danger">

                    <strong>
                        Reason
                    </strong>

                    <br>

                    <c:out value="${kycData.remarks}" />

                </div>


                <div class="alert alert-info">

                    Upload clear Aadhaar

                    <br>

                    Upload clear PAN

                    <br>

                    Complete Face Verification

                </div>


                <div class="text-center">

                    <a href="${baseUrl}/user/completekyc"
                       class="btn btn-warning">

                        Re-submit KYC

                    </a>


                    <a href="${baseUrl}/user/dashboard"
                       class="btn btn-primary">

                        Dashboard

                    </a>

                </div>

            </div>

        </c:when>


        <c:otherwise>

            <div class="status-card">

                <div class="status-circle danger-bg">

                    <i class="fas fa-question"></i>

                </div>


                <h3>
                    Application Status Unavailable
                </h3>


                <p>

                    We could not determine the current status
                    of your KYC application.

                </p>


                <div class="text-center">

                    <a href="${baseUrl}/user/applicationStatus"
                       class="btn btn-primary">

                        Refresh Status

                    </a>


                    <a href="${baseUrl}/user/dashboard"
                       class="btn btn-success">

                        Dashboard

                    </a>

                </div>

            </div>

        </c:otherwise>


    </c:choose>

</div>


<%@ include file="../commonUser/footer.jsp" %>

