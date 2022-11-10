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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "forum_article_reply")
@Component
@JsonIgnoreProperties(value = {"articleid", "userId"})
public class ArticleReplyBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "articlereplyid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer articleReplyId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "articleid")
	@JsonIgnoreProperties(value="articleid")
	private ArticleBean articleId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid")
	private ArticleUserBean user;

	@Column(name = "articlereplycontent")
	private String articleReplyContent;

	@Column(name = "articlereplystatus")
	private int status;
	
	@Column(name = "articlereplydate")
	private Long articleReplyDate;

	public ArticleReplyBean() {
		super();
	}

	public ArticleReplyBean(ArticleBean articleId, ArticleUserBean user, String articleReplyContent,
			Long articleReplyDate) {
		super();
		this.articleId = articleId;
		this.user = user;
		this.articleReplyContent = articleReplyContent;
		this.articleReplyDate = articleReplyDate;
	}
	
	

	public ArticleReplyBean(Integer articleReplyId, ArticleBean articleId, ArticleUserBean user,
			String articleReplyContent, int status, Long articleReplyDate) {
		super();
		this.articleReplyId = articleReplyId;
		this.articleId = articleId;
		this.user = user;
		this.articleReplyContent = articleReplyContent;
		this.status = status;
		this.articleReplyDate = articleReplyDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Integer getArticleReplyId() {
		return articleReplyId;
	}

	public void setArticleReplyId(Integer articleReplyId) {
		this.articleReplyId = articleReplyId;
	}

	public ArticleBean getArticleId() {
		return articleId;
	}

	public void setArticleId(ArticleBean articleId) {
		this.articleId = articleId;
	}

	public ArticleUserBean getUser() {
		return user;
	}

	public void setUser(ArticleUserBean user) {
		this.user = user;
	}

	public String getArticleReplyContent() {
		return articleReplyContent;
	}

	public void setArticleReplyContent(String articleReplyContent) {
		this.articleReplyContent = articleReplyContent;
	}

	public Long getArticleReplyDate() {
		return articleReplyDate;
	}

	public void setArticleReplyDate(Long articleReplyDate) {
		this.articleReplyDate = articleReplyDate;
	}

}
