package com.epicer.model.course;

import java.util.LinkedHashSet;
import java.util.Set;

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
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.epicer.model.cart.OrderCoursecart;
import com.epicer.model.cart.OrderProductDetails;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "course")
@Component
public class Course {

	@Id
	@Column(name = "courseid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int courseId;

	@Column(name = "coursename")
	private String courseName;

	@Column(name = "courseprice")
	private int coursePrice;

	@Column(name = "coursedescription")
	private String courseDescription;

	@Column(name = "coursedate")
	private Long courseDate;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "teacherid")
	@JsonBackReference
	private Teacher teacher;

	@Transient
	private int fakeTeacherID;

	@Column(name = "classroomid")
	private int classroomId;

	@Column(name = "coursestyle")
	private String courseStyle;

	@Column(name = "courseimage")
	private String courseImage;
	
	@Transient
	private String fakeCourseDate;
	
	
	////ckeditor/////
	@Column(name="courseckeditor")
	private String courseckeditor;
	
	

	public String getCourseckeditor() {
		return courseckeditor;
	}

	public void setCourseckeditor(String courseckeditor) {
		this.courseckeditor = courseckeditor;
	}

	public String getFakeCourseDate() {
		return fakeCourseDate;
	}

	public void setFakeCourseDate(String fakeCourseDate) {
		this.fakeCourseDate = fakeCourseDate;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}

	public String getCourseDescription() {
		return courseDescription;
	}

	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}

	public Long getCourseDate() {
		return courseDate;
	}

	public void setCourseDate(Long courseDate) {
		this.courseDate = courseDate;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public int getFakeTeacherID() {
		return fakeTeacherID;
	}

	public void setFakeTeacherID(int fakeTeacherID) {
		this.fakeTeacherID = fakeTeacherID;
	}

	public int getClassroomId() {
		return classroomId;
	}

	public void setClassroomId(int classroomId) {
		this.classroomId = classroomId;
	}

	public String getCourseStyle() {
		return courseStyle;
	}

	public void setCourseStyle(String courseStyle) {
		this.courseStyle = courseStyle;
	}

	public String getCourseImage() {
		return courseImage;
	}

	public void setCourseImage(String courseImage) {
		this.courseImage = courseImage;
	}

	
	
	public Course(int courseId, String courseName, int coursePrice, String courseDescription, Long courseDate,
			Teacher teacher, int classroomId, String courseStyle, String courseImage) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.coursePrice = coursePrice;
		this.courseDescription = courseDescription;
		this.courseDate = courseDate;
		this.teacher = teacher;
		this.classroomId = classroomId;
		this.courseStyle = courseStyle;
		this.courseImage = courseImage;
	}
	
	
	
	public Course(String courseName, int coursePrice, String courseDescription, Long courseDate, int fakeTeacherID,
			int classroomId, String courseStyle, String courseImage) {
		super();
		this.courseName = courseName;
		this.coursePrice = coursePrice;
		this.courseDescription = courseDescription;
		this.courseDate = courseDate;
		this.fakeTeacherID = fakeTeacherID;
		this.classroomId = classroomId;
		this.courseStyle = courseStyle;
		this.courseImage = courseImage;
	}
	
	

	public Course(int courseId, String courseName, int coursePrice, String courseDescription, Long courseDate,
			Teacher teacher, int fakeTeacherID, int classroomId, String courseStyle, String courseImage,
			String fakeCourseDate) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.coursePrice = coursePrice;
		this.courseDescription = courseDescription;
		this.courseDate = courseDate;
		this.teacher = teacher;
		this.fakeTeacherID = fakeTeacherID;
		this.classroomId = classroomId;
		this.courseStyle = courseStyle;
		this.courseImage = courseImage;
		this.fakeCourseDate = fakeCourseDate;
	}
	
	

	public Course(int courseId, String courseName, int coursePrice, String courseDescription, Long courseDate,
			Teacher teacher, int fakeTeacherID, int classroomId, String courseStyle, String courseImage,
			String fakeCourseDate, String courseckeditor) {
		this.courseId = courseId;
		this.courseName = courseName;
		this.coursePrice = coursePrice;
		this.courseDescription = courseDescription;
		this.courseDate = courseDate;
		this.teacher = teacher;
		this.fakeTeacherID = fakeTeacherID;
		this.classroomId = classroomId;
		this.courseStyle = courseStyle;
		this.courseImage = courseImage;
		this.fakeCourseDate = fakeCourseDate;
		this.courseckeditor = courseckeditor;
	}

	public Course() {
	}


}
