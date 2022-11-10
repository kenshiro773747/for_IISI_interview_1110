package com.epicer.model.forum;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "forum_article")
@Component
public class ArticleBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "articleid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int articleId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid")
//	@JsonIgnoreProperties(value="userId")
	private ArticleUserBean user;
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleId",cascade = CascadeType.ALL)
	@JsonIgnore
	private List<ArticleReplyBean> articleReplyId = new ArrayList<ArticleReplyBean>();
	
	@Column(name = "articlecategory", updatable = false)
	private int plateformCategoryId;

	@Column(name = "articletitle")
	private String title;

	@Column(name = "articlecontent")
	private String articleContent;

	@Column(name = "articlestatus")
	private int status;

	@Column(name = "articledate")
	private Long date;

	@Column(name = "articlelike")
	private int articleLike;
	
	@Column(name = "articleviews")
	private int articleViews;
	
	@Column(name = "articlereplys")
	private int articleReplys;
	


	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleId",cascade = CascadeType.ALL)
	@JsonIgnore
	private List<ArticleCollectRecBean> collectArticleRec = new ArrayList<ArticleCollectRecBean>();
	

	public ArticleBean() {
		super();
	}

	public ArticleBean(int plateformCategoryId, String title, String articleContent, Long time,ArticleUserBean userId) {
		super();
		this.title = title;
		this.articleContent = articleContent;
		this.plateformCategoryId = plateformCategoryId;
		this.date = time;
		this.user = userId;
	}

	public ArticleBean(String title, String articleContent) {
		super();
		this.title = title;
		this.articleContent = articleContent;

	}
	

	public ArticleBean(int articleId, ArticleUserBean user, List<ArticleReplyBean> articleReplyId,
			int plateformCategoryId, String title, String articleContent, int status, Long date, int articleLike,
			int articleViews, int articleReplys, List<ArticleCollectRecBean> collectArticleRec) {
		super();
		this.articleId = articleId;
		this.user = user;
		this.articleReplyId = articleReplyId;
		this.plateformCategoryId = plateformCategoryId;
		this.title = title;
		this.articleContent = articleContent;
		this.status = status;
		this.date = date;
		this.articleLike = articleLike;
		this.articleViews = articleViews;
		this.articleReplys = articleReplys;
		this.collectArticleRec = collectArticleRec;
	}

	public List<ArticleCollectRecBean> getCollectArticleRec() {
		return collectArticleRec;
	}

	public void setCollectArticleRec(List<ArticleCollectRecBean> collectArticleRec) {
		this.collectArticleRec = collectArticleRec;
	}

	public ArticleBean(int articleId, ArticleUserBean user, int plateformCategoryId, String title,
			String articleContent, int status, Long date, int articleLike) {
		super();
		this.articleId = articleId;
		this.user = user;
		this.plateformCategoryId = plateformCategoryId;
		this.title = title;
		this.articleContent = articleContent;
		this.status = status;
		this.date = date;
		this.articleLike = articleLike;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public ArticleUserBean getUser() {
		return user;
	}

	public void setUser(ArticleUserBean user) {
		this.user = user;
	}

	public int getPlateformCategoryId() {
		return plateformCategoryId;
	}

	public void setPlateformCategoryId(int plateformCategoryId) {
		this.plateformCategoryId = plateformCategoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Long getDate() {
		return date;
	}

	public void setDate(Long date) {
		this.date = date;
	}

	public int getArticleLike() {
		return articleLike;
	}

	public void setArticleLike(int articleLike) {
		this.articleLike = articleLike;
	}

	public List<ArticleReplyBean> getArticleReplyId() {
		return articleReplyId;
	}

	public void setArticleReplyId(List<ArticleReplyBean> articleReplyId) {
		this.articleReplyId = articleReplyId;
	}

	public int getArticleViews() {
		return articleViews;
	}

	public void setArticleViews(int articleViews) {
		this.articleViews = articleViews;
	}

	public int getArticleReplys() {
		return articleReplys;
	}

	public void setArticleReplys(int articleReplys) {
		this.articleReplys = articleReplys;
	}
	
	

	

}
