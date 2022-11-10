package com.epicer.model.cart;

import java.io.Serializable;

import javax.persistence.CascadeType;
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

import com.epicer.model.product.Product;

@Entity 
@Table(name = "orderProductDetails")
@Component
public class OrderProductDetails implements Serializable{
	
	@Id @Column(name = "opdid")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer ordProDetailId;
	
	@ManyToOne
	@JoinColumn(name = "orderproductid")
	private OrderProduct orderBean;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name= "productid")
	private Product orderProduct;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	

	public OrderProductDetails(Integer ordProDetailId, OrderProduct orderId, Product orderProduct, Integer quantity) {
		super();
		this.ordProDetailId = ordProDetailId;
		this.orderBean = orderId;
		this.orderProduct = orderProduct;
		this.quantity = quantity;
	}

	public OrderProductDetails() {
		super();
	}

	public OrderProductDetails(OrderProduct orderId, Product orderProduct, Integer quantity) {
		super();
		this.orderBean = orderId;
		this.orderProduct = orderProduct;
		this.quantity = quantity;
	}

	public Integer getOrdProDetailId() {
		return ordProDetailId;
	}

	public void setOrdProDetailId(Integer ordProDetailId) {
		this.ordProDetailId = ordProDetailId;
	}

	public OrderProduct getOrderId() {
		return orderBean;
	}

	public void setOrderId(OrderProduct orderId) {
		this.orderBean = orderId;
	}

	public Product getOrderProduct() {
		return orderProduct;
	}

	public void setOrderProduct(Product orderProduct) {
		this.orderProduct = orderProduct;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}
