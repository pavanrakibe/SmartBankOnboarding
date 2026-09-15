package com.smartbank.util;


import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.internet.MimeMessage;

@Component
public class EmailUtil {

    @Autowired
    private JavaMailSender mailSender;
    
    


    // =========================================================
    // KYC COMPLETION EMAIL
    // =========================================================

    public void sendKycCompletedEmail(
            String toEmail,
            String customerName) {

        try {

            MimeMessage message =
                    mailSender.createMimeMessage();

            MimeMessageHelper helper =
                    new MimeMessageHelper(message, true);


            helper.setTo(toEmail);

            helper.setSubject(
                    "🎉 Digital Account Gateway KYC Submitted Successfully"
            );


            String html = String.format("""
                    
                    <html>
                    <body style="
                        font-family: Arial, sans-serif;
                        background:#f5f5f5;
                        padding:20px;
                    ">

                        <div style="
                            max-width:600px;
                            margin:auto;
                            background:#ffffff;
                            border-radius:10px;
                            overflow:hidden;
                            box-shadow:0px 2px 10px
                            rgba(0,0,0,0.1);
                        ">

                            <!-- HEADER -->

                            <div style="
                                background:#0d6efd;
                                color:white;
                                text-align:center;
                                padding:20px;
                            ">

                                <h2>🏦 SmartBank</h2>

                                <p>
                                    Digital Banking
                                    Onboarding System
                                </p>

                            </div>


                            <!-- CONTENT -->

                            <div style="padding:30px;">

                                <h3>
                                    Hello, %s 👋
                                </h3>


                                <p>
                                    Congratulations!
                                    Your KYC application has been
                                    successfully submitted to
                                    <b>SmartBank</b>.
                                </p>


                                <table style="
                                    width:100%%;
                                    border-collapse:collapse;
                                    margin-top:20px;
                                ">

                                    <tr>
                                        <td style="padding:10px;">
                                            <b>KYC Status</b>
                                        </td>

                                        <td style="
                                            padding:10px;
                                            color:#ffc107;
                                        ">
                                            🕒 Verification Pending
                                        </td>
                                    </tr>


                                    <tr>
                                        <td style="padding:10px;">
                                            <b>Bank</b>
                                        </td>

                                        <td style="padding:10px;">
                                            SmartBank
                                        </td>
                                    </tr>


                                    <tr>
                                        <td style="padding:10px;">
                                            <b>Application</b>
                                        </td>

                                        <td style="
                                            padding:10px;
                                            color:green;
                                        ">
                                            ✅ Submitted
                                        </td>
                                    </tr>

                                </table>


                                <br>


                                <p>
                                    Our verification team will review
                                    your submitted documents and
                                    information.
                                </p>


                                <p>
                                    You will receive another email
                                    once your KYC verification has
                                    been completed.
                                </p>


                                <div style="
                                    text-align:center;
                                    margin-top:30px;
                                ">

                                    <a href="#"
                                       style="
                                        background:#0d6efd;
                                        color:white;
                                        padding:12px 25px;
                                        text-decoration:none;
                                        border-radius:5px;
                                       ">

                                        View Application Status

                                    </a>

                                </div>


                                <br>


                                <p>
                                    Thank you for choosing
                                    <b>SmartBank</b>.
                                </p>

                            </div>


                            <!-- FOOTER -->

                            <div style="
                                background:#eeeeee;
                                text-align:center;
                                padding:15px;
                                font-size:12px;
                                color:#555;
                            ">

                                © 2026 SmartBank.
                                All Rights Reserved.

                            </div>

                        </div>

                    </body>
                    </html>
                    
                    """, customerName);


            helper.setText(html, true);

            mailSender.send(message);


            System.out.println(
                    "KYC completion email sent successfully to: "
                    + toEmail
            );


        } catch (Exception e) {

            System.err.println(
                    "Failed to send KYC completion email to: "
                    + toEmail
            );

            e.printStackTrace();

        }
    }
    
    
    
    
    
    
    
 
 // =========================================================
 // CONTACT LEAD EMAIL
 // =========================================================

