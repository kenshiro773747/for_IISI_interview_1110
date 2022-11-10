package com.epicer.model.cart;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.epicer.model.course.Course;
import com.epicer.model.product.Product;
import com.epicer.model.users.EpicerUser;

@Entity
@Table(name = "cartCourseDetails")
@Component
public class CartOfCourse implements Serializable {

	@Id @Column(name = "cartcourseid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartCourseId;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	private EpicerUser cartUser;
	 
	@ManyToOne
	@JoinColumn(name = "courseid")
	private Course cartCourse;
	
	public CartOfCourse() {
	}

	//查全部
	public CartOfCourse(Integer cartCourseId, Integer quantity, EpicerUser cartUser, Course cartCourse) {
		super();
		this.cartCourseId = cartCourseId;
		this.quantity = quantity;
		this.cartUser = cartUser;
		this.cartCourse = cartCourse;
	}

	public CartOfCourse(EpicerUser cartUser, Course cartCourse , Integer quantity) {
		super();
		this.quantity = quantity;
		this.cartUser = cartUser;
		this.cartCourse = cartCourse;
	}

	//驗證id
	public CartOfCourse(EpicerUser cartUser, Course cartCourse) {
		super();
		this.cartUser = cartUser;
		this.cartCourse = cartCourse;
	}




	public Integer getCartCourseId() {
		return cartCourseId;
	}

	public void setCartCourseId(Integer cartCourseId) {
		this.cartCourseId = cartCourseId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public EpicerUser getCartUser() {
		return cartUser;
	}

	public void setCartUser(EpicerUser cartUser) {
		this.cartUser = cartUser;
	}



	public Course getCartCourse() {
		return cartCourse;
	}

	public void setCartCourse(Course cartCourse) {
		this.cartCourse = cartCourse;
	}

	@Override
	public String toString() {
		return "CartOfProduct [cartCourseId=" + cartCourseId + ", quantity=" + quantity + ", cartUser=" + cartUser
				+ ", cartCourse=" + cartCourse + "]";
	}
	
	

	
}
