package com.epicer.model.users;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.OAuth2AuthorizationSuccessHandler;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.registration.ClientRegistration;

import com.epicer.service.users.ManagementService;
import com.epicer.service.users.RegisterService;

@Component
public class Oauth2SucessHandler extends SimpleUrlAuthenticationSuccessHandler{
	
	@Autowired
	private OAuth2AuthorizedClientService authorizedClientService;

	@Autowired
	private ManagementService management;
	
	
	@Autowired
	private RegisterService register;


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		CustomOAuth2User oauth2User =(CustomOAuth2User) authentication.getPrincipal();
		String email = oauth2User.getEmail();
		String name = oauth2User.getName();
		System.out.println(email+name);
		EpicerUser user = management.findByAccount2(email);
		if(user == null) {
			EpicerUser newuser = new EpicerUser();
			newuser.setAccount(email);
			newuser.setName(name);
			newuser.setStatus(3);
			newuser.setAvatar("images/default.jpg");
			newuser.setLogindate(new Date().getTime());
			newuser.setNickname("尼還沒有設定唷");
			boolean result = register.InsertClient(newuser);
			System.err.println("新增結果:"+result);
			request.getSession().setAttribute("user",newuser);
//			response.encodeRedirectURL("/users/checkuserstatus");
			request.getRequestDispatcher("/turn").forward(request, response);
		}else if(user.getStatus()==1 ||user.getStatus() ==3){
			System.err.println("登入");
			request.getSession().setAttribute("user",user);
			request.getRequestDispatcher("/turn").forward(request, response);
//			response.encodeRedirectURL("/users/checkuserstatus");
//			request.getRequestDispatcher("/users/checkuserstatus").forward(request, response);
		}else {
			request.getRequestDispatcher("/index").forward(request, response);
		}
	//	super.onAuthenticationSuccess(request, response, authentication);
	}


	
	
}
