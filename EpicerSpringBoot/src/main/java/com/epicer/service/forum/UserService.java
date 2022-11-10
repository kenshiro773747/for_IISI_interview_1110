package com.epicer.service.forum;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.forum.ArticleUserBean;

@Service
@Transactional
public class UserService {

	@Autowired
	private forumUserRepository uRepo;

	public ArticleUserBean findByUserId(int userId) {
		Optional<ArticleUserBean> op = uRepo.findById(userId);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
}
