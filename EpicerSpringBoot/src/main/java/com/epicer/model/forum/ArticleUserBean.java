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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name = "users")
@Component
public class ArticleUserBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "userid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;

	@Column(name = "userstatus")
	private Integer userStatus;
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user",cascade = CascadeType.ALL)
	@JsonIgnore
	private List<ArticleBean> articleBean = new ArrayList<ArticleBean>();

	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user",cascade = CascadeType.ALL)
	@JsonIgnore
	private List<ArticleReplyBean> articleReplyBean = new ArrayList<ArticleReplyBean>();
	
	

	public ArticleUserBean() {
		super();
	}



	public ArticleUserBean(Integer userId, Integer userStatus, List<ArticleBean> articleBean,
			 List<ArticleReplyBean> articleReplyBean) {
		super();
		this.userId = userId;
		this.userStatus = userStatus;
		this.articleBean = articleBean;
		this.articleReplyBean = articleReplyBean;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public int getUserStatus() {
		return userStatus;
	}



	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}



	public List<ArticleBean> getArticleBean() {
		return articleBean;
	}



	public void setArticleBean(List<ArticleBean> articleBean) {
		this.articleBean = articleBean;
	}


	public List<ArticleReplyBean> getArticleReplyBean() {
		return articleReplyBean;
	}



	public void setArticleReplyBean(List<ArticleReplyBean> articleReplyBean) {
		this.articleReplyBean = articleReplyBean;
	}

	



}
