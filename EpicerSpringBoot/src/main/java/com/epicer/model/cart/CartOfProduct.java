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

import com.epicer.model.product.Product;
import com.epicer.model.users.EpicerUser;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "cartProductDetails")
@Component
public class CartOfProduct implements Serializable {

	@Id @Column(name = "cartproductid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartProductId;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	private EpicerUser cartUser;
	 
	@ManyToOne
	@JoinColumn(name = "productid")
	@JsonBackReference
	private Product cartProduct;
	
	public CartOfProduct() {
	}

	//查全部
	public CartOfProduct(Integer cartProductId, Integer quantity, EpicerUser cartUser, Product cartProduct) {
		super();
		this.cartProductId = cartProductId;
		this.quantity = quantity;
		this.cartUser = cartUser;
		this.cartProduct = cartProduct;
	}

	public CartOfProduct(EpicerUser cartUser, Product cartProduct , Integer quantity) {
		super();
		this.quantity = quantity;
		this.cartUser = cartUser;
		this.cartProduct = cartProduct;
	}

	//驗證id
	public CartOfProduct(EpicerUser cartUser, Product cartProduct) {
		super();
		this.cartUser = cartUser;
		this.cartProduct = cartProduct;
	}


	public Integer getCartProductId() {
		return cartProductId;
	}

	public void setCartProductId(Integer cartProductId) {
		this.cartProductId = cartProductId;
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

	public Product getCartProduct() {
		return cartProduct;
	}

	public void setCartProduct(Product cartProduct) {
		this.cartProduct = cartProduct;
	}

	@Override
	public String toString() {
		return "CartOfProduct [cartProductId=" + cartProductId + ", quantity=" + quantity + ", cartUser=" + cartUser
				+ ", cartProduct=" + cartProduct + "]";
	}

	
}
