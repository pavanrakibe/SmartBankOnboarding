<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	
	<base href="${pageContext.request.contextPath}/">


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Forgot Password</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f5f8fc;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	width: 420px;
	background: #fff;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0,0,0,0.15);
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
	color: #003566;
	margin-bottom: 10px;
}

p {
	text-align: center;
	color: gray;
	margin-bottom: 30px;
	font-size: 14px;
}

.input-box {
	margin-bottom: 20px;
}

.input-box label {
	display: block;
	margin-bottom: 8px;
	font-weight: 500;
}

.input-box input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	outline: none;
}

.input-box input:focus {
	border-color: #0056d2;
	box-shadow: 0 0 5px rgba(0,86,210,.3);
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
	text-align: center;
	color: red;
	margin-top: 20px;
	font-weight: 600;
}

.back {
	text-align: center;
	margin-top: 25px;
}

.back a {
	text-decoration: none;
	color: #0056d2;
	font-weight: 600;
}

.back a:hover {
	color: #003566;
	text-decoration: underline;
}

/* Validation */

label.error {
	color: #dc3545;
	font-size: 13px;
	margin-top: 5px;
	display: block;
	font-weight: 500;
}

input.error {
	border: 1px solid #dc3545 !important;
	background: #fff5f5;
}

input.valid {
	border: 1px solid #28a745 !important;
}

/* Shake Animation */

@keyframes shake {
	0% { transform: translateX(0); }
	20% { transform: translateX(-15px); }
	40% { transform: translateX(15px); }
	60% { transform: translateX(-15px); }
	80% { transform: translateX(15px); }
	100% { transform: translateX(0); }
}

.shake {
	animation: shake 0.35s ease-in-out;
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
        font-size: 20px;
        margin-bottom: 8px;
    }

    h2 {
        font-size: 22px;
        margin-bottom: 8px;
    }

    p {
        font-size: 13px;
        line-height: 1.5;
        margin-bottom: 22px;
    }

    .input-box {
        margin-bottom: 18px;
    }

    .input-box label {
        font-size: 14px;
        margin-bottom: 6px;
    }

    .input-box input {
        padding: 11px;
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

    .back {
        margin-top: 20px;
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

	<h2>Forgot Password</h2>

	<p>Enter your username to receive an OTP on your registered email.</p>

	<form id="forgotForm"
		action="auth/sendOtp"
		method="post">

		<div class="input-box">

			<label>Email</label>

			<input
				type="email"
				name="email"
				id="email"
				placeholder="Enter your registered email">

		</div>

		<button type="submit">
			Send OTP
		</button>

	</form>

	<div class="message">
		${message}
	</div>

	

</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- jQuery Validation -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<script>
	$(function () {

		$("#forgotForm").validate({

			errorClass: "error",
			validClass: "valid",

			rules: {
				email: {
					required: true,
					email: true
				}
			},

			messages: {
				email: {
					required: "Please enter your email address.",
					email: "Please enter a valid email address."
				}
			},

			errorPlacement: function (error, element) {
				error.insertAfter(element);
			},

			highlight: function (element) {
				$(element)
					addClass("error")
					.removeClass("valid");

				// Remove previous animation
				$(element).removeClass("shake");

				// Trigger animation again
				setTimeout(function () {
					$(element).addClass("shake");
				}, 10);
			},

			unhighlight: function (element) {
				$(element)
					.removeClass("error shake")
					.addClass("valid");
			},

			invalidHandler: function () {

				// Shake the complete form
				$(".container").removeClass("shake");

				setTimeout(function () {
					$(".container").addClass("shake");
				}, 10);

			},

			submitHandler: function (form) {
				form.submit();
			}

		});

	});

</script>

</body>
</html>