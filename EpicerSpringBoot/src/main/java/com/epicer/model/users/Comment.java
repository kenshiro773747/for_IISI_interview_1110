package com.epicer.model.users;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="users_comment")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="contentid")
	private int contentId;
	
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    @JoinColumn(name="senderid")
	private EpicerUser user;

	@Column(name="type")
	private String type;
	
	@Column(name="content")
	private String content;
	
	@Column(name="date")
	private long date;
	
	@Column(name="replystatus")
	private int replyStatus;
	
	@Column(name="replycontent")
	private String replyContent;
	
	@Column(name="replystatusdate")
	private long replyStatusDate;
	
	
	@Column(name="replyerid")
	private Integer replyerid;


	public int getContentId() {
		return contentId;
	}


	public void setContentId(int contentId) {
		this.contentId = contentId;
	}


	public EpicerUser getUser() {
		return user;
	}


	public void setUser(EpicerUser user) {
		this.user = user;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public long getDate() {
		return date;
	}


	public void setDate(long date) {
		this.date = date;
	}


	public int getReplyStatus() {
		return replyStatus;
	}


	public void setReplyStatus(int replyStatus) {
		this.replyStatus = replyStatus;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public long getReplyStatusDate() {
		return replyStatusDate;
	}


	public void setReplyStatusDate(long replyStatusDate) {
		this.replyStatusDate = replyStatusDate;
	}


	public Integer getReplyerid() {
		return replyerid;
	}


	public void setReplyerid(Integer replyerid) {
		this.replyerid = replyerid;
	}
	
	
	
}
