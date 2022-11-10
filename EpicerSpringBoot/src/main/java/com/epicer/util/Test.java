package com.epicer.util;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.epicer.model.users.DemoUser;
import com.epicer.model.users.DeomUserRespostity;
import com.epicer.model.users.EpicerUser;
import com.epicer.model.users.UserRespostity;

import ch.qos.logback.core.util.Duration;

public class Test {

	private static Tools tools = new Tools();
	
	
//    private static BCryptPasswordEncoder bc =new BCryptPasswordEncoder();
	

	public static void main(String[] args) {
		String str = tools.getStringDate(548524800000L);
		System.out.println(str);
//		String encode = bc.encode("0102");
//		System.out.println(encode);
//		boolean result = bc.matches("0102", "$2a$10$m/rIse0DKx0M/hixi2RGw.XcDkxrSfggOz62LjpicFy8Ff54qHnTu");
//		System.out.println(result);
		PasswordEncoder pe= new BCryptPasswordEncoder();
		String result = pe.encode("asdf1234");
		System.out.println(result);
		boolean matches = pe.matches("1234",result);
		System.out.println(matches);
		String result2 = pe.encode("yeah860102");
		System.out.println(result2);
		boolean matches2 = pe.matches("thpeeit4949","$2a$10$aFhfU0nzyjtufokCSh4rTOYnzegvYlSutD7xjY3saMqbDINebEdh2");
		System.out.println(matches2);
	}
}
