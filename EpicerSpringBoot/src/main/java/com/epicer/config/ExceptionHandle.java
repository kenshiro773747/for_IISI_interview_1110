package com.epicer.config;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice //概括整個專案的controller,發生自定義的例外事件時，會執行自定義的處理方式
public class ExceptionHandle {

	
	@ExceptionHandler(Exception.class)
	public String exceptionHandle(Exception e) {
//		String errmsg="Exception ocurred";
//		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errmsg);
		System.out.println(e);
		return "frontframeblankpgs/404";
	}
}
