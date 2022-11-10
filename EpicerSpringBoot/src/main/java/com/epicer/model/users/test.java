package com.epicer.model.users;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class test {

	private BCryptPasswordEncoder bc =new BCryptPasswordEncoder();
	
	public void test() {
		String encode = bc.encode("0102");
		System.out.println(encode);
	}
}
