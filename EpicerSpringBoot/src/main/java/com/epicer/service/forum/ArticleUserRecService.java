package com.epicer.service.forum;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleCollectRecBean;
import com.epicer.model.forum.ArticleReplyBean;


@Service
@Transactional
public class ArticleUserRecService{

	@Autowired
	private ArticleUserRecRepository aurRepo;

	public ArticleCollectRecBean insert(ArticleCollectRecBean rec) {
		return  aurRepo.save(rec);
	}

	public void delete(int aid,int id) {
		aurRepo.delete(aid,id);
	}
	
	public List<ArticleCollectRecBean> findRec(int userid) {
		// TODO Auto-generated method stub
		return  aurRepo.findAllByUser(userid);
	}

	public String statusRec(int aid,int id) {
		return  aurRepo.collectStatus(aid, id);
	}
	




	

	

}
