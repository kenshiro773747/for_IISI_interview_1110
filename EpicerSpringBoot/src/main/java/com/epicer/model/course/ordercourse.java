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

import com.epicer.model.users.User;

@Component@Entity
@Table(name ="order_course")
public class ordercourse {

	
	@Id
	@Column(name="ordercourseid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderCourseId;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_order_course_users")
	private User userid; 
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_order_course_course")
	private Course courseid;
	
	@Column(name="shipbill")
	private int shipbill;
	
	@Column(name="totalquantity")
	private int totalquantity;
	
	@Column(name="totalprice")
	private int totalprice;
	
	@Column(name="paystatus")
	private String paystatus;
	
	@Column(name="shipment")
	private String shipment;
	
	@Column(name="orderdate")
	private Long orderdate;
	
	@Column(name="ordername")
	private String ordername;
	
	@Column(name="orderphone")
	private String orderphone;
	
	@Column(name="orderaddress")
	private String orderaddress;
	
	@Column(name="orderemail")
	private String orderemail;

	public int getOrderCourseId() {
		return orderCourseId;
	}

	public void setOrderCourseId(int orderCourseId) {
		this.orderCourseId = orderCourseId;
	}

	public User getUserid() {
		return userid;
	}

	public void setUserid(User userid) {
		this.userid = userid;
	}

	public Course getCourseid() {
		return courseid;
	}

	public void setCourseid(Course courseid) {
		this.courseid = courseid;
	}

	public int getShipbill() {
		return shipbill;
	}

	public void setShipbill(int shipbill) {
		this.shipbill = shipbill;
	}

	public int getTotalquantity() {
		return totalquantity;
	}

	public void setTotalquantity(int totalquantity) {
		this.totalquantity = totalquantity;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public String getPaystatus() {
		return paystatus;
	}

	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}

	public String getShipment() {
		return shipment;
	}

	public void setShipment(String shipment) {
		this.shipment = shipment;
	}

	public Long getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Long orderdate) {
		this.orderdate = orderdate;
	}

	public String getOrdername() {
		return ordername;
	}

	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}

	public String getOrderphone() {
		return orderphone;
	}

	public void setOrderphone(String orderphone) {
		this.orderphone = orderphone;
	}

	public String getOrderaddress() {
		return orderaddress;
	}

	public void setOrderaddress(String orderaddress) {
		this.orderaddress = orderaddress;
	}

	public String getOrderemail() {
		return orderemail;
	}

	public void setOrderemail(String orderemail) {
		this.orderemail = orderemail;
	}

	public ordercourse(int orderCourseId, User userid, Course courseid, int shipbill, int totalquantity, int totalprice,
			String paystatus, String shipment, Long orderdate, String ordername, String orderphone, String orderaddress,
			String orderemail) {
		super();
		this.orderCourseId = orderCourseId;
		this.userid = userid;
		this.courseid = courseid;
		this.shipbill = shipbill;
		this.totalquantity = totalquantity;
		this.totalprice = totalprice;
		this.paystatus = paystatus;
		this.shipment = shipment;
		this.orderdate = orderdate;
		this.ordername = ordername;
		this.orderphone = orderphone;
		this.orderaddress = orderaddress;
		this.orderemail = orderemail;
	}

	
	
	
	public ordercourse() {
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
