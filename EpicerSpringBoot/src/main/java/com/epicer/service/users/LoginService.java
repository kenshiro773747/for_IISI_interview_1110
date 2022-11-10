package com.epicer.service.users;

import java.util.Date;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epicer.model.users.Message;
import com.epicer.model.users.EpicerUser;
import com.epicer.model.users.UserRespostity;
import com.epicer.util.Tools;


@Service
@Transactional
public class LoginService {
	@Autowired
private UserRespostity ur;
	
	private Tools tools =new Tools();
	
	public LoginService(UserRespostity ur) {
		super();
		this.ur = ur;
	}

	public void test() {
		EpicerUser user = ur.findByAccountAndPassword("emp12345@epicer.com", "emp12345");
		System.out.println(user.getAccount());
		System.out.println(user.getPassword());
	}
	
	
	public Message checkAccount(String account) {
		Message msg = new Message();
		EpicerUser user = ur.checkAccount(account);
		if(user==null) {
			msg.setCode(1);
			msg.setMessage("帳號不存在");
			msg.setObject(account);
		}else if(user.getStatus() == 4){
			msg.setCode(1);
			msg.setMessage("帳號已遭停權，請聯繫管理員");
			msg.setObject(account);
		}else {
			msg.setCode(0);
			msg.setMessage("ok");
			msg.setObject(user);
		}
		return msg;
	}
	
	public Message cheackPassword(String account,String password) {
	   Message msg = new Message();
	   EpicerUser user = ur.checkAccount(account);
	   if(user == null) { //帳號不存在
		   msg.setCode(1);
		   msg.setMessage("帳號不存在");
	   }else { //帳號存在
		   System.out.println(password);
		   boolean result = tools.getComparaion(password,user.getPassword());
		   if(result){
			   msg.setCode(0);
			   msg.setMessage("ok");
		   }else {
			   msg.setCode(1);
			   msg.setMessage("密碼不正確");
		   }
	   }
	   return msg;
	}
	
	
	
	public EpicerUser showIndex(String account) {
		EpicerUser user = ur.checkAccount(account);
		return user;
	}
	
	public EpicerUser updateDate(EpicerUser user) {
		Date date = new Date();
		System.out.println(date);
		user.setLogindate(date.getTime());
		EpicerUser admin =ur.save(user);
		return admin;
	}
	
	
	public EpicerUser selectById(Integer id) {
		Optional<EpicerUser> optional = ur.findById(id);
		return optional.get();
	}
}
