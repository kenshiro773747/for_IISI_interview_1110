package com.epicer.config;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import freemarker.ext.jsp.TaglibFactory;

@Configuration
//@EnableWebMvc  可省略
//@ComponentScan(basePackages = {"com.epicer."}) 預設此路徑下開始掃描，所以可省略
public class WebAppConfig implements WebMvcConfigurer {
	

	@Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;
	
	
	@Override
	//放行靜態資源
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/999/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		
		//css
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/HelloTeacher/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/reciperesult/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/users/css/**").addResourceLocations("/WEB-INF/resources/css/");
		
		//images
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/queryByCourseStyle/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/HelloTeacher/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/users/images/**").addResourceLocations("/WEB-INF/resources/images/");	
		
		//js
		registry.addResourceHandler("/HelloTeacher/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/users/js/**").addResourceLocations("/WEB-INF/resources/js/");
		
		//assets
		registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("changepassword/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("changepassword/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("changepassword/source/**").addResourceLocations("/WEB-INF/resources/source/");
		registry.addResourceHandler("admin/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("admin/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("admin/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("admin/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/queryByCourseStyle/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/HelloTeacher/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/reciperesult/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/recipeForUpdate/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/to/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/images/recipeSteps/**").addResourceLocations("/WEB-INF/resources/images/recipeSteps/");
		registry.addResourceHandler("/reciperesult/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/reciperesult/source/**").addResourceLocations("/WEB-INF/resources/source/");
		registry.addResourceHandler("/userCollection/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/userCollection/source/**").addResourceLocations("/WEB-INF/resources/source/");
		registry.addResourceHandler("/recipeForUpdate/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/users/assets**").addResourceLocations("/WEB-INF/resources/assets/");

		//註冊for前台頁面
		registry.addResourceHandler("/recipeForUpdate/source/**").addResourceLocations("/WEB-INF/resources/source/");
		registry.addResourceHandler("/source/**").addResourceLocations("/WEB-INF/resources/source/");
		registry.addResourceHandler("/users/source/**").addResourceLocations("/WEB-INF/resources/source/");
	}

	@Bean
	//使用json格式
	public MappingJackson2JsonView myjsonview() {
		MappingJackson2JsonView myjsonview = new MappingJackson2JsonView();
		myjsonview.setPrettyPrint(true);
		return myjsonview;
	}
	
//	@Override  ///沒用或是我不會用
//	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/admin/index").setViewName("welcome");
//		registry.addViewController("/index").setViewName("index");
//	}
//	
	
	

	@Bean
	public CharacterEncodingFilter characterEncodingFilter(){
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		return filter;
	}
	
	
	/**
     *  
     *    加入 spring-security-taglibs 對 FreeMarker 的支援
     */
    @PostConstruct    
    public void freeMarkerConfigurer() {
        List<String> tlds = new ArrayList<String>();        
        tlds.add("/META-INF/security.tld");
        TaglibFactory taglibFactory = freeMarkerConfigurer.getTaglibFactory();
        taglibFactory.setClasspathTlds(tlds);
        if(taglibFactory.getObjectWrapper() == null) {
            taglibFactory.setObjectWrapper(freeMarkerConfigurer.getConfiguration().getObjectWrapper());
        }
    }
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addRedirectViewController("/",	"redirect:/recipe" );
		registry.addViewController("to/add").setViewName("recipe/AddPage");
		
	}
	
	
//	@Bean
//	public CharacterEncodingFilter characterEncodingFilter(){
//		CharacterEncodingFilter filter = new CharacterEncodingFilter();
//		filter.setEncoding("UTF-8");
//		filter.setForceEncoding(true);
//		return filter;
//	}


}

