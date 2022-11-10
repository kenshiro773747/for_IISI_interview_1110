package com.epicer.model.course;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

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

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "teacher")
@Component
public class Teacher {

	@Id
	@Column(name = "teacherid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int teacherId;

	@Column(name = "teachername")
	private String teacherName;

	@Column(name = "teacherdescription")
	private String teacherDescription;

	@Column(name = "teacherstatus")
	private String teacherStatus;

	@Column(name = "teacherimage")
	private String teacherImage;

	@Column(name = "teacheraddress")
	private String teacherAddress;

	@Column(name = "teacherphone")
	private String teacherPhone;

	@Column(name = "teacherbirthday")
	private String teacherBirthday;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "teacher", cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<Course> course = new LinkedHashSet<Course>();

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherDescription() {
		return teacherDescription;
	}

	public void setTeacherDescription(String teacherDescription) {
		this.teacherDescription = teacherDescription;
	}

	public String getTeacherStatus() {
		return teacherStatus;
	}

	public void setTeacherStatus(String teacherStatus) {
		this.teacherStatus = teacherStatus;
	}

	public String getTeacherImage() {
		return teacherImage;
	}

	public void setTeacherImage(String teacherImage) {
		this.teacherImage = teacherImage;
	}

	public String getTeacherAddress() {
		return teacherAddress;
	}

	public void setTeacherAddress(String teacherAddress) {
		this.teacherAddress = teacherAddress;
	}

	public String getTeacherPhone() {
		return teacherPhone;
	}

	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}

	public String getTeacherBirthday() {
		return teacherBirthday;
	}

	public void setTeacherBirthday(String teacherBirthday) {
		this.teacherBirthday = teacherBirthday;
	}

	public Set<Course> getCourse() {
		return course;
	}

	public void setCourse(Set<Course> course) {
		this.course = course;
	}
	
	

	public Teacher(int teacherId, String teacherName, String teacherDescription, String teacherStatus,
			String teacherImage, String teacherAddress, String teacherPhone, String teacherBirthday,
			Set<Course> course) {
		super();
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.teacherDescription = teacherDescription;
		this.teacherStatus = teacherStatus;
		this.teacherImage = teacherImage;
		this.teacherAddress = teacherAddress;
		this.teacherPhone = teacherPhone;
		this.teacherBirthday = teacherBirthday;
		this.course = course;
	}

	public Teacher() {
	}

//	@Override
//	public String toString() {
//		return "Teacher [teacherId=" + teacherId + ", teacherName=" + teacherName + ", teacherDescription="
//				+ teacherDescription + ", teacherStatus=" + teacherStatus + ", teacherImage=" + teacherImage
//				+ ", teacherAddress=" + teacherAddress + ", teacherPhone=" + teacherPhone + ", teacherBirthday="
//				+ teacherBirthday + ", course=" + course + "]";
//	}

}
