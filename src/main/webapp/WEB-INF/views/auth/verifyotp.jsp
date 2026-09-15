<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	
	<base href="${pageContext.request.contextPath}/">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Verify OTP</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #f4f7fb;
}

.container {
	width: 430px;
	background: white;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .15);
}

.logo {
	text-align: center;
	font-size: 32px;
	font-weight: bold;
	color: #0056d2;
	margin-bottom: 10px;
}

.logo span {
	color: #00b4d8;
}

h2 {
	text-align: center;
	margin-bottom: 10px;
	color: #003566;
}

p {
	text-align: center;
	color: #666;
	margin-bottom: 20px;
}

.timer {
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	color: #0056d2;
	margin-bottom: 25px;
}

.input-box {
	margin-bottom: 20px;
}

.input-box input {
	width: 100%;
	padding: 14px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	outline: none;
}

.input-box input:focus {
	border-color: #0056d2;
	box-shadow: 0 0 5px rgba(0, 86, 210, .3);
}

button {
	width: 100%;
	padding: 14px;
	background: #0056d2;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: .3s;
}

button:hover {
	background: #003566;
}

.message {
	margin-top: 20px;
	text-align: center;
	color: red;
	font-weight: bold;
}

.resend {
	text-align: center;
	margin-top: 20px;
}

.resend a {
	display: none;
	color: #0056d2;
	font-weight: bold;
	text-decoration: none;
}

.resend a:hover {
	text-decoration: underline;
}

label.error {
	color: red;
	font-size: 13px;
	margin-top: 5px;
	display: block;
}

input.error {
	border: 1px solid red;
}

input.valid {
	border: 1px solid green;
}


/* =========================================
   Responsive Design: 320px to 480px
   ========================================= */

@media screen and (min-width: 320px) and (max-width: 480px) {

    body {
        padding: 15px;
        height: 100vh;
    }

    .container {
        width: 100%;
        max-width: 380px;
        padding: 25px 20px;
        border-radius: 12px;
    }

    .logo {
        font-size: 27px;
        margin-bottom: 8px;
    }

    h2 {
        font-size: 21px;
        margin-bottom: 8px;
    }

    p {
        font-size: 13px;
        line-height: 1.5;
        margin-bottom: 18px;
    }

    .timer {
        font-size: 16px;
        margin-bottom: 20px;
    }

    .input-box {
        margin-bottom: 18px;
    }

    .input-box input {
        padding: 12px;
        font-size: 14px;
    }

    button {
        padding: 12px;
        font-size: 15px;
    }

    .message {
        font-size: 13px;
        margin-top: 15px;
    }

    .resend {
        margin-top: 18px;
        font-size: 14px;
    }

    label.error {
        font-size: 12px;
    }
}



</style>

</head>

<body>

	<div class="container">

		<div class="logo">
			Digital Account <span>Gateway</span>
			 
		</div>

		<h2>OTP Verification</h2>

		<p>Enter the OTP sent to your registered email.</p>

		<div class="timer">
			OTP expires in:
			<span id="countdown">01:00</span>
		</div>

		<form id="otpForm"
			action="auth/verifyOtp"
			method="post">

			<div class="input-box">

				<!-- <input
					type="text"
					id="otp"
					name="otp"
					placeholder="Enter 6-digit OTP">-->
					
					
					<input
					    type="text"
					    id="otp"
					    name="otp"
					    placeholder="Enter 6-digit OTP"
					    inputmode="numeric"
					    autocomplete="one-time-code"
					    maxlength="6">

			</div>

			<button id="verifyBtn" type="submit">
				Verify OTP
			</button>

		</form>

		<div class="message">
			${message}
		</div>

		<div class="resend">
			<a id="resendOtp"
				href="auth/forgotpassword">
				Resend OTP
			</a>
		</div>

	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<!-- Validation -->
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

	<script>

$(document).ready(function(){

	$("#otpForm").validate({

		rules:{

			otp:{
				required:true,
				digits:true,
				minlength:6,
				maxlength:6
			}

		},

		messages:{

			otp:{
				required:"Please enter OTP",
				digits:"OTP must contain only numbers",
				minlength:"OTP must be 6 digits",
				maxlength:"OTP must be 6 digits"
			}

		}

	});

});


let timeLeft = 60;

const timer = setInterval(function(){

	let minutes = Math.floor(timeLeft/60);
	let seconds = timeLeft%60;

	minutes = minutes < 10 ? "0"+minutes : minutes;
	seconds = seconds < 10 ? "0"+seconds : seconds;

	document.getElementById("countdown").innerHTML = minutes + ":" + seconds;

	if(timeLeft<=0){

		clearInterval(timer);

		document.getElementById("countdown").innerHTML="Expired";

		document.getElementById("otp").disabled=true;

		document.getElementById("verifyBtn").disabled=true;

		document.getElementById("verifyBtn").style.background="gray";

		document.getElementById("verifyBtn").style.cursor="not-allowed";

		document.getElementById("resendOtp").style.display="inline";

		alert("OTP has expired. Please resend OTP.");

	}

	timeLeft--;

},1000);

</script>

</body>
</html>