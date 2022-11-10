package com.epicer.service.forum;




import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.forum.ArticleUserBean;

public interface forumUserRepository extends JpaRepository<ArticleUserBean, Integer> {
	
	

}
