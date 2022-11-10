package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleReplyBean;
import com.epicer.model.forum.ArticleUserBean;

public interface ArticleReplyRepository extends JpaRepository<ArticleReplyBean, Integer> {

	public List<ArticleReplyBean> findAllByUser(ArticleUserBean id);

	public List<ArticleReplyBean> findAllByArticleId(ArticleBean id);
	
	
	@Modifying
	@Query( value = "update forum_article_reply set articlereplycontent=?1 , articlereplydate=?2 where articlereplyid=?3",nativeQuery = true)
	public int update(String replyContent,long date,int articleReplyId);
	
	@Query( value = "select * from forum_article_reply where articlereplystatus=?1",nativeQuery = true)
	public List<ArticleReplyBean> findAllByStatus(int status);
	
	@Query( value = "select * from forum_article_reply where articleid=?1 and articlereplystatus=0",nativeQuery = true)
	public List<ArticleReplyBean> frontFindAllByArticleId(ArticleBean id);
	
	@Modifying
	@Query( value = "UPDATE forum_article_reply SET articlereplystatus=?1  where articlereplyid=?2",nativeQuery = true)
	public void updateReport(int status,int replyId);
	
	@Modifying
	@Query( value = "UPDATE forum_article_reply SET articlereplystatus=?1  where articlereplyid=?2",nativeQuery = true)
	public void insertReport(int status,int replyId);
	
}
