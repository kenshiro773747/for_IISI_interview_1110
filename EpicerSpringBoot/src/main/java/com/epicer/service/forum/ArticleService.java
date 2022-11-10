package com.epicer.service.forum;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleUserBean;

@Service
@Transactional
public class ArticleService {

	@Autowired
	private ArticleRepository aRepo;

	public ArticleBean findByArticleId(int articleId) {
		Optional<ArticleBean> op = aRepo.findById(articleId);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public List<ArticleBean> findByStatus(int articlestatus) {
		return aRepo.findAllByStatus(articlestatus);
	}
	
	
	
	public List<ArticleBean> findByUser(ArticleUserBean userId) {
		return aRepo.findAllByUser(userId);
	}

	public List<ArticleBean> findByTitleLike(String title) {
		return aRepo.findAllByTitleLike(title);
	}

	public List<ArticleBean> findByCategory(int id) {
		return aRepo.findAllByPlateformCategoryId(id);
	}

	public List<ArticleBean> findAll() {
		return aRepo.findAll();
	}

	public ArticleBean insert(ArticleBean articleBean) {
		return aRepo.save(articleBean);
	}

	public void deleteById(Integer id) {
		aRepo.deleteById(id);
	}
	
	public void updateReport(int status,int articleid) {
		aRepo.updateReport(status, articleid);
	}

	public void insertReport(int status,int articleid) {
		aRepo.insertReport(status, articleid);
	}
	
	public int CountLike(int articleId) {
		return aRepo.countLike(articleId);
	}
	
	public void updateLike(int articlelike,int articleId) {
		aRepo.updateLike(articlelike, articleId);
	}
	
	public void updateViews(int articleViews,int articleId) {
		aRepo.updateViews(articleViews, articleId);
	}
	
	public int CountReply(int articleId) {
		return aRepo.countReply(articleId);
	}
	public void updateCountReply(int articlereplys,int articleId) {
		aRepo.updateCountReply(articlereplys, articleId);
	}
	
	
	////////////////////////////Front
	
	public List<ArticleBean> frontFindByStatus() {
		return aRepo.frontFindAllByStatus(0);
	}
	
	public List<ArticleBean> frontFindAllByPlateformCategoryId(int id) {
		return aRepo.frontFindAllByPlateformCategoryId(id,0);
	}
	
	public List<ArticleBean> frontFindAllByTitleLike(String title) {
		return aRepo.frontFindAllByTitleLike(title,0);
	}
	
}
