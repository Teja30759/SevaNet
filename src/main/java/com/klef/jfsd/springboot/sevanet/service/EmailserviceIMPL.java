package com.klef.jfsd.springboot.sevanet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailserviceIMPL implements EmailService{

	 @Autowired
	    private JavaMailSender mailSender;

	    public void sendEmail(String[] to, String subject, String body) {
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true);

	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(body, false);

	            mailSender.send(message);
	        } catch (MessagingException e) {
	            throw new IllegalStateException("Failed to send email", e);
	        }
	    }
}
