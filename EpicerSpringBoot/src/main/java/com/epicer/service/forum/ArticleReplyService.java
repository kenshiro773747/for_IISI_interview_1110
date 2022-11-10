package com.epicer.service.forum;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleReplyBean;
import com.epicer.model.forum.ArticleUserBean;




@Service
@Transactional
public class ArticleReplyService{
	
	@Autowired
	private ArticleReplyRepository arRepo;
	
	public ArticleReplyBean findById(int replyId) {
		Optional<ArticleReplyBean> op = arRepo.findById(replyId);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public List<ArticleReplyBean> findAllByUserId(ArticleUserBean UserId){
		return arRepo.findAllByUser(UserId);
	}
	
	public List<ArticleReplyBean> findAllByStatus(int status){
		return arRepo.findAllByStatus(status);
	}
	
	public List<ArticleReplyBean> findAllByArticleId(ArticleBean id){
		return arRepo.findAllByArticleId(id);
	}
	
	public int updateobject(String replyContent,long date,int articleReplyId) {
		return arRepo.update(replyContent, date, articleReplyId);
	}


	public ArticleReplyBean insert(ArticleReplyBean articleReplyBean) {
		return arRepo.save(articleReplyBean);
	}


	public void deleteById(int id) {
		arRepo.deleteById(id);
	}

	public void updateReport(int status,int replyId) {
		arRepo.updateReport(status, replyId);
	}
	
	public void insertReport(int status,int replyId) {
		arRepo.insertReport(status, replyId);
	}
	
	public List<ArticleReplyBean> frontFindAllByArticleId(ArticleBean id){
		return arRepo.frontFindAllByArticleId(id);
	}
	

}
