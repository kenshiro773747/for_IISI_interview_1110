package com.epicer.service.cart;

import java.util.List;
import java.util.Optional;

import org.hibernate.property.access.spi.EnhancedGetterMethodImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.cart.CartOfCourse;
import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.product.Product;


@Service
@Transactional
public class CartOfCourseService {
	
	@Autowired
	private CartOfCourseRepository cartOfCourseRep;
	
	
	
	//private static Integer userid=1002;

	//查詢購物車 by userid(一次只能有一個人報名，所以不查courseid)and get cartcourseid
	public Integer checkItemList(Integer cartUser) {
		System.out.println("Service checkItemList- 這是課程購物車");
		try {
			Optional<CartOfCourse> optional = cartOfCourseRep.getCartCourseId(cartUser);
			CartOfCourse result = optional.get();
			Integer cartCourseId = result.getCartCourseId();
			return cartCourseId;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//查詢ById
	public Optional<CartOfCourse> findById(Integer userId) {
		return cartOfCourseRep.findById(userId);
	}
	
	//查詢商品清單(by cartcourseid)
	public CartOfCourse findByCartCourseId(Integer cartCourseId) {
		return cartOfCourseRep.getById(cartCourseId);
	}
	
	//查詢ById test(語)
	public List<CartOfCourse> findById2(Integer userId) {
		return cartOfCourseRep.findByCartUser(userId);
	}
	
	
	// 查詢整個購物車
	public List<CartOfCourse> findAll() {
		return cartOfCourseRep.findAll();
	}
	
	// 新增
	public CartOfCourse insert(CartOfCourse cop) {
		return cartOfCourseRep.save(cop);
	}

	// 修改
	public CartOfCourse update(CartOfCourse cop) {
		
		return cartOfCourseRep.save(cop);
	}

	// 刪除
	public void deleteByCartCourseId(Integer cartCourseId) {
		cartOfCourseRep.deleteById(cartCourseId);
	}
	
	//清空購物車(by userid)
	public List<CartOfCourse> deleteUserCart(Integer userId){
		return cartOfCourseRep.deleteUserCart(userId);
	}

	// 計算購物車商品總數量(變動) 即時totalquantity
	public Integer totalCartQuantity(Integer userId) {
		List<CartOfCourse> list = cartOfCourseRep.findByCartUser(userId);
		int totalCartQuant=0;
		for(CartOfCourse cart: list) {
			Integer amount = cart.getQuantity();
			totalCartQuant += amount;
		}
		System.out.println(totalCartQuant);
		return totalCartQuant;
	}
	
	
	// 計算購物車商品總金額(變動) 即時totalprice
	public Integer totalCartPrice(Integer userId) {
		List<CartOfCourse> list = cartOfCourseRep.findByCartUser(userId);
		int totalCartPrice=0;
		for(CartOfCourse cart: list) {
			Integer amount = cart.getQuantity();
			Integer price = cart.getCartCourse().getCoursePrice();
			totalCartPrice += (amount*price);
		}
		System.out.println(totalCartPrice);
		return totalCartPrice;
	}
}
