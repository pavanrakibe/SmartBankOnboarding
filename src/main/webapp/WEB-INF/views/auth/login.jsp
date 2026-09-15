<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<base href="${pageContext.request.contextPath}/">

		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Digital Account Gateway</title>

		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
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
				width: 900px;
				height: 600px;
				background: #fff;
				border-radius: 20px;
				overflow: hidden;
				display: flex;
				box-shadow: 0 15px 40px rgba(0, 0, 0, .15);
			}

			/* LEFT PANEL */

			.left {
				width: 45%;
				background: linear-gradient(135deg, #003566, #0056d2, #00b4d8);
				color: white;
				padding: 50px 35px;
				display: flex;
				flex-direction: column;
				justify-content: center;
			}

			.left h1 {
				font-size: 38px;
				margin-bottom: 20px;
			}

			.left p {
				font-size: 17px;
				line-height: 30px;
				opacity: .95;
			}

			.left ul {
				margin-top: 30px;
			}

			.left ul li {
				list-style: none;
				padding: 10px 0;
				font-size: 17px;
			}

			/* RIGHT PANEL */

			.right {
				width: 55%;
				padding: 60px;
			}

			.logo {
				text-align: center;
				font-size: 25px;
				font-weight: bold;
				margin-bottom: 15px;
				color: #0056d2;
			}

			.logo span {
				color: #00b4d8;
			}

			.right h3 {
				text-align: center;
				margin-bottom: 35px;
				color: #003566;
			}

			.input-box {
				margin-bottom: 22px;
			}

			.input-box label {
				display: block;
				margin-bottom: 8px;
				font-weight: 500;
				color: #555;
			}

			.input-box input {
				width: 100%;
				padding: 14px;
				border: 1px solid #ccc;
				border-radius: 8px;
				font-size: 15px;
				outline: none;
				transition: .3s;
			}

			.input-box input:focus {
				border-color: #0056d2;
				box-shadow: 0 0 8px rgba(0, 86, 210, .3);
			}

			button {
				width: 100%;
				padding: 15px;
				background: #0056d2;
				border: none;
				border-radius: 8px;
				color: white;
				font-size: 17px;
				cursor: pointer;
				transition: .3s;
			}

			button:hover {
				background: #003566;
			}

			.message {
				text-align: center;
				margin-top: 20px;
				font-weight: 600;
				color: red;
			}

			/* Bottom Links */

			.action-links {
				margin-top: 25px;
				display: flex;
				justify-content: space-between;
				align-items: center;
			}

			.register-btn {
				color: #003566;
				padding: 7px 25px;
				border-radius: 8px;
				border: 1px solid #003566;
				text-decoration: none;
				font-weight: 600;
				transition: .3s;
			}

			.register-btn:hover {
				background: #0056d2;
				border: 1px solid #0056d2;
				color: #fff;
			}

			.forgot-link {
				text-decoration: none;
				color: #0056d2;
				font-weight: 600;
			}

			.forgot-link:hover {
				text-decoration: underline;
				color: #003566;
			}

			/* Validation */

			label.error {
				color: red;
				font-size: 13px;
				margin-top: 5px;
				display: block;
				font-weight: normal;
			}

			input.error {
				border: 1px solid red;
			}

			input.valid {
				border: 1px solid green;
			}
			/* =========================================
			   Mobile Responsive - 320px to 480px
			   ========================================= */

			@media (min-width: 320px) and (max-width: 480px) {

			    body {
			        width: 100%;
			        min-height: 100vh;
			        height: auto;
			        padding: 10px;
			        display: flex;
			        align-items: flex-start;
			        justify-content: center;
			        overflow-x: hidden;
			    }

			    .container {
			        width: 100%;
			        max-width: 100%;
			        height: auto;
			        min-height: auto;
			        margin: 10px 0;
			        border-radius: 15px;
			        display: flex;
			        flex-direction: column;
			        overflow: hidden;
			    }

			    /* =========================
			       LEFT PANEL
			       ========================= */

			    .left {
			        width: 100%;
			        padding: 25px 18px;
			        text-align: center;
			    }

			    .left h1 {
			        font-size: 25px;
			        margin-bottom: 12px;
			        line-height: 1.3;
			    }

			    .left p {
			        font-size: 13px;
			        line-height: 21px;
			    }

			    .left ul {
			        margin-top: 18px;
			    }

			    .left ul li {
			        padding: 6px 0;
			        font-size: 13px;
			    }

			    /* =========================
			       RIGHT PANEL
			       ========================= */

			    .right {
			        width: 100%;
			        padding: 25px 18px;
			    }

			    .logo {
			        font-size: 20px;
			        margin-bottom: 12px;
			    }

			    .right h3 {
			        font-size: 20px;
			        margin-bottom: 22px;
			    }

			    /* =========================
			       INPUTS
			       ========================= */

			    .input-box {
			        margin-bottom: 17px;
			    }

			    .input-box label {
			        font-size: 13px;
			        margin-bottom: 6px;
			    }

			    .input-box input {
			        width: 100%;
			        height: 44px;
			        padding: 11px;
			        font-size: 13px;
			        border-radius: 8px;
			    }

			    /* =========================
			       LOGIN BUTTON
			       ========================= */

			    button {
			        width: 100%;
			        height: 46px;
			        padding: 10px;
			        font-size: 15px;
			        border-radius: 8px;
			    }

			    /* =========================
			       MESSAGE
			       ========================= */

			    .message {
			        margin-top: 15px;
			        font-size: 12px;
			        line-height: 18px;
			    }

			    /* =========================
			       BOTTOM LINKS
			       ========================= */

			    .action-links {
			        margin-top: 18px;
			        display: flex;
			        flex-direction: column;
			        gap: 12px;
			        align-items: stretch;
			    }

			    .register-btn {
			        width: 100%;
			        padding: 9px 15px;
			        text-align: center;
			        font-size: 13px;
			    }

			    .forgot-link {
			        text-align: center;
			        font-size: 13px;
			    }

			    /* =========================
			       VALIDATION
			       ========================= */

			    label.error {
			        font-size: 11px;
			        margin-top: 4px;
			        line-height: 16px;
			    }
			}
			
		</style>

	</head>

	<body>

		<div class="container">

			<div class="left">

				<h1>Welcome Back!</h1>

				<p>Login to continue your Digital Account Gateway journey and enjoy secure
					digital banking.</p>

				<ul>
					<li>✔ Secure Login</li>
					<li>✔ Fast & Paperless Banking</li>
					<li>✔ 24×7 Access</li>
					<li>✔ Instant Services</li>
				</ul>

			</div>

			<div class="right">

				<div class="logo">
					Digital Account <span> Gateway</span>   
				</div>

				<h3>User Login</h3>
				

				<form id="loginForm" action="auth/login" method="post">

					<div class="input-box">
						<label>Email</label>
						<input type="email" id="email" name="email" placeholder="Enter your email">
					</div>

					<div class="input-box">
						<label>Password</label>
						<input type="password" id="password" name="password" placeholder="Enter your password">
					</div>

					<button type="submit">Login</button>

				</form>

				<div class="message">
					${message}
				</div>

				<div class="action-links">

					<a href="auth/register" class="register-btn">
						Register
					</a>

					<a href="auth/forgotpassword" class="forgot-link">
						Forgot Password?
					</a>

				</div>

			</div>

		</div>

		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

		<!-- jQuery Validation -->
		<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

		<script>
			$(document).ready(function () {

				$.validator.addMethod("usernameRule", function (value, element) {
					return this.optional(element)
						|| /^[a-zA-Z0-9_@.]+$/.test(value);
				}, "Only letters, numbers and underscore are allowed.");

				$("#loginForm").validate({

					rules: {

						email: {
							required: true,
							minlength: 3,
							usernameRule: true
						},

						password: {
							required: true,
							minlength: 6,
							maxlength: 20
						}

					},

					messages: {

						email: {
							required: "Please enter your email ex=ex12@gmail.com",
							minlength: "Username must be at least 3 characters",
						},

						password: {
							required: "Please enter your password",
							minlength: "Password must be at least 6 characters",
							maxlength: "Password cannot exceed 20 characters"
						}

					},

					errorElement: "label",

					highlight: function (element) {
						$(element).addClass("error").removeClass("valid");
					},

					unhighlight: function (element) {
						$(element).removeClass("error").addClass("valid");
					},

					submitHandler: function (form) {
						form.submit();
					}

				});

			});
		</script>

	</body>

	</html>