package com.epicer.model.users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.epicer.service.users.ManagementService;

@Component
public class SucessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private ManagementService management;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
				User user = (User) authentication.getPrincipal();
				String account = user.getUsername();
				System.out.println(account); //有東西
				System.out.println(user.getAuthorities().toString());
				EpicerUser authority = management.findByAccount2(account);
				if(authority.getStatus()==1) {
					EpicerUser users = authority;
					request.getSession().setAttribute("user",users);
				//	request.getRequestDispatcher("/turn").forward(request, response);
					request.getRequestDispatcher("/users/checkuserstatus").forward(request, response);
				}else if(authority.getStatus()==0) {
					EpicerUser admin = authority;
					request.getSession().setAttribute("admin", admin);
					request.getRequestDispatcher("/admin/checkadminstatus2").forward(request, response);
				}else if(authority.getStatus()==3) { //可以鎖權限
					EpicerUser users = authority;
					request.getSession().setAttribute("user",users);
					request.getRequestDispatcher("/users/checkuserstatus").forward(request, response);
				}else {
					request.getRequestDispatcher("/index").forward(request, response);
				}
			}
	}

