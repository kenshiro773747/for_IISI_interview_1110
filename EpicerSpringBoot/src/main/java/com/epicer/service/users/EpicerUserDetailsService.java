package com.epicer.service.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.UserRoleAuthorizationInterceptor;

import com.epicer.model.users.EpicerUser;
import com.epicer.model.users.UserRespostity;

@Service
public class EpicerUserDetailsService implements UserDetailsService {

	
	@Autowired
	private  ManagementService ms;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		 EpicerUser user = ms.findByAccount2(username);
		 if(user == null  ||user.getStatus()==4) { //帳號不存在
			return null;
		 }else if(user.getStatus()==1||user.getStatus()==3) {
			 return new org.springframework.security.core.userdetails.
			User(user.getAccount(),user.getPassword(),AuthorityUtils.commaSeparatedStringToAuthorityList("user"));
		 }else {
			 return 	 new org.springframework.security.core.userdetails.
					 User(user.getAccount(),user.getPassword(),AuthorityUtils.commaSeparatedStringToAuthorityList("admin"));
		 }
	}
	

}
