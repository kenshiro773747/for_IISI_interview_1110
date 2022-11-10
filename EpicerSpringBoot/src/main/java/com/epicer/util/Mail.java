package com.epicer.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class Mail {
	
 @Autowired
 JavaMailSender mailSender;
 
 public void sendToGmail() {
  SimpleMailMessage message = new SimpleMailMessage();  
  
  message.setTo("eeit4902@gmail.com");
  message.setSubject("測試透過 Gmail 去發信");
  message.setText("org.springframework.mail.SimpleMailMessage 透過 Gmail 發信。");
  
  mailSender.send(message);
 }
 
 public void forumSendToGmail(String mail) {
	  SimpleMailMessage message = new SimpleMailMessage();  
	  
	  message.setTo(mail);
	  message.setSubject("您的文章被檢舉");
	  message.setText("org.springframework.mail.SimpleMailMessage 透過 Gmail 發信。");
	  
	  mailSender.send(message);
	 }
 
 public void courseSendToGmail(String mail) {
	  SimpleMailMessage message = new SimpleMailMessage();  
	  
	  message.setTo(mail);
	  message.setSubject("感謝您的報名Epice-ER 課程! ");
	  message.setText("學員您好：課程已報名成功! 我們上課見囉!!!~ ٩(ˊᗜˋ )و ");
	  
	  mailSender.send(message);
	 }
}
