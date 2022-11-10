package com.epicer.config;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.util.ReflectionUtils.DescribedFieldFilter;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.DaoAuthenticationConfigurer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import com.epicer.model.users.Oauth2SucessHandler;
import com.epicer.model.users.SucessHandler;
import com.epicer.model.users.UserRespostity;
import com.epicer.service.users.CustomOAuth2UserService;
import com.epicer.service.users.EpicerUserDetailsService;
import com.epicer.util.MD5Util;


@Component
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	@Autowired
	private EpicerUserDetailsService euds;
	
	@Autowired
	private SucessHandler sh;
	
	@Autowired
	private Oauth2SucessHandler osh;
	
	@Autowired
	private CustomOAuth2UserService oauth2UserService;
	
	
	@Override //建立帳號密碼+權限
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//	auth.inMemoryAuthentication().withUser("admin").password("0102").authorities("/");
	//	auth.inMemoryAuthentication().withUser("admin").password("0102").authorities("admin");
//		auth.inMemoryAuthentication().withUser("teacher").password("0102").authorities("teacher");
		/****要的*****/
		auth.userDetailsService(euds).passwordEncoder(this.passwordEncoder());
		/****要的*****/
	}
	
	
	
	
	
	@Override  //建立角色+授權
	// /** 表示當前路徑下的所有路徑 包含再往下一
	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests().antMatchers("/**").fullyAuthenticated().and().formLogin(); //攔截所有該路徑下的請求，並透過表單驗證
//		http.authorizeRequests()
//		.antMatchers("/index").hasAnyAuthority("user")  //角色:user 權限:/index路徑
//        .antMatchers("/logintest").hasAnyAuthority("teacher") //角色:teacher 權限:/logintest路徑
//        .antMatchers("/login").permitAll() //所有請求都能訪問該路徑 (需先放行登入頁面)
//		.antMatchers("/**").fullyAuthenticated().and().formLogin().loginPage("/login") //設定那些路徑需要經過該頁面
//		.and().csrf().disable();
        
//		http.authorizeRequests()
//.antMatchers("/login").permitAll() //所有請求都能訪問該路徑 (需先放行登入頁面)
//.antMatchers("/admin/**").hasAnyAuthority("admin") //角色:admin 權限:/admin/**路徑
//.antMatchers("/admin/**").fullyAuthenticated().and().formLogin().loginPage("/login").and().csrf().disable(); //設定那些路徑需要經過該頁面
		/******要的*****/
		http.authorizeRequests()
		.antMatchers("/admin/login","/login","/oauth2/**").permitAll()
		.antMatchers("/admin/**").hasAnyAuthority("admin")
		.antMatchers("/users/**").hasAnyAuthority("user")
		.antMatchers().permitAll()
		.anyRequest().permitAll() //除了/admin/**，其他請求都可以訪問
		.and().formLogin().loginPage("/login").successHandler(sh)
		.and().oauth2Login().loginPage("/login").userInfoEndpoint().userService(oauth2UserService)
		.and().successHandler(osh)
		.and().logout().deleteCookies("JSESSIONID").logoutSuccessUrl("/homepage").logoutRequestMatcher(new AntPathRequestMatcher("/all/logout"))
	.and().csrf().disable()
	.rememberMe().rememberMeParameter("remember");

		/******要的*****/
		
		
		/******Google Login*****/
//		   http.authorizeRequests().antMatchers("/google").authenticated()
//		   .anyRequest().permitAll()
//		   .and()
//		   .oauth2Login()
//		   .and().csrf().disable();
		   /******Google Login*****/
				
//		.antMatchers("/admin/login").permitAll()
//		.antMatchers("/admin/**").hasAnyAuthority("admin")
//		.anyRequest().permitAll() //除了/admin/**，其他請求都可以訪問
//		.and()
//		.formLogin().loginPage("/login")
//		.successHandler(new AuthenticationSuccessHandler() {
//			@Override
//			public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//					Authentication authentication) throws IOException, ServletException {
//				User user = (User) authentication.getPrincipal();
//				String account = user.getUsername();
//				System.out.println(account); //有東西
//				request.getSession().setAttribute("account", account);
//				request.getRequestDispatcher("/admin/checkadminstatus2").forward(request, response);
//			}
//		})
//	.and().logout().deleteCookies("JSESSIONID").logoutSuccessUrl("/login").logoutRequestMatcher(new AntPathRequestMatcher("/admin/adminlogout"))
//	.and().csrf().disable()
//	.rememberMe().rememberMeParameter("remember");
	}
	
	
	
	
	
	//明文比對
//	@Bean
//	public static NoOpPasswordEncoder passwordEncoder() {
//		return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
//		
//	}
	
	//加密比對
	@Bean //一定要註冊，因為要交由springboot託管
	public  PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
}
