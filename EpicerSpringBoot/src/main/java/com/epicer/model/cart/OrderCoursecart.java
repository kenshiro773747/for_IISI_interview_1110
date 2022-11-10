package com.epicer.model.cart;

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

import com.epicer.model.course.Course;
import com.epicer.model.users.EpicerUser;

@Component@Entity
@Table(name ="order_course")
public class OrderCoursecart {

	
	@Id
	@Column(name="ordercourseid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderCourseId;
	
//	@OneToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "FK_order_course_users")
////	@Column(name = "FK_order_course_course")
//	private EpicerUser userid; 
//	
//	@OneToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "FK_order_course_course")
//	private Course courseid;
	
	@Column(name = "FK_order_course_users")
	private Integer orderUser;
	
	@Column(name = "FK_order_course_course")
	private Integer courseid;
	
	//運費應該都不會用到(保持null)
	@Column(name="shipbill")
	private int shipbill;
	
	@Column(name="totalquantity")
	private int totalquantity;
	
	@Column(name="totalprice")
	private int totalprice;
	
	@Column(name="paystatus")
	private String paystatus;
	
	//物流狀態都不會用到(保持null)
	@Column(name="shipment")
	private String shipment;
	
	//下單時間用毫秒存(統一),時間轉換
	@Column(name="orderdate")
	private Long orderdate;
	
	//優惠劵不確定QAQ
	@Column(name = "couponid")
	private Integer couponId;
	
	@Column(name="ordername")
	private String ordername;
	
	@Column(name="orderphone")
	private String orderphone;
	
	@Column(name="orderaddress")
	private String orderaddress;
	
	@Column(name="orderemail")
	private String orderemail;
	
	//取消報名原因
	@Column(name = "cancelnote")
	private String cancelNote;
		
	//新增綠界回傳數值
	//特店交易編號
	@Column(name = "merchanttradeno")
	private String merchantTradeNo;
	//特店選擇的付款方式
	@Column(name = "paymenttype")
	private String paymentType;
	//交易狀態 (抓不到QQ)
//	@Column(name = "tradestatus")
//	private String tradeStatus;
	//交易時間
	@Column(name = "merchanttradedate")
	private String merchantTradeDate;
		
	//QRCODE (
	@Column(name = "qrcode")
	private String QRCode;
	
	//課程名稱
	@Column(name="coursename")
	private String courseName;
	
	//老師名字
	@Column(name="teachername")
	private String teacherName;

	//開課時間
	@Column(name="coursedate")
	private Long courseDate;
	

	public int getOrderCourseId() {
		return orderCourseId;
	}

	public void setOrderCourseId(int orderCourseId) {
		this.orderCourseId = orderCourseId;
	}

//	public EpicerUserUser getUserid() {
//		return userid;
//	}
//	public void setUserid(EpicerUserUser userid) {
//		this.userid = userid;
//	}
//	public Course getCourseid() {
//		return courseid;
//	}
//	public void setCourseid(Course courseid) {
//		this.courseid = courseid;
//	}

	
	
	public int getShipbill() {
		return shipbill;
	}

	public Integer getOrderUser() {
		return orderUser;
	}

	public void setOrderUser(Integer orderUser) {
		this.orderUser = orderUser;
	}

	public Integer getCourseid() {
		return courseid;
	}

	public void setCourseid(Integer courseid) {
		this.courseid = courseid;
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
	
	
	

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getCancelNote() {
		return cancelNote;
	}

	public void setCancelNote(String cancelNote) {
		this.cancelNote = cancelNote;
	}

	public String getMerchantTradeNo() {
		return merchantTradeNo;
	}

	public void setMerchantTradeNo(String merchantTradeNo) {
		this.merchantTradeNo = merchantTradeNo;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getMerchantTradeDate() {
		return merchantTradeDate;
	}

	public void setMerchantTradeDate(String merchantTradeDate) {
		this.merchantTradeDate = merchantTradeDate;
	}

	public String getQRCode() {
		return QRCode;
	}

	public void setQRCode(String qRCode) {
		QRCode = qRCode;
	}

	
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public Long getCourseDate() {
		return courseDate;
	}

	public void setCourseDate(Long courseDate) {
		this.courseDate = courseDate;
	}

	public OrderCoursecart() {
		
	}

	public OrderCoursecart(int orderCourseId, Integer orderUser, Integer courseid, int shipbill, int totalquantity,
			int totalprice, String paystatus, String shipment, Long orderdate, Integer couponId, String ordername,
			String orderphone, String orderaddress, String orderemail, String cancelNote, String merchantTradeNo,
			String paymentType, String merchantTradeDate, String qRCode) {
		super();
		this.orderCourseId = orderCourseId;
		this.orderUser = orderUser;
		this.courseid = courseid;
		this.shipbill = shipbill;
		this.totalquantity = totalquantity;
		this.totalprice = totalprice;
		this.paystatus = paystatus;
		this.shipment = shipment;
		this.orderdate = orderdate;
		this.couponId = couponId;
		this.ordername = ordername;
		this.orderphone = orderphone;
		this.orderaddress = orderaddress;
		this.orderemail = orderemail;
		this.cancelNote = cancelNote;
		this.merchantTradeNo = merchantTradeNo;
		this.paymentType = paymentType;
		this.merchantTradeDate = merchantTradeDate;
		QRCode = qRCode;
	}

	public OrderCoursecart(Integer orderUser, int totalquantity, int totalprice) {
		super();
		this.orderUser = orderUser;
		this.totalquantity = totalquantity;
		this.totalprice = totalprice;
	}

	public OrderCoursecart(int orderCourseId, Integer orderUser, Integer courseid, int shipbill, int totalquantity,
			int totalprice, String paystatus, String shipment, Long orderdate, Integer couponId, String ordername,
			String orderphone, String orderaddress, String orderemail, String cancelNote, String merchantTradeNo,
			String paymentType, String merchantTradeDate, String qRCode, String courseName, String teacherName,
			Long courseDate) {
		super();
		this.orderCourseId = orderCourseId;
		this.orderUser = orderUser;
		this.courseid = courseid;
		this.shipbill = shipbill;
		this.totalquantity = totalquantity;
		this.totalprice = totalprice;
		this.paystatus = paystatus;
		this.shipment = shipment;
		this.orderdate = orderdate;
		this.couponId = couponId;
		this.ordername = ordername;
		this.orderphone = orderphone;
		this.orderaddress = orderaddress;
		this.orderemail = orderemail;
		this.cancelNote = cancelNote;
		this.merchantTradeNo = merchantTradeNo;
		this.paymentType = paymentType;
		this.merchantTradeDate = merchantTradeDate;
		QRCode = qRCode;
		this.courseName = courseName;
		this.teacherName = teacherName;
		this.courseDate = courseDate;
	}
	
	

}
