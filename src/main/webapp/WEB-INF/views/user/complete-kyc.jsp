<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../commonUser/header.jsp" %>






<style>
	

	
	
	
	
	.text-danger{
	    color:#dc3545;
	    font-size:13px;
	    display:block;
	    margin-top:5px;
	}

	input.error,
	select.error,
	textarea.error{
	    border:1px solid #dc3545;
	}

	input.valid,
	select.valid,
	textarea.valid{
	    border:1px solid #28a745;
	}
</style>






<link rel="stylesheet"
      href="${baseUrl}/resources/css/complete-kyc.css">

<div class="kyc-container">

    <!-- ==========================================
                    PAGE HEADER
    =========================================== -->

    <div class="kyc-header">

        <h2>Complete KYC</h2>

        <p>
            Complete your Know Your Customer (KYC) process to activate your SmartBank Account.
        </p>

    </div>

    <!-- ==========================================
                    PROGRESS BAR
    =========================================== -->
      
    <div class="wizard-header">

        <div class="wizard-text">

            <span id="stepTitle">
                Step 1 of 5
            </span>

            <span id="stepPercent">
                20%
            </span>

        </div>

        <div class="kyc-progress">

            <div class="kyc-progress-bar"
                 id="progressBar">

            </div>

        </div>

    </div>

    <!-- ==========================================
                    FORM START
    =========================================== -->

    <form id="kycForm" enctype="multipart/form-data">
		
		
		<input type="hidden" name="userId" value=${userId}>

<!-- =========================================================
                    STEP 1
========================================================= -->

<div class="step active">

    <div class="kyc-card">

        <h3>👤 Personal Information</h3>

        <p class="step-description">

            Enter your personal details exactly as per your Aadhaar Card.

        </p>

        <div class="kyc-row">

            <div class="kyc-form-group">

                <label>Full Name</label>

                <input
                        type="text"
                        id="fullName"
						name="fullName"
                        placeholder="Enter Full Name">

            </div>

        </div>

        <div class="kyc-row">

            <div class="kyc-form-group">

                <label>Date of Birth</label>

                <input
                        type="date"
						name="dob"
                        id="dob">

            </div>

            <div class="kyc-form-group">

                <label>Gender</label>

                <select id="gender" name="gender">

                    <option value="">Select Gender</option>

                    <option>Male</option>

                    <option>Female</option>

                    <option>Other</option>

                </select>

            </div>

        </div>

    </div>

</div>

<!-- =========================================================
                    STEP 2
========================================================= -->

<div class="step">

    <div class="kyc-card">

        <h3>🏠 Address Details</h3>

        <p class="step-description">

            Enter your current residential address.

        </p>

        <div class="kyc-row">

            <div class="kyc-form-group">

                <label>Address</label>

                <textarea
                        id="address"
						name="address"
                        rows="4"
                        placeholder="Enter Complete Address"></textarea>

            </div>

        </div>

        <div class="kyc-row">

            <div class="kyc-form-group">

                <label>City</label>

                <input
                        type="text"
                        id="city"
						name="city"
                        placeholder="Enter City">

            </div>

            <div class="kyc-form-group">

                <label>State</label>

                <select id="state" name="state">

                    <option value="">Select State</option>

                    <option>Maharashtra</option>

                    <option>Gujarat</option>

                    <option>Karnataka</option>

                    <option>Goa</option>

                    <option>Madhya Pradesh</option>

                    <option>Delhi</option>

                    <option>Tamil Nadu</option>

                </select>

            </div>

        </div>

        <div class="kyc-row">

            <div class="kyc-form-group">

                <label>Pincode</label>

                <input
                        type="text"
                        id="pincode"
						name="pincode"
                        maxlength="6"
                        placeholder="Enter Pincode">

            </div>

        </div>

    </div>

</div>

<!-- =========================================================
                    STEP 3
========================================================= -->

<div class="step">

    <div class="kyc-card">

        <h3>🪪 Identity Details</h3>

        <p class="step-description">

            Enter your Aadhaar and PAN details.

        </p>

        <div class="kyc-row">

            <div class="kyc-form-group">

                <label>Aadhaar Number</label>

                <input
                        type="text"
                        id="aadhaar"
						name="aadhaar"
                        maxlength="12"
                        placeholder="XXXX XXXX XXXX">

            </div>

            <div class="kyc-form-group">

                <label>PAN Number</label>

                <input
                        type="text"
                        id="pan"
						name="pan"
                        maxlength="10"
                        placeholder="ABCDE1234F">

            </div>

        </div>

    </div>

</div>






<!-- =========================================================
                    STEP 4
            DOCUMENT UPLOAD
