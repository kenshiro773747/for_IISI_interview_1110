package com.epicer.util;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.epicer.model.cart.OrderProduct;
import com.epicer.model.users.EpicerUser;

import freemarker.template.Template;


@Service
public class MailTemplateUtil {
	
	@Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    public void sendMessageWithFreemarkerTemplate(String tempName,EpicerUser user) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper mailsender = new MimeMessageHelper(message, true,"UTF-8");
            mailsender.setTo(user.getAccount());
            mailsender.setSubject("【Epicer 歡迎您】"+" "+"您好"+" "+user.getName());

            HashMap<String, Object> models = new HashMap<>();
            models.put("name","freemarker");
            models.put("vertify",user);
            System.out.println(user.getId());
            Template template = freeMarkerConfigurer.getConfiguration().getTemplate(tempName);
            String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, models);
            
            mailsender.setText(text,true);
            javaMailSender.send(message);
            System.out.println("sucess!");
        } catch (Exception ex) {
        	System.out.println("出示了阿北");
        }
    }
    
    //Order email
    public void sendMessageWithOrder(String tempName,OrderProduct order) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper mailsender = new MimeMessageHelper(message, true,"UTF-8");
            mailsender.setTo(order.getOrderEmail());
            mailsender.setSubject("【Epicer 訂購通知】"+" "+"您好"+" "+order.getOrderName());

            HashMap<String, Object> models = new HashMap<>();
            models.put("name","freemarker");
            System.out.println(order.getMerchantTradeNo());  
            models.put("orderid",order.getMerchantTradeNo());
            models.put("orderdate",order.getMerchantTradeDate());
            models.put("ordername",order.getOrderName());
            models.put("orderphone",order.getOrderPhone());
            models.put("orderaddress",order.getOrderAddress());
            models.put("orderamount",order.getProductTotalQuantity());
            models.put("ordertotal",order.getProductTotalPrice());
            System.out.println(order.getOrderName());
            Template template = freeMarkerConfigurer.getConfiguration().getTemplate(tempName);
            String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, models);
            
            mailsender.setText(text,true);
            javaMailSender.send(message);
            System.out.println("sucess!");
        } catch (Exception ex) {
        	System.out.println("出示了阿北");
        }
    }
    
    
}
