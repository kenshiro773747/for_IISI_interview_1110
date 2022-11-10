package com.epicer.model.course;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component@Entity
@Table(name ="coursefeedback")
public class coursefeedback {

	@Id
	@Column(name="feedbackid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int feedbackid;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "courseid")
	private Course courseid;
	
	@Column(name="studentname")
	private String studentname;
	
	@Column(name="feebcack")
	private String feebcack;

	public int getFeedbackid() {
		return feedbackid;
	}

	public void setFeedbackid(int feedbackid) {
		this.feedbackid = feedbackid;
	}

	public Course getCourseid() {
		return courseid;
	}

	public void setCourseid(Course courseid) {
		this.courseid = courseid;
	}

	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public String getFeebcack() {
		return feebcack;
	}

	public void setFeebcack(String feebcack) {
		this.feebcack = feebcack;
	}

	public coursefeedback(int feedbackid, Course courseid, String studentname, String feebcack) {
		
		this.feedbackid = feedbackid;
		this.courseid = courseid;
		this.studentname = studentname;
		this.feebcack = feebcack;
	}

	public coursefeedback() {
		super();
	}
	
}