========================================================= -->

<div class="step">

    <div class="kyc-card">

        <h3>📄 Upload KYC Documents</h3>

        <p class="step-description">

            Upload clear copies of your Aadhaar Card and PAN Card.

        </p>

        <div class="kyc-row">

            <div class="kyc-form-group">

                <label>Aadhaar Document</label>

                <input
                        type="file"
                        id="aadhaarFile"
						name="aadhaarFile"
						accept="image/jpeg,image/png,application/pdf">

            </div>

            <div class="kyc-form-group">

                <label>PAN Document</label>

                <input
                        type="file"
                        id="panFile"
						name="panFile"
                        accept="image/jpeg,image/png,application/pdf">

            </div>

        </div>

        <div class="upload-note">

            Supported Files :
            PDF, JPG, JPEG, PNG
            (Maximum Size 5 MB)

        </div>

    </div>

</div>

<!-- =========================================================
                    STEP 5
            FACE VERIFICATION
========================================================= -->

<div class="step">

    <div class="kyc-card">

        <h3>🎥 Face Verification</h3>

        <p class="step-description">

            Record a short face verification video.

        </p>

        <div class="face-container">

            <video
                    id="video"
                    autoplay
                    playsinline>
            </video>

            <p id="status">

                Camera Closed

            </p>

            <div class="face-btn-group">

                <button
                        type="button"
                        class="face-btn open-btn"
                        onclick="startCamera()">

                    📷 Open Camera

                </button>

                <button
                        type="button"
                        class="face-btn start-btn"
                        onclick="startRecording()">

                    🔴 Start Recording

                </button>

                <button
                        type="button"
                        class="face-btn stop-btn"
                        onclick="stopRecording()">

                    ⏹ Stop Recording

                </button>

                <button
                        type="button"
                        class="face-btn close-btn"
                        onclick="stopCamera()">

                    ❌ Close Camera

                </button>

            </div>

        </div>

        <div class="review-checkbox">

            <label>

                <input
                        type="checkbox"
                        id="declaration"
						name="declaration">

                I confirm that all the information provided is true.

            </label>

        </div>

    </div>

</div>

<!-- =========================================================
                REVIEW & SUBMIT
========================================================= -->

<div class="step">

    <div class="kyc-card">

        <h3>✅ Review & Submit</h3>

        <p class="step-description">

            Please verify all information before submitting your KYC.

        </p>

        <!-- Personal -->

        <div class="review-section">

            <h4>👤 Personal Information</h4>

            <div class="review-row">

                <span>Full Name</span>

                <strong id="reviewFullName"></strong>

            </div>

            <div class="review-row">

                <span>Date of Birth</span>

                <strong id="reviewDob"></strong>

            </div>

            <div class="review-row">

                <span>Gender</span>

                <strong id="reviewGender"></strong>

            </div>

        </div>

        <!-- Address -->

        <div class="review-section">

            <h4>🏠 Address</h4>

            <div class="review-row">

                <span>Address</span>

                <strong id="reviewAddress"></strong>

            </div>

            <div class="review-row">

                <span>City</span>

                <strong id="reviewCity"></strong>

            </div>

            <div class="review-row">

                <span>State</span>

                <strong id="reviewState"></strong>

            </div>

            <div class="review-row">

                <span>Pincode</span>

                <strong id="reviewPincode"></strong>

            </div>

        </div>

        <!-- Identity -->

        <div class="review-section">

            <h4>🪪 Identity Details</h4>

            <div class="review-row">

                <span>Aadhaar Number</span>

                <strong id="reviewAadhaar"></strong>

            </div>

            <div class="review-row">

                <span>PAN Number</span>

                <strong id="reviewPan"></strong>

            </div>

        </div>

        <!-- Documents -->

        <div class="review-section">

            <h4>📄 Uploaded Documents</h4>

            <div class="review-row">

                <span>Aadhaar Document</span>

                <strong id="reviewAadhaarFile">

                    Not Uploaded

                </strong>

            </div>

            <div class="review-row">

                <span>PAN Document</span>

                <strong id="reviewPanFile">

                    Not Uploaded

                </strong>

            </div>

        </div>

        <!-- Face -->

        <div class="review-section">

            <h4>🎥 Face Verification</h4>

            <div class="review-row">

                <span>Video Status</span>

                <strong id="faceVerificationStatus">

                    Pending

                </strong>

            </div>

            <div class="review-row">

                <span>Recorded Time</span>

                <strong id="recordedTime">

                    --

                </strong>

            </div>

        </div>

    </div>

</div>

<!-- =========================================================
                    BUTTONS
