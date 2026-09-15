<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<base href="${pageContext.request.contextPath}/">

		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>Reset Password</title>

		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
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

				width: 450px;
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
				margin-bottom: 25px;
				color: #003566;

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
				padding: 14px;
				border: 1px solid #ccc;
				border-radius: 8px;

			}

			button {

				width: 100%;
				padding: 14px;
				background: #0056d2;
				border: none;
				color: white;
				border-radius: 8px;
				font-size: 16px;
				cursor: pointer;

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
			
			.error {
			    color: #dc3545;
			    font-size: 13px;
			    margin-top: 5px;
			    display: block;
			}

			input.error-field {
			    border: 1px solid #dc3545;
			}

			input.valid-field {
			    border: 1px solid #28a745;
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
			        margin-bottom: 20px;
			    }

			    .input-box {
			        margin-bottom: 18px;
			    }

			    .input-box label {
			        font-size: 14px;
			        margin-bottom: 6px;
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

			    .error {
			        font-size: 12px;
			        margin-top: 4px;
			    }
			}


			/* =========================================
			   Extra Small Screens: 320px - 350px
			   ========================================= */

			@media screen and (max-width: 350px) {

			    body {
			        padding: 10px;
			    }

			    .container {
			        padding: 22px 15px;
			    }

			    .logo {
			        font-size: 24px;
			    }

			    h2 {
			        font-size: 19px;
			        margin-bottom: 18px;
			    }

			    .input-box label {
			        font-size: 13px;
			    }

			    .input-box input {
			        padding: 10px;
			        font-size: 13px;
			    }

			    button {
			        padding: 11px;
			        font-size: 14px;
			    }

			    .message {
			        font-size: 12px;
			    }

			    .error {
			        font-size: 11px;
			    }
			}
			
		</style>

	</head>

	<body>

		<div class="container">

			<div class="logo">

				Digital Account <span>Gateway</span>
				 

			</div>

			<h2>Reset Password</h2>

			<form id="resetPasswordForm" action="auth/resetPassword" method="post">

			    <div class="input-box">
			        <label>New Password</label>
			        <input type="password"
			               id="password"
			               name="password"
			               placeholder="Enter New Password">
			    </div>

			    <div class="input-box">
			        <label>Confirm Password</label>
			        <input type="password"
			               id="confirmPassword"
			               name="confirmPassword"
			               placeholder="Confirm Password">
			    </div>

			    <button type="submit">
			        Update Password
			    </button>

			</form>
		

			<div class="message">

				${message}

			</div>

		</div>
		
		
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		
		<script>
		$(document).ready(function () {

		    $("form").submit(function (e) {

		        $(".error").remove();
		        $("input").removeClass("error-field valid-field");

		        let isValid = true;

		        let password = $("input[name='password']").val().trim();
		        let confirmPassword = $("input[name='confirmPassword']").val().trim();

		        // Password Validation
		        if (password === "") {
		            $("input[name='password']")
		                .addClass("error-field")
		                .after("<span class='error'>Password is required.</span>");
		            isValid = false;
		        }
		        else if (password.length < 6) {
		            $("input[name='password']")
		                .addClass("error-field")
		                .after("<span class='error'>Password must be at least 6 characters.</span>");
		            isValid = false;
		        }
		        else {
		            $("input[name='password']").addClass("valid-field");
		        }

		        // Confirm Password Validation
		        if (confirmPassword === "") {
		            $("input[name='confirmPassword']")
		                .addClass("error-field")
		                .after("<span class='error'>Confirm Password is required.</span>");
		            isValid = false;
		        }
		        else if (password !== confirmPassword) {
		            $("input[name='confirmPassword']")
		                .addClass("error-field")
		                .after("<span class='error'>Passwords do not match.</span>");
		            isValid = false;
		        }
		        else if (password.length >= 6) {
		            $("input[name='confirmPassword']").addClass("valid-field");
		        }

		        if (!isValid) {
		            e.preventDefault();
		        }

		    });

		});
		</script>

	</body>

	</html>