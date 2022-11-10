package com.epicer.service.users;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epicer.model.users.Comment;
import com.epicer.model.users.DemoUser;
import com.epicer.model.users.DeomUserRespostity;
import com.epicer.model.users.EpicerUser;
import com.epicer.model.users.Message;
import com.epicer.model.users.User;
import com.epicer.util.Tools;

@Service
@Transactional
public class DemoUserService {

	
	@Autowired
	private DeomUserRespostity dur;
	
	public Message checkAccount(String account) {
		Message msg = new Message();
		DemoUser result = dur.findByAccount(account);
		if(result != null) {
			msg.setCode(0);
			msg.setMessage("ok");
			msg.setObject(result);
		}else {
			msg.setCode(1);
			msg.setMessage("Not found");
			msg.setObject(result);
		}
		return msg;			
	}
	
	public EpicerUser findByCommentId() {
		try {
			Optional<Comment> optional = dur.findByContentId(1000);
			Comment comment = optional.get();
			EpicerUser user = comment.getUser();
			System.out.println(user.getAccount());
			return user;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