========================================================= -->

<div class="button-area">

    <button
            type="button"
            id="prevBtn">

        ← Previous

    </button>

    <button
            type="button"
            id="nextBtn">

        Next →

    </button>

</div>

</form>

</div>



<script>
	
	
	
	
	
	
	
	$(function () {

	    $("#kycForm").validate({

	        ignore: [],

	        rules: {

	            fullName: {
	                required: true,
	                minlength: 3
	            },

	            dob: {
	                required: true
	            },

	            gender: {
	                required: true
	            },

	            address: {
	                required: true,
	                minlength: 10
	            },

	            city: {
	                required: true
	            },

	            state: {
	                required: true
	            },

	            pincode: {
	                required: true,
	                digits: true,
	                minlength: 6,
	                maxlength: 6
	            },

	            aadhaar: {
	                required: true,
	                digits: true,
	                minlength: 12,
	                maxlength: 12
	            },

	            pan: {
	                required: true,
	                pattern: /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/
	            },

	            aadhaarFile: {
	                required: true,
	                extension: "jpg|jpeg|png|pdf"
	            },

	            panFile: {
	                required: true,
	                extension: "jpg|jpeg|png|pdf"
	            },

	            declaration: {
	                required: true
	            }

	        },

	        messages: {

	            fullName: {
	                required: "Please enter full name",
	                minlength: "Minimum 3 characters"
	            },

	            dob: {
	                required: "Select date of birth"
	            },

	            gender: {
	                required: "Select gender"
	            },

	            address: {
	                required: "Enter address",
	                minlength: "Minimum 10 characters"
	            },

	            city: {
	                required: "Enter city"
	            },

	            state: {
	                required: "Select state"
	            },

	            pincode: {
	                required: "Enter pincode",
	                digits: "Only digits allowed",
	                minlength: "Pincode must be 6 digits",
	                maxlength: "Pincode must be 6 digits"
	            },

	            aadhaar: {
	                required: "Enter Aadhaar Number",
	                digits: "Only digits allowed",
	                minlength: "Aadhaar must be 12 digits",
	                maxlength: "Aadhaar must be 12 digits"
	            },

	            pan: {
	                required: "Enter PAN Number",
	                pattern: "Enter valid PAN Number"
	            },

	            aadhaarFile: {
	                required: "Upload Aadhaar document",
	                extension: "Only PDF/JPG/JPEG/PNG"
	            },

	            panFile: {
	                required: "Upload PAN document",
	                extension: "Only PDF/JPG/JPEG/PNG"
	            },

	            declaration: {
	                required: "Accept declaration"
	            }

	        },

	        errorClass: "text-danger",

	        errorElement: "small"

	    });

	});
	
	
	/* =====================================================
	            KYC WIZARD
	===================================================== */

	let currentStep = 0;

	const steps = document.querySelectorAll(".step");

	const progressBar = document.getElementById("progressBar");

	const stepTitle = document.getElementById("stepTitle");

	const stepPercent = document.getElementById("stepPercent");

	const prevBtn = document.getElementById("prevBtn");

	const nextBtn = document.getElementById("nextBtn");

	let totalSteps = steps.length;

	showStep(currentStep);

	/* =====================================================
	            SHOW STEP
	===================================================== */

	function showStep(step){

	    steps.forEach(function(item){

	        item.classList.remove("active");

	    });

	    steps[step].classList.add("active");

	    let percent = ((step + 1) / totalSteps) * 100;

	    progressBar.style.width = percent + "%";

	    stepTitle.innerHTML = "Step " + (step + 1) + " of " + totalSteps;

	    stepPercent.innerHTML = Math.round(percent) + "%";

	    if(step === 0){

	        prevBtn.style.display = "none";

	    }else{

	        prevBtn.style.display = "inline-block";

	    }

	    if(step === totalSteps - 1){

	        nextBtn.innerHTML = "Submit KYC";

	        loadReviewData();

	    }else{

	        nextBtn.innerHTML = "Next →";

	    }

	}
	
	
	
	// ==========================================================
	
	/* =====================================================
	            NEXT BUTTON
	===================================================== */

	nextBtn.addEventListener("click",function(){

		if (currentStep === 0) {
		    if (!$("#fullName").valid() ||
		        !$("#dob").valid() ||
		        !$("#gender").valid()) {
		        return;
		    }
		}
		
		
		

		if (currentStep === 1) {
		    if (!$("#address").valid() ||
		        !$("#city").valid() ||
		        !$("#state").valid() ||
		        !$("#pincode").valid()) {
		        return;
		    }
		}

		
		
		if (currentStep === 2) {
		    if (!$("#aadhaar").valid() ||
		        !$("#pan").valid()) {
		        return;
		    }
		}

		
		
		if (currentStep === 3) {
		    if (!$("#aadhaarFile").valid() ||
		        !$("#panFile").valid()) {
		        return;
		    }
		}
		
		
		
		if (currentStep === 4) {

		    // Face Verification Check

		    if(!videoUploaded){

		        alert("Please complete Face Verification first.");

		        return;

		    }
			
			// Declaration Checkbox Check

			 if(!$("#declaration").is(":checked")){

			     alert("Please accept the declaration checkbox.");

			     return;

			 }

		
		}

	    if(currentStep < totalSteps - 1){

	        currentStep++;

	        showStep(currentStep);

	        return;

	    }

	    submitKyc();

	});
	
	
	// ==============================================================
	
	/* =====================================================
	            PREVIOUS BUTTON
	===================================================== */

	prevBtn.addEventListener("click",function(){

	    if(currentStep > 0){

	        currentStep--;

	        showStep(currentStep);

	    }

	});
	
	
	
	
	
	
	// =================================================================
	
	
	/* =====================================================
	            LOAD REVIEW DATA
	===================================================== */

	function loadReviewData(){

	    /* ==========================
	            PERSONAL
	    ========================== */

	    document.getElementById("reviewFullName").innerHTML =
	        document.getElementById("fullName").value;

	    document.getElementById("reviewDob").innerHTML =
	        document.getElementById("dob").value;

	    document.getElementById("reviewGender").innerHTML =
	        document.getElementById("gender").value;


	    /* ==========================
	            ADDRESS
	    ========================== */

	    document.getElementById("reviewAddress").innerHTML =
	        document.getElementById("address").value;

	    document.getElementById("reviewCity").innerHTML =
	        document.getElementById("city").value;

	    document.getElementById("reviewState").innerHTML =
	        document.getElementById("state").value;

	    document.getElementById("reviewPincode").innerHTML =
	        document.getElementById("pincode").value;


	    /* ==========================
	            IDENTITY
	    ========================== */

	    document.getElementById("reviewAadhaar").innerHTML =
	        document.getElementById("aadhaar").value;

	    document.getElementById("reviewPan").innerHTML =
	        document.getElementById("pan").value;


	    /* ==========================
	            DOCUMENTS
	    ========================== */

	    loadDocumentReview();

	}
	
	
	
	/* =====================================================
	            DOCUMENT REVIEW
	===================================================== */

	function loadDocumentReview(){

	    let aadhaarFile =
	        document.getElementById("aadhaarFile").files;

	    let panFile =
	        document.getElementById("panFile").files;

	    if(aadhaarFile.length>0){

	        document.getElementById("reviewAadhaarFile").innerHTML =
	            aadhaarFile[0].name;

	    }else{

	        document.getElementById("reviewAadhaarFile").innerHTML =
	            "Not Uploaded";

	    }


	    if(panFile.length>0){

	        document.getElementById("reviewPanFile").innerHTML =
	            panFile[0].name;

	    }else{

	        document.getElementById("reviewPanFile").innerHTML =
	            "Not Uploaded";

	    }

	}
	
	
	
	
	document.getElementById("aadhaarFile").addEventListener("change",function(){

	    loadDocumentReview();

	});

	document.getElementById("panFile").addEventListener("change",function(){

	    loadDocumentReview();

	});
	
	
	
	
	
	/* =====================================================
	            FINAL SUBMIT
	===================================================== */
	/* =====================================================
	        FINAL SUBMIT
	===================================================== */

	function submitKyc(){


	    // Face Verification Check
	    if(!videoUploaded){

	        alert("Please complete Face Verification first.");

	        return;

	    }



	    // Declaration Checkbox Check
	    if(!$("#declaration").is(":checked")){

	        alert("Please accept the declaration checkbox.");

	        return;

	    }



	    alert("KYC Submitted Successfully.");

	   // document.getElementById("kycForm").submit();
		
		// CALL BACKEND API
		uploadKyc();


	}
	
	
	
	/* =====================================================
	        FACE VERIFICATION VARIABLES
	===================================================== */

	const video = document.getElementById("video");

	const status = document.getElementById("status");

	let stream = null;

	let mediaRecorder = null;

	let recordedChunks = [];

	let videoUploaded = false;
	
	let recordedVideo = null;
	
	
	
	
	/* =====================================================
	        OPEN CAMERA
	===================================================== */

	async function startCamera(){

	    try{

	        stream = await navigator.mediaDevices.getUserMedia({

	            video:true,

	            audio:true

	        });

	        video.srcObject = stream;

	        status.innerHTML="📷 Camera Opened";

	    }
	    catch(error){

	        console.log(error);

	        alert("Unable to access camera.");

	    }

	}
	
	
	
	
	
	
	
	/* =====================================================
	        START RECORDING
	===================================================== */

	function startRecording(){

	    if(stream==null){

	        alert("Please open camera first.");

	        return;

	    }

	    recordedChunks=[];

	    mediaRecorder=new MediaRecorder(stream);

	    mediaRecorder.ondataavailable=function(event){

	        if(event.data.size>0){

	            recordedChunks.push(event.data);

	        }

	    };

		mediaRecorder.onstop = function () {

		    recordedVideo = new Blob(recordedChunks, {
		        type: "video/webm"
		    });

		    videoUploaded = true;

		    status.innerHTML = "✅ Video Recorded Successfully";

		    document.getElementById("faceVerificationStatus").innerHTML = "Completed";

		    document.getElementById("recordedTime").innerHTML =
		            new Date().toLocaleString();

		};

	    mediaRecorder.start();

	    status.innerHTML="🔴 Recording Started";

	}
	
	
	
	
	
	
	/* =====================================================
	        STOP RECORDING
	===================================================== */

	function stopRecording(){

	    if(mediaRecorder &&
	       mediaRecorder.state==="recording"){

	        mediaRecorder.stop();

	        status.innerHTML="Uploading Video...";

	    }
	    else{

	        alert("Recording not started.");

	    }

	}
	
	
	
	
	
	/* =====================================================
	        CLOSE CAMERA
	===================================================== */

	function stopCamera(){

	    if(stream){

	        stream.getTracks().forEach(function(track){

	            track.stop();

	        });

	        stream=null;

	        video.srcObject=null;

	        status.innerHTML="Camera Closed";

	    }

	}
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	/* =====================================================
	            UPLOAD COMPLETE KYC
	===================================================== */

	function uploadKyc(){

	    let formData = new FormData();
		
		
		/* ========= USER ID ========= */

		formData.append(
		    "userId",
		    document.querySelector('input[name="userId"]').value
		);

	    /* ========= PERSONAL ========= */

	    formData.append("fullName",
	        document.getElementById("fullName").value);

	    formData.append("dob",
	        document.getElementById("dob").value);

	    formData.append("gender",
	        document.getElementById("gender").value);


	    /* ========= ADDRESS ========= */

	    formData.append("address",
	        document.getElementById("address").value);

	    formData.append("city",
	        document.getElementById("city").value);

	    formData.append("state",
	        document.getElementById("state").value);

	    formData.append("pincode",
	        document.getElementById("pincode").value);


	    /* ========= IDENTITY ========= */

	    formData.append("aadhaarNo",
	        document.getElementById("aadhaar").value);

	    formData.append("panNo",
	        document.getElementById("pan").value);


	    /* ========= FACE VIDEO ========= */

		formData.append(
		    "faceVideo",
		    recordedVideo,
		    "face.webm"
		);


	    /* ========= DOCUMENTS ========= */

	    formData.append(
	        "aadhaarFile",
	        document.getElementById("aadhaarFile").files[0]
	    );

	    formData.append(
	        "panFile",
	        document.getElementById("panFile").files[0]
	    );
		
		



		fetch("${baseUrl}/kyc/saveKyc",{

	        method:"POST",

	        body:formData

	    })

	    .then(response=>response.json())

	    .then(function(data){

	        if(data.status){

	           //  alert("KYC Submitted Successfully.");

	           // window.location =
	           //  "${baseUrl}/user/dashboard";

			   Swal.fire({
			           title: "KYC Submitted Successfully!",
			           text: "Your KYC details have been submitted successfully.",
			           icon: "success",
			           confirmButtonText: "Go to Dashboard",
			           confirmButtonColor: "#0056d2"
			       }).then((result)=>{

			           if(result.isConfirmed){

			               window.location =
			               "${baseUrl}/user/dashboard";

			           }

			       });
				   
	        }
	        else{

	            // alert(data.message);
				
				Swal.fire({
				         title: "KYC Submission Failed",
				         text: data.message,
				         icon: "error",
				         confirmButtonText: "OK",
				         confirmButtonColor: "#dc3545"
				     });

	        }

	    })

	    .catch(function(error){

	        console.log(error);

	        // alert("Server Error.");
			
			Swal.fire({
			     title: "Server Error!",
			     text: "Something went wrong. Please try again later.",
			     icon: "error",
			     confirmButtonText: "OK"
			 });

	    });

	}
	
	</script>