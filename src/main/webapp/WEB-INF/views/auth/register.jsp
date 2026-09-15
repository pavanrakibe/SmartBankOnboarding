<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<div%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


		<!DOCTYPE html>
		<html>

		<head>
			<base href="${pageContext.request.contextPath}/">


			<meta charset="UTF-8">

			<title>Digital Account Gateway | Create Account</title>

			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
				rel="stylesheet">

			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

			<style>
				* {
					margin: 0;
					padding: 0;
					box-sizing: border-box;
					font-family: 'Poppins', sans-serif;
				}

				body {
					background: #eef3fb;
					min-height: 100vh;
					display: flex;
					justify-content: center;
					align-items: center;
					padding: 30px;
					overflow-x: hidden;
					position: relative;
				}

				/* Background */




				/* Main Card */

				.container {
					width: 1180px;
					max-width: 100%;
					max-height: 90vh;
					background: #fff;
					border-radius: 28px;
					overflow: hidden;
					display: flex;
					box-shadow: 0 25px 60px rgba(0, 0, 0, .15);
				}

				/* Left Side */

				.left-panel {
					width: 38%;
					background: linear-gradient(180deg, #12448b, #1565d8, #16a9d6);
					color: #fff;
					padding: 60px 45px;
					display: flex;
					flex-direction: column;
					justify-content: center;
				}

				.logo {
					width: 80px;
					height: 80px;
					background: rgba(255, 255, 255, .15);
					border-radius: 18px;
					display: flex;
					justify-content: center;
					align-items: center;
					font-size: 34px;
					margin-bottom: 30px;
				}

				.left-panel h1 {
					font-size: 25px;
					font-weight: 700;
					line-height: 1.2;
					margin-bottom: 20px;
				}

				.left-panel p {
					font-size: 17px;
					line-height: 30px;
					opacity: .95;
					margin-bottom: 40px;
				}

				.features {
					display: flex;
					flex-direction: column;
					gap: 18px;
				}

				.feature {
					display: flex;
					align-items: center;
					gap: 15px;
					font-size: 17px;
					font-weight: 500;
				}

				.feature i {
					color: #fff;
					font-size: 20px;
				}

				/* Right Panel */

				.right-panel {
					width: 62%;
					padding: 45px 55px;
					background: #fff;
					overflow-y: auto;
					max-height: 90vh;
				}

				.title {
					text-align: center;
					margin-bottom: 30px;
				}

				.title h2 {
					font-size: 38px;
					color: #11408a;
					font-weight: 700;
				}

				.title p {
					margin-top: 8px;
					color: #666;
					font-size: 15px;
				}

				/* Form */

				.row {
					display: flex;
					gap: 20px;
				}

				.input-group {
					flex: 1;
					margin-bottom: 18px;
				}

				.input-group label {
					display: block;
					margin-bottom: 8px;
					font-size: 15px;
					font-weight: 600;
					color: #333;
				}

				.input-group input,
				.input-group select {
					width: 100%;
					height: 45px;
					border: 1px solid #d9d9d9;
					border-radius: 12px;
					padding: 0 16px;
					font-size: 15px;
					transition: .3s;
					outline: none;
					background: #fff;
				}

				.input-group input:focus,
				.input-group select:focus {
					border-color: #1565d8;
					box-shadow: 0 0 0 4px rgba(21, 101, 216, .15);
				}

				.input-group small {
					display: block;
					color: #777;
					font-size: 12px;
					margin-top: 5px;
				}

				/* Password */

				.password-box {
					position: relative;
				}

				.password-box input {
					padding-right: 45px;
				}

				.password-box i {
					position: absolute;
					right: 18px;
					top: 17px;
					color: #777;
					cursor: pointer;
				}

				/* Gender */

				.gender-box {
					display: flex;
					gap: 20px;
					margin-top: 8px;
				}

				.gender-option {
					display: flex;
					align-items: center;
					gap: 8px;
					font-size: 15px;
					cursor: pointer;
				}

				label.gender-option {
					display: flex;
				}

				.gender-option input {
					accent-color: #1565d8;
					width: 20px;
				}

				/* Messages */

				.success-msg {
					background: #d4edda;
					color: #155724;
					padding: 12px;
					border-radius: 10px;
					margin-bottom: 15px;
					text-align: center;
				}

				.error-msg {
					background: #fde2e2;
					color: #d8000c;
					padding: 12px;
					border-radius: 10px;
					margin-bottom: 15px;
					text-align: center;
				}

				/* Button */

				.register-btn {
					width: 100%;
					height: 55px;
					border: none;
					border-radius: 12px;
					background: #1565d8;
					color: #fff;
					font-size: 18px;
					font-weight: 600;
					cursor: pointer;
					transition: .3s;
					display: flex;
					justify-content: center;
					align-items: center;
					gap: 10px;
					margin-top: 8px;
				}

				.register-btn:hover {
					background: #114cb3;
					transform: translateY(-2px);
				}

				.loader {
					width: 18px;
					height: 18px;
					border: 3px solid rgba(255, 255, 255, .4);
					border-top: 3px solid white;
					border-radius: 50%;
					display: none;
					animation: spin .8s linear infinite;
				}

				@keyframes spin {
					100% {
						transform: rotate(360deg);
					}
				}

				/* Login */

				.login-link {
					margin-top: 22px;
					text-align: center;
					font-size: 15px;
					color: #555;
				}

				.login-link a {
					text-decoration: none;
					color: #1565d8;
					font-weight: 600;
				}

				.login-link a:hover {
					text-decoration: underline;
				}

				/* Scroll */

				.right-panel::-webkit-scrollbar {
					width: 8px;
				}

				.right-panel::-webkit-scrollbar-thumb {
					background: #1565d8;
					border-radius: 20px;
				}

				.right-panel::-webkit-scrollbar-track {
					background: #eee;
				}

				/* Responsive */

				@media(max-width:991px) {

					.container {
						flex-direction: column;
					}

					.left-panel,
					.right-panel {
						width: 100%;
					}

					.left-panel {
						padding: 45px 30px;
					}

					.right-panel {
						padding: 35px 25px;
						max-height: none;
					}

					.row {
						flex-direction: column;
						gap: 0;
					}

					.left-panel h1 {
						font-size: 36px;
					}

					.title h2 {
						font-size: 30px;
					}

				}

				@media(max-width:576px) {

					body {
						padding: 15px;
					}

					.container {
						border-radius: 20px;
					}

					.left-panel {
						padding: 35px 20px;
					}

					.right-panel {
						padding: 25px 18px;
					}

					.logo {
						width: 65px;
						height: 65px;
						font-size: 28px;
					}

					.left-panel h1 {
						font-size: 30px;
					}

					.title h2 {
						font-size: 28px;
					}

					.input-group input,
					.input-group select {
						height: 48px;
					}

					.register-btn {
						height: 50px;
					}

					.gender-box {
						flex-direction: column;
						gap: 10px;
					}

				}


				/*				=================================================*/

				/* validation  code*/
				small.error {
					color: #dc3545;
					display: block;
					margin-top: 5px;
					font-size: 13px;
					font-weight: 500;
				}

				input.error,
				select.error {
					border: 1px solid #dc3545 !important;
				}

				input.valid,
				select.valid {
					border: 1px solid #28a745 !important;
				}
			
				/* =========================================
				   Mobile Responsive - 320px to 480px
				   ========================================= */

				@media (min-width: 320px) and (max-width: 480px) {

				    body {
				        padding: 8px;
				        align-items: flex-start;
				        min-height: 100vh;
				    }

				    .container {
				        width: 100%;
				        max-width: 100%;
				        border-radius: 15px;
				        flex-direction: column;
				        margin: 10px 0;
				    }

				    /* LEFT PANEL */
				    .left-panel {
				        width: 100%;
				        padding: 25px 18px;
				        text-align: center;
				    }

				    .logo {
				        width: 55px;
				        height: 55px;
				        font-size: 24px;
				        margin: 0 auto 18px;
				        border-radius: 14px;
				    }

				    .left-panel h1 {
				        font-size: 20px;
				        line-height: 1.3;
				        margin-bottom: 12px;
				    }

				    .left-panel p {
				      display: none;
				        margin-bottom: 0;
				    }

				    .features {
				       display: none;
					   
				    }

				    .feature {
				        gap: 10px;
				        font-size: 13px;
				    }

				    .feature i {
				        font-size: 15px;
				        min-width: 18px;
				    }

				    /* RIGHT PANEL */
				    .right-panel {
				        width: 100%;
				        padding: 22px 15px;
				        max-height: none;
				        overflow-y: auto;
				    }

				    .title {
				        margin-bottom: 20px;
				    }

				    .title h2 {
				        font-size: 24px;
				    }

				    .title p {
				        font-size: 12px;
				        line-height: 18px;
				    }

				    /* FORM */
				    .row {
				        flex-direction: column;
				        gap: 0;
				    }

				    .input-group {
				        width: 100%;
				        margin-bottom: 14px;
				    }

				    .input-group label {
				        font-size: 13px;
				        margin-bottom: 6px;
				    }

				    .input-group input,
				    .input-group select {
				        width: 100%;
				        height: 44px;
				        padding: 0 12px;
				        font-size: 13px;
				        border-radius: 9px;
				    }

				    .input-group small {
				        font-size: 11px;
				        margin-top: 4px;
				    }

				    /* PASSWORD */
				    .password-box input {
				        padding-right: 40px;
				    }

				    .password-box i {
				        right: 13px;
				        top: 14px;
				        font-size: 14px;
				    }

				    /* GENDER */
				    .gender-box {
				        flex-direction: row;
				        flex-wrap: wrap;
				        gap: 12px;
				        margin-top: 5px;
				    }

				    .gender-option {
				        font-size: 13px;
				        gap: 5px;
				    }

				    .gender-option input {
				        width: 16px;
				    }

				    /* BUTTON */
				    .register-btn {
				        width: 100%;
				        height: 48px;
				        font-size: 15px;
				        border-radius: 9px;
				        margin-top: 5px;
				    }

				    /* LOGIN */
				    .login-link {
				        margin-top: 16px;
				        font-size: 12px;
				        line-height: 20px;
				    }

				    /* VALIDATION */
				    small.error {
				        font-size: 11px;
				        margin-top: 4px;
				    }
				}
				

			</style>

		</head>

		<body>

			<!-- Background Animation -->

			<div class="background-circle circle1"></div>
			<div class="background-circle circle2"></div>

			<div class="container">

				<!-- Left Panel -->

				<div class="left-panel">

					<div class="logo">
						<i class="fa-solid fa-building-columns"></i>
					</div>

					<h1>
						Join <br> Digital Account Gateway
					</h1>

					<p>
						Start your digital banking journey.<br> Create your account
						securely and access Digital Account Gateway services.
					</p>

					<div class="features">

						<div class="feature">
							<i class="fa-solid fa-circle-check"></i> Easy Registration
						</div>

						<div class="feature">
							<i class="fa-solid fa-lock"></i> Secure Banking
						</div>

						<div class="feature">
							<i class="fa-solid fa-mobile-screen-button"></i> Digital Account
							Access
						</div>

						<div class="feature">
							<i class="fa-solid fa-bolt"></i> Fast Services
						</div>

						<div class="feature">
							<i class="fa-solid fa-headset"></i> 24×7 Support
						</div>

					</div>

				</div>

				
				
				
				
				

				<div class="right-panel">

					<div class="title">

						<h2>Create Account</h2>

						<p>Register to access Digital Account Gateway</p>

					</div>

					<form id="registerForm" action="auth/register" method="post">


						<div class="row">

							<div class="input-group">

								<label>Full Name</label>

								<input type="text" name="name" id="fullName" placeholder="Enter Full Name">

								<small></small>

							</div>

							<div class="input-group">

								<label>Email</label>

								<input type="email" name="email" id="email" placeholder="Enter Email">

								<small></small>

							</div>

						</div>


						<div class="row">

							<div class="input-group">

								<label>Mobile Number</label>

								<input type="text"
								       name="mobile"
								       id="mobile"
								       placeholder="Enter Mobile Number"
								       maxlength="10">

								<small></small>

							</div>

						

						</div>


						<div class="row">
						<div class="input-group">

							<label>Password</label>

							<div class="password-box">

								<input type="password" name="password" id="password" placeholder="Enter Password">

								<i class="fa-solid fa-eye togglePassword" data-target="password"></i>

							</div>


						</div>


						<div class="input-group">

							<label>Confirm Password</label>

							<div class="password-box">

								<input type="password" name="confirmPassword" id="confirmPassword"
									placeholder="Confirm Password">

								<i class="fa-solid fa-eye togglePassword" data-target="confirmPassword"></i>

							</div>

							<small></small>

						</div>
						</div>


					


						<button type="submit" class="register-btn">

							<span class="btn-text">Create Account</span>

							<div class="loader"></div>

						</button>

						<div class="login-link">

							Already have an account?

							<a href="auth/login">
								Login Here
							</a>

						</div>

					</form>

				</div>

			</div>

			<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

			<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

			<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>


			<script>
				$(document).ready(function () {

					// Password Show/Hide
					$(".togglePassword").click(function () {
						let target = $("#" + $(this).data("target"));

						if (target.attr("type") === "password") {
							target.attr("type", "text");
							$(this).removeClass("fa-eye").addClass("fa-eye-slash");
						} else {
							target.attr("type", "password");
							$(this).removeClass("fa-eye-slash").addClass("fa-eye");
						}
					});

					$("#registerForm").validate({

						rules: {

							fullName: {
								required: true,
								minlength: 3
							},

							email: {
								required: true,
								email: true
							},

							mobileNo: {
							    required: true,
							    digits: true,
							    minlength: 10,
							    maxlength: 10
							},

						

							password: {
								required: true,
								minlength: 6
							},

							confirmPassword: {
								required: true,
								equalTo: "#password"
							}

						},

						messages: {

							fullName: {
								required: "Please enter your full name",
								minlength: "Minimum 3 characters required"
							},

							email: {
								required: "Please enter your email",
								email: "Enter a valid email"
							},

							mobileNo: {
							    required: "Please enter mobile number",
							    digits: "Only digits allowed",
							    minlength: "Mobile must be 10 digits",
							    maxlength: "Mobile must be 10 digits"
							},

							

							password: {
								required: "Please enter password",
								minlength: "Password must be at least 6 characters"
							},

							confirmPassword: {
								required: "Please confirm password",
								equalTo: "Passwords do not match"
							}

						},

						errorElement: "small",

					

						highlight: function (element) {
							$(element).css("border-color", "#dc3545");
						},

						unhighlight: function (element) {
							$(element).css("border-color", "#28a745");
						},

						submitHandler: function (form) {

							$(".btn-text").text("Creating...");
							$(".loader").show();
							$(".register-btn").prop("disabled", true);

							form.submit();
						}

					});

				});
			</script>
		</body>

		</html>