package com.epicer.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.epicer.model.users.EpicerUser;


@Service
public class MailUtil {

	@Autowired
	 JavaMailSender mailSender;
	 
	 
	 public void sendToGmail(EpicerUser user) {
	  SimpleMailMessage message = new SimpleMailMessage();  
	  message.setTo(user.getAccount());
	  Map<String, String> map = this.welcomeform(user);
	  message.setSubject(map.get("subject"));
	  message.setText(map.get("body"));
	  mailSender.send(message);
	  System.out.println("mail sended successful!");
	 }
	 
	 public Map<String,String> welcomeform(EpicerUser user) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("subject","歡迎加入我們!");
		String body="親愛的"+" "+user.getName()+"恭喜您已註冊成功，"
				+ "歡迎您加入Epicer，成為我們的會員!現在只要使用您的帳號綁定行動支付，"
				+ "單筆消費每滿35元即可獲贈1點(70元2顆星…以此類推，不足35元的金額恕不累計計算)，"
				+ "您可由網站，或使用行動APP登入您的帳號(即您在註冊時所使用的電子信箱)，隨時查詢您的會員資訊及回饋內容。";
		map.put("body",body);
		return map;
	 }
	 
	 
	}
