<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>




<%@ include file="../home/home_Header.jsp" %>



<style>
	
	
	.text-danger {
	    display: block;
	    color: #dc3545;
	    font-size: 13px;
	    margin-top: 5px;
	}

	.input-error {
	    border: 1px solid #dc3545 !important;
	    background-color: #fff8f8;
	}

	input:focus.input-error,
	select:focus.input-error,
	textarea:focus.input-error {
	    outline: none;
	    box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.1);
	}
	
</style>






<!-- Success Message -->
<c:if test="${not empty successMessage}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: '${successMessage}',
            confirmButtonText: 'OK'
        });
    </script>
</c:if>


<!-- Error Message -->
<c:if test="${not empty errorMessage}">
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '${errorMessage}',
            confirmButtonText: 'OK'
        });
    </script>
</c:if>






<!-- =====================================================
     CONTACT PAGE CONTENT
     ===================================================== -->

<section class="contact-page">

<!-- ================= CONTACT BANNER ================= -->

<section class="contact-banner">

    <div class="contact-banner-content">

        <h1>Contact Digital Account Gateway</h1>

        <p>
            We're here to help you with your digital banking journey
        </p>

    </div>

</section>


<!-- ================= CONTACT CONTENT ================= -->

<div class="contact-container">


    <!-- Section Heading -->

    <div class="contact-heading">

        <span class="contact-subtitle">
            GET IN TOUCH
        </span>

        <h2>
            How Can We Help You?
        </h2>

        <p>
            Have a question about our banking services, account
            opening, or KYC process? Our team is ready to assist you.
        </p>

    </div>


    <!-- ================= CONTACT GRID ================= -->

    <div class="contact-grid">


        <!-- ================= CONTACT INFORMATION ================= -->

        <div class="contact-info">


            <div class="contact-info-header">

                <span class="contact-info-subtitle">
                    CONTACT INFORMATION
                </span>

                <h2>
                    Let's Talk
                </h2>

                <p>
                    Reach out to us through any of the following
                    channels. Our support team will be happy to help.
                </p>

            </div>


            <!-- Address -->

            <div class="contact-info-item">

                <div class="contact-info-icon">
                    📍
                </div>

                <div>

                    <h3>
                        Our Office
                    </h3>

                    <p>
                        Digital Account Gateway Tower,<br>
                        Business District,<br>
                        Pune, Maharashtra, India
                    </p>

                </div>

            </div>


            <!-- Phone -->

            <div class="contact-info-item">

                <div class="contact-info-icon">
                    📞
                </div>

                <div>

                    <h3>
                        Phone
                    </h3>

                    <p>
                        +91 1800 123 4567
                    </p>

                </div>

            </div>


            <!-- Email -->

            <div class="contact-info-item">

                <div class="contact-info-icon">
                    ✉️
                </div>

                <div>

                    <h3>
                        Email
                    </h3>

                    <p>
                        support@smartbank.com
                    </p>

                </div>

            </div>


            <!-- Working Hours -->

            <div class="contact-info-item">

                <div class="contact-info-icon">
                    🕐
                </div>

                <div>

                    <h3>
                        Support Hours
                    </h3>

                    <p>
                        Monday – Sunday<br>
                        24×7 Customer Support
                    </p>

                </div>

            </div>


        </div>


        <!-- ================= CONTACT FORM ================= -->

        <div class="contact-form-card">

            <div class="contact-form-heading">

                <h2>
                    Send Us a Message
                </h2>

                <p>
                    Fill out the form below and our team will get
                    back to you shortly.
                </p>

            </div>


            <form id="contactForm" action="/customer_leads" method="post">


                <!-- Name -->

                <div class="contact-form-group">

                    <label for="name">
                        Full Name
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your full name"
                        required>

                </div>


                <!-- Email -->

                <div class="contact-form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter your email address"
                        required>

                </div>


                <!-- Mobile -->

                <div class="contact-form-group">

                    <label for="mobile">
                        Mobile Number
                    </label>

                    <input
                        type="tel"
                        id="mobile"
                        name="mobile"
                        placeholder="Enter your mobile number"
                        maxlength="10"
                        required>

                </div>


                <!-- Subject -->

                <div class="contact-form-group">

                    <label for="subject">
                        Subject
                    </label>

                    <select
                        id="subject"
                        name="subject"
                        required>

                        <option value="">
                            Select a subject
                        </option>

                        <option value="account">
                            Account Opening
                        </option>

                        <option value="kyc">
                            KYC Assistance
                        </option>

                        <option value="banking">
                            Banking Services
                        </option>

                        <option value="technical">
                            Technical Support
                        </option>

                        <option value="other">
                            Other
                        </option>

                    </select>

                </div>


                <!-- Message -->

                <div class="contact-form-group">

                    <label for="message">
                        Message
                    </label>

                    <textarea
                        id="message"
                        name="message"
                        rows="5"
                        placeholder="Write your message here..."
                        required></textarea>

                </div>


                <!-- Submit -->

                <button
                    type="submit"
                    class="contact-submit-btn">

                    Send Message

                    <span>→</span>

                </button>

            </form>

        </div>

    </div>


    <!-- ================= QUICK HELP ================= -->

    <section class="contact-help">

        <div class="contact-help-content">

            <div>

                <span class="contact-help-subtitle">
                    NEED IMMEDIATE ASSISTANCE?
                </span>

                <h2>
                    We're Available 24×7
                </h2>

                <p>
                    Our customer support team is always available
                    to assist you with your banking needs.
                </p>

            </div>

            <a
                href="tel:+9118001234567"
                class="contact-help-btn">

                Call Us Now

            </a>

        </div>

    </section>


</div>

</section>



<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- jQuery Validation Plugin -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.21.0/dist/jquery.validate.min.js"></script>





<script>

$(document).ready(function () {

    $("#contactForm").validate({

        rules: {

            name: {
                required: true,
                minlength: 3
            },

            email: {
                required: true,
                email: true
            },

            mobile: {
                required: true,
                digits: true,
                minlength: 10,
                maxlength: 10
            },

            subject: {
                required: true
            },

            message: {
                required: true,
                minlength: 10
            }
        },

        messages: {

            name: {
                required: "Please enter your full name",
                minlength: "Name must be at least 3 characters"
            },

            email: {
                required: "Please enter your email address",
                email: "Please enter a valid email address"
            },

            mobile: {
                required: "Please enter your mobile number",
                digits: "Mobile number must contain only digits",
                minlength: "Mobile number must be 10 digits",
                maxlength: "Mobile number must be 10 digits"
            },

            subject: {
                required: "Please select a subject"
            },

            message: {
                required: "Please enter your message",
                minlength: "Message must be at least 10 characters"
            }
        },

        errorClass: "text-danger",

        errorElement: "span",

        highlight: function (element) {
            $(element).addClass("input-error");
        },

        unhighlight: function (element) {
            $(element).removeClass("input-error");
        }

    });

});

</script>



<%@ include file="../home/home_Footer.jsp" %>

