package com.epicer.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.epicer.model.users.EpicerUser;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;

import freemarker.template.Template;

import org.springframework.stereotype.Service;
import org.w3c.tidy.Tidy;
import org.xhtmlrenderer.pdf.ITextRenderer;

import javax.annotation.Resource;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;

@Service
public class PDFFreeMakerUtil {
	
	 @Autowired
	    private FreeMarkerConfigurer freeMarkerConfigurer;

	 
	    private Tools tools =new Tools();

	  public ByteArrayInputStream exportPdf(String templatename,EpicerUser user) throws Exception {
		  HashMap<String, Object> models = new HashMap<>();
		  String scity = tools.getCityName(user.getCity()); //城市
		  String birth = tools.getStringDate(user.getBirth()); //生日
		  int age = tools.getAge(user.getBirth()); //年齡
		  String gender = tools.getGenderName(user.getGender()); //性別
          models.put("user",user);
          System.out.println(user.getId());
          Template template = freeMarkerConfigurer.getConfiguration().getTemplate(templatename);
          String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, models);
          String content = convertToXhtml(text);
//	        Context context = new Context();
//	        context.setVariable("user", user);
//	        String content = convertToXhtml(templateEngine.process(templatename, context));

	        ByteArrayInputStream byteArrayInputStream = null;
	        try {
	            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
	            ITextRenderer renderer = new ITextRenderer();
	            renderer.getFontResolver().addFont("c:/Windows/Fonts/simsun.ttc", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	            renderer.setDocumentFromString(content);
	            renderer.layout();
	            renderer.createPDF(byteArrayOutputStream, false);
	            renderer.finishPDF();
	            byteArrayInputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
	        } catch (DocumentException e) {
	          e.printStackTrace();
	        }

	        return byteArrayInputStream;
	    }

	    private String convertToXhtml(String htmlContent) throws UnsupportedEncodingException {
	        Tidy tidy = new Tidy();
	        tidy.setInputEncoding("UTF-8");
	        tidy.setOutputEncoding("UTF-8");
	        tidy.setXHTML(true);
	        ByteArrayInputStream inputStream = new ByteArrayInputStream(htmlContent.getBytes(StandardCharsets.UTF_8));
	        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	        tidy.parseDOM(inputStream, outputStream);
	        String result = outputStream.toString("UTF-8");
	        return result;
	    }

	}