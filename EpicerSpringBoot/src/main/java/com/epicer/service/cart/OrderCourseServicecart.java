package com.epicer.service.cart;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.cart.OrderCoursecart;
import com.epicer.model.cart.OrderProduct;
import com.epicer.model.cart.OrderProductDetails;
import com.epicer.model.course.Course;
import com.epicer.model.course.ordercourse;
import com.epicer.service.course.CourseService;

@Service
@Transactional
public class OrderCourseServicecart {
	
	@Autowired
	private OrderCourseRepositorycart ocRepo;
	
	@Autowired
	private CourseService cs;
	
	// ------------------羿 用到--------------------
	///從id取得課程報名學生資訊///
	public List<OrderCoursecart> findBycourseidLike(Integer courseId) {
		
		Course c = cs.getCourseById(courseId);
		
		return ocRepo.findBycourseidLike(c);
	}

	
	//------------------使用者前台--------------------
	//購物車+訂單-->新增一筆訂單
	public void addOrder(OrderCoursecart orderCourseBean) {
//		Iterator<OrderProductDetails> detailIterator = detailSet.iterator();
//		while(detailIterator.hasNext()) {
//			OrderProductDetails details = detailIterator.next();
//			details.setOrderId(orderBean);
//		}
//		orderBean.setOrderDetails(detailSet);
		ocRepo.save(orderCourseBean);//使用內建
	}
	
	//新增ECPAY回傳資料
	public void updateECPay(String merchantTradeNo, String paymentType, String merchantTradeDate,
			Integer orderCourseId) {
		ocRepo.updateECPay(merchantTradeNo, paymentType, merchantTradeDate, orderCourseId);
		
	}
	//報名資料確認，才往付款前進
	public  OrderCoursecart findByOrderCourseId(Integer orderCourseId){
		return ocRepo.getById(orderCourseId);
	}
	
	
	// 會員中心-->查詢自己的訂單狀態(付款狀態)
	
	public List<OrderCoursecart> findUserOrder(Integer userId){
		return ocRepo.findUserOrder(userId);
	}
	
	// 會員中心-->'取消報名'訂單(會保留報名紀錄)(修改)，quantity=0
	public void cancelCourseApplication(String cancelNote, Integer orderCourseId) {
		ocRepo.cancelCourseApplication(cancelNote, orderCourseId);
	}
	// ------------------管理員後台--------------------
	// 查詢全部訂單內容
	// 同ProductQuery不用改
	public List<OrderCoursecart> findAll() {
		return ocRepo.findAll();
	}
	
	// 查詢一筆訂單內容
	
	
	
	// 查詢訂單狀態: 未付款/已付款/申請取消/取消訂單
	public List<OrderCoursecart> findCoursePayStatus(String payStatus){
		return ocRepo.findPayStatus(payStatus);
	}
	
	// ------------------BONUS--------------------
	//存qrcode?
	
	//查qrcode

}