 public void sendContactLeadEmail(
         String toEmail,
         String customerName) {

     try {

         MimeMessage message =
                 mailSender.createMimeMessage();

         MimeMessageHelper helper =
                 new MimeMessageHelper(message, true);


         helper.setTo(toEmail);

         helper.setSubject(
                 "📩 Digital Account Gateway - Request Submitted Successfully"
         );


         String html = String.format("""

                 <html>
                 <body style="
                     font-family: Arial, sans-serif;
                     background:#f5f5f5;
                     padding:20px;
                 ">

                     <div style="
                         max-width:600px;
                         margin:auto;
                         background:#ffffff;
                         border-radius:10px;
                         overflow:hidden;
                         box-shadow:0px 2px 10px
                         rgba(0,0,0,0.1);
                     ">


                         <!-- HEADER -->

                         <div style="
                             background:#0d6efd;
                             color:white;
                             text-align:center;
                             padding:20px;
                         ">

                             <h2>🏦 Digital Account Gateway</h2>

                             <p>
                                 Digital Banking
                                 Onboarding System
                             </p>

                         </div>


                         <!-- CONTENT -->

                         <div style="padding:30px;">

                             <h3>
                                 Hello, %s 👋
                             </h3>


                             <p>
                                 Thank you for contacting
                                 <b>Digital Account Gateway</b>.
                             </p>


                             <p>
                                 Your request has been
                                 <b>successfully submitted</b>.
                             </p>


                             <table style="
                                 width:100%%;
                                 border-collapse:collapse;
                                 margin-top:20px;
                             ">

                                 <tr>

                                     <td style="padding:10px;">
                                         <b>Request Status</b>
                                     </td>

                                     <td style="
                                         padding:10px;
                                         color:#198754;
                                     ">
                                         ✅ Submitted Successfully
                                     </td>

                                 </tr>


                                 <tr>

                                     <td style="padding:10px;">
                                         <b>Bank</b>
                                     </td>

                                     <td style="padding:10px;">
                                         Digital Account Gateway
                                     </td>

                                 </tr>


                                 <tr>

                                     <td style="padding:10px;">
                                         <b>Support Team</b>
                                     </td>

                                     <td style="padding:10px;">
                                         Digital Account Gateway Customer Support
                                     </td>

                                 </tr>

                             </table>


                             <br>


                             <p>
                                 Our support team will review your
                                 request and get back to you as soon
                                 as possible.
                             </p>


                             <p>
                                 Please keep this email for your
                                 records.
                             </p>


                             <div style="
                                 text-align:center;
                                 margin-top:30px;
                             ">

                                 <div style="
                                     display:inline-block;
                                     background:#0d6efd;
                                     color:white;
                                     padding:12px 25px;
                                     border-radius:5px;
                                 ">

                                     Request Received ✓

                                 </div>

                             </div>


                             <br>


                             <p>
                                 Thank you for choosing
                                 <b>Digital Account Gateway</b>.
                             </p>

                         </div>


                         <!-- FOOTER -->

                         <div style="
                             background:#eeeeee;
                             text-align:center;
                             padding:15px;
                             font-size:12px;
                             color:#555;
                         ">

                             © 2026 Digital Account Gateway.
                             All Rights Reserved.

                         </div>

                     </div>

                 </body>
                 </html>

                 """, customerName);


         helper.setText(html, true);

         mailSender.send(message);


         System.out.println(
                 "Contact lead email sent successfully to: "
                 + toEmail
         );


     } catch (Exception e) {

         System.err.println(
                 "Failed to send contact lead email to: "
                 + toEmail
         );

         e.printStackTrace();

     }
 }


    
 
 
 
 
 
 
 
 
 
//=========================================================
//BANK ACCOUNT CREATED EMAIL
//=========================================================

public void sendBankAccountCreatedEmail(
      String toEmail,
      String customerName,
      String accountNumber,
      String accountType,
      BigDecimal balance,
      String branch,
      String ifscCode) {

  try {

      MimeMessage message =
              mailSender.createMimeMessage();

      MimeMessageHelper helper =
              new MimeMessageHelper(message, true);


      // -------------------------------------------------
      // Recipient
      // -------------------------------------------------

      helper.setTo(toEmail);


      // -------------------------------------------------
      // Subject
      // -------------------------------------------------

      helper.setSubject(
              "🎉 Your SmartBank Account Has Been Created Successfully"
      );


      // -------------------------------------------------
      // HTML Email
      // -------------------------------------------------

      String html = String.format("""

              <html>

              <body style="
                  font-family: Arial, sans-serif;
                  background:#f5f5f5;
                  padding:20px;
              ">

                  <div style="
                      max-width:650px;
                      margin:auto;
                      background:#ffffff;
                      border-radius:10px;
                      overflow:hidden;
                      box-shadow:0px 2px 10px
                      rgba(0,0,0,0.1);
                  ">


                      <!-- HEADER -->

                      <div style="
                          background:#0d6efd;
                          color:white;
                          text-align:center;
                          padding:25px;
                      ">

                          <h2>🏦 Digital Account Gateway</h2>

                          <p>
                              Digital Banking
                              Onboarding System
                          </p>

                      </div>


                      <!-- CONTENT -->

                      <div style="padding:30px;">

                          <h3>
                              Hello, %s 👋
                          </h3>


                          <p>
                              Congratulations!
                          </p>


                          <p>
                              Your bank account has been
                              <b>successfully created</b>
                              by our administration team.
                          </p>


                          <p>
                              You can now access your bank
                              account from your customer dashboard.
                          </p>


                          <!-- ACCOUNT DETAILS -->

                          <h3 style="
                              margin-top:25px;
                              color:#0d6efd;
                          ">
                              Account Details
                          </h3>


                          <table style="
                              width:100%%;
                              border-collapse:collapse;
                              margin-top:15px;
                              border:1px solid #ddd;
                          ">

                              <tr>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      <b>Account Number</b>
                                  </td>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      %s
                                  </td>

                              </tr>


                              <tr>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      <b>Account Type</b>
                                  </td>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      %s
                                  </td>

                              </tr>


                              <tr>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      <b>Initial Balance</b>
                                  </td>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      ₹ %s
                                  </td>

                              </tr>


                              <tr>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      <b>Branch</b>
                                  </td>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      %s
                                  </td>

                              </tr>


                              <tr>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      <b>IFSC Code</b>
                                  </td>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      %s
                                  </td>

                              </tr>


                              <tr>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                  ">
                                      <b>Account Status</b>
                                  </td>

                                  <td style="
                                      padding:12px;
                                      border:1px solid #ddd;
                                      color:#198754;
                                  ">
                                      <b>✅ ACTIVE</b>
                                  </td>

                              </tr>

                          </table>


                          <br>


                          <p>
                              Your KYC verification was completed
                              successfully and your bank account
                              is now active.
                          </p>


                          <p>
                              Please keep your account number and
                              banking information secure.
                          </p>


                          <div style="
                              background:#fff3cd;
                              border:1px solid #ffe69c;
                              padding:15px;
                              border-radius:5px;
                              margin-top:20px;
                          ">

                              <b>🔐 Security Notice</b>

                              <p style="margin-bottom:0;">

                                  Never share your password,
                                  OTP, PIN or other confidential
                                  banking credentials with anyone.

                              </p>

                          </div>


                          <div style="
                              text-align:center;
                              margin-top:30px;
                          ">

                              <div style="
                                  display:inline-block;
                                  background:#198754;
                                  color:white;
                                  padding:12px 25px;
                                  border-radius:5px;
                              ">

                                  ✅ Account Created Successfully

                              </div>

                          </div>


                          <br>


                          <p>
                              Thank you for choosing
                              <b>Digital Account Gateway</b>.
                          </p>

                      </div>


                      <!-- FOOTER -->

                      <div style="
                          background:#eeeeee;
                          text-align:center;
                          padding:15px;
                          font-size:12px;
                          color:#555;
                      ">

                          © 2026 Digital Account Gateway.
                          All Rights Reserved.

                      </div>

                  </div>

              </body>

              </html>

              """,
              customerName,
              accountNumber,
              accountType,
              balance,
              branch,
              ifscCode
      );


      // -------------------------------------------------
      // Send HTML Email
      // -------------------------------------------------

      helper.setText(html, true);

      mailSender.send(message);


      System.out.println(
              "Bank account created email sent successfully to: "
              + toEmail
      );


  } catch (Exception e) {

      System.err.println(
              "Failed to send bank account created email to: "
              + toEmail
      );

      e.printStackTrace();

  }
}
    
    
    
}