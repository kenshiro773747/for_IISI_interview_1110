package com.epicer.model.cart;

import java.io.Serializable;
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


@Entity
@Table(name = "orderProduct")
@Component
public class OrderProduct implements Serializable {

	@Id @Column(name = "orderproductid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderProductId;
	
//	@ManyToOne
//	@JoinColumn(name = "userid")
	@Column(name = "userid")
	private Integer orderUser;
	
	@Column(name = "shipbill")
	private Integer shipbill;
	
	@Column(name = "totalquantity")
	private Integer productTotalQuantity;
	
	@Column(name = "totalprice")
	private Integer productTotalPrice;
	
	@Column(name = "paystatus")
	private String payStatus;
	
	@Column(name = "shipment")
	private String shipment;
	
	//下單時間用毫秒存(統一),時間轉換
	@Column(name = "orderdate")
	private long orderDate;
	
	//優惠劵不確定QAQ
	@Column(name = "couponid")
	private Integer couponId;
	
	@Column(name = "ordername")
	private String orderName;
	
	@Column(name = "orderphone")
	private String orderPhone;
	
	@Column(name = "orderaddress")
	private String orderAddress;
	
	@Column(name = "orderemail")
	private String orderEmail;
	
	//取消訂單原因
	@Column(name = "returnnote")
	private String returnNote;
	
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
	
	//物流單號
	@Column(name = "shipmentno")
	private String shipmentNo;
	
	// 跟訂單明細表格串聯
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderBean", cascade = CascadeType.ALL)
	private Set<OrderProductDetails> orderDetails = new LinkedHashSet<OrderProductDetails>();

	
	public Integer getOrderProductId() {
		return orderProductId;
	}

	public void setOrderProductId(Integer orderProductId) {
		this.orderProductId = orderProductId;
	}

	public Integer getOrderUser() {
		return orderUser;
	}

	public void setOrderUser(Integer orderUser) {
		this.orderUser = orderUser;
	}

	public Integer getShipbill() {
		return shipbill;
	}

	public void setShipbill(Integer shipbill) {
		this.shipbill = shipbill;
	}

	public Integer getProductTotalQuantity() {
		return productTotalQuantity;
	}

	public void setProductTotalQuantity(Integer productTotalQuantity) {
		this.productTotalQuantity = productTotalQuantity;
	}

	public Integer getProductTotalPrice() {
		return productTotalPrice;
	}

	public void setProductTotalPrice(Integer productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getShipment() {
		return shipment;
	}

	public void setShipment(String shipment) {
		this.shipment = shipment;
	}

	public long getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(long orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public Set<OrderProductDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderProductDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	public String getReturnNote() {
		return returnNote;
	}

	public void setReturnNote(String returnNote) {
		this.returnNote = returnNote;
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

	public String getShipmentNo() {
		return shipmentNo;
	}

	public void setShipmentNo(String shipmentNo) {
		this.shipmentNo = shipmentNo;
	}

	public OrderProduct(Integer orderUser, Integer productTotalQuantity, Integer productTotalPrice, String orderName,
			String orderPhone, String orderAddress, String orderEmail) {
		super();
		this.orderUser = orderUser;
		this.productTotalQuantity = productTotalQuantity;
		this.productTotalPrice = productTotalPrice;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderEmail = orderEmail;
	}

	public OrderProduct() {
		super();
	}

	public OrderProduct(Integer orderProductId, Integer orderUser, Integer productTotalQuantity,
			Integer productTotalPrice, String orderName, String orderPhone, String orderAddress, String orderEmail) {
		super();
		this.orderProductId = orderProductId;
		this.orderUser = orderUser;
		this.productTotalQuantity = productTotalQuantity;
		this.productTotalPrice = productTotalPrice;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderEmail = orderEmail;
	}

	public OrderProduct(Integer orderUser, Integer productTotalQuantity, Integer productTotalPrice) {
		super();
		this.orderUser = orderUser;
		this.productTotalQuantity = productTotalQuantity;
		this.productTotalPrice = productTotalPrice;
	}

	public OrderProduct(String merchantTradeNo, String paymentType, String merchantTradeDate) {
		super();
		this.merchantTradeNo = merchantTradeNo;
		this.paymentType = paymentType;
		this.merchantTradeDate = merchantTradeDate;
	}

	public OrderProduct(Integer orderProductId, Integer orderUser, Integer shipbill, Integer productTotalQuantity,
			Integer productTotalPrice, String payStatus, String shipment, long orderDate, Integer couponId,
			String orderName, String orderPhone, String orderAddress, String orderEmail, String returnNote,
			String merchantTradeNo, String paymentType, String merchantTradeDate, String shipmentNo,
			Set<OrderProductDetails> orderDetails) {
		super();
		this.orderProductId = orderProductId;
		this.orderUser = orderUser;
		this.shipbill = shipbill;
		this.productTotalQuantity = productTotalQuantity;
		this.productTotalPrice = productTotalPrice;
		this.payStatus = payStatus;
		this.shipment = shipment;
		this.orderDate = orderDate;
		this.couponId = couponId;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderEmail = orderEmail;
		this.returnNote = returnNote;
		this.merchantTradeNo = merchantTradeNo;
		this.paymentType = paymentType;
		this.merchantTradeDate = merchantTradeDate;
		this.shipmentNo = shipmentNo;
		this.orderDetails = orderDetails;
	}


}
