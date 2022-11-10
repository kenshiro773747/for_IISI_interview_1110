package com.epicer.config;

import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

@Configuration
public class WebServerAutoConfiguration {

	
	
	@Bean
	public ConfigurableServletWebServerFactory errorPage() {
		TomcatServletWebServerFactory factory = new TomcatServletWebServerFactory();
		ErrorPage forbidden = new ErrorPage(HttpStatus.FORBIDDEN,"/error/404");
		factory.addErrorPages(forbidden);
		return factory;
	}
}
