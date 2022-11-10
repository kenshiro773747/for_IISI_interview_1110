package com.epicer.model.forum;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "forum_article_collect_rec")
@Component
public class ArticleCollectRecBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
	@Column(name = "collectarticlerec")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer collectArticleRec;


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "articleid")
	private ArticleBean articleId;

	@Column(name = "userid")
	private int user;

	public ArticleCollectRecBean() {
		super();
	}

	public ArticleCollectRecBean(Integer collectArticleRec, ArticleBean articleId, int user) {
		super();
		this.collectArticleRec = collectArticleRec;
		this.articleId = articleId;
		this.user = user;
	}

	public Integer getCollectArticleRec() {
		return collectArticleRec;
	}

	public void setCollectArticleRec(Integer collectArticleRec) {
		this.collectArticleRec = collectArticleRec;
	}

	public ArticleBean getArticleId() {
		return articleId;
	}

	public void setArticleId(ArticleBean articleId) {
		this.articleId = articleId;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	

	

}
