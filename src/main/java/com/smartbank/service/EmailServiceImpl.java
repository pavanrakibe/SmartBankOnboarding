package com.smartbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;


@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendOtp(String toEmail, String otp) {

        try {

            MimeMessage message = mailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(toEmail);

            helper.setSubject("SmartBank - Password Reset OTP");

            String html = """
            <!DOCTYPE html>
            <html>

            <body style="font-family:Arial;background:#f4f7fb;padding:30px;">

            <table style="max-width:600px;margin:auto;background:white;border-radius:10px;padding:30px;box-shadow:0 5px 15px rgba(0,0,0,.1);">

            <tr>
            <td align="center">

            <h1 style="color:#0056d2;">Smart<span style="color:#00b4d8;">Bank</span></h1>

            <h2>Password Reset OTP</h2>

            <p>Your One Time Password is</p>

            <div style="font-size:35px;
                        font-weight:bold;
                        color:white;
                        background:#0056d2;
                        padding:15px;
                        border-radius:8px;
                        display:inline-block;
                        letter-spacing:5px;">

            """ + otp + """

            </div>

            <p style="margin-top:25px;">
            This OTP is valid for
            <b>1 minute</b>.
            </p>

            <p>
            Do not share this OTP with anyone.
            </p>

            <hr>

            <p style="font-size:12px;color:gray;">
            © 2026 SmartBank. All rights reserved.
            </p>

            </td>
            </tr>

            </table>

            </body>

            </html>
            """;

            helper.setText(html, true);

            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}