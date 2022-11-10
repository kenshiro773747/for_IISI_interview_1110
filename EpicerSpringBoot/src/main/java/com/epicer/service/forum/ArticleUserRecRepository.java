package com.epicer.service.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleCollectRecBean;
import com.epicer.model.forum.ArticleReplyBean;

public interface ArticleUserRecRepository extends JpaRepository<ArticleCollectRecBean, Integer> {
	
	
	@Query( value = "select * from forum_article_collect_rec where userid=?1",nativeQuery = true)
	public List<ArticleBean> findArticleByUserUserId(int userid);
	
	@Query( value = "select count(*)  from forum_article_collect_rec where articleid=?1 and userid=?2",nativeQuery = true)
	public String collectStatus(int articleId,int userid);
	
	@Modifying
	@Query( value = " DELETE FROM forum_article_collect_rec where articleid = ?1 and userid =?2",nativeQuery = true)
	public void delete(int articleId,int userid);
	
	@Query( value = "SELECT collectarticlerec,userid,articleid From (\r\n"
			+ "	Select collectarticlerec,userid,articleid,\r\n"
			+ "	ROW_NUMBER() Over (Partition By articleid Order By collectarticlerec DESC) As Sort From forum_article_collect_rec where userid=?1) TMP_S\r\n"
			+ "Where TMP_S.Sort=1",nativeQuery = true)
	public List<ArticleCollectRecBean> findAllByUser(int userId);
}
