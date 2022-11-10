package com.epicer.service.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.epicer.model.cart.OrderCoursecart;
import com.epicer.model.cart.OrderProduct;
import com.epicer.model.course.Course;
import com.epicer.model.course.ordercourse;

//課程訂單總表Dao
public interface OrderCourseRepositorycart extends JpaRepository<OrderCoursecart, Integer> {

	// ------------------羿 用到--------------------
	/// 從課程id找出的list///
	public List<OrderCoursecart> findBycourseidLike(Course courseId);

	// ------------------使用者前台--------------------
	// 購物車+訂單-->新增一筆訂單
	// 使用內建(不另寫)

	// 加入ECPAY內容(所以是修改訂單內容)+ 修改訂單'已付款'
	@Modifying
	@Query(value = "update order_course set paystatus='已付款',merchanttradeno=?1, paymenttype=?2, merchanttradedate =?3 where ordercourseid =?4", nativeQuery = true)
	void updateECPay(String merchantTradeNo, String paymentType, String merchantTradeDate, Integer orderCourseId);

	// 會員中心-->查詢自己的訂單狀態(付款狀態)
	@Query(value = "select * from order_course where FK_order_course_users=?1", nativeQuery = true)
	public List<OrderCoursecart> findUserOrder(Integer userId);

	// 會員中心-->'取消報名'訂單(會保留報名紀錄)(修改)，quantity=0 (人數改成 0)
	@Modifying
	@Query(value = "update order_course set paystatus='取消報名', totalquantity=0, cancelnote=?1 where ordercourseid = ?2", nativeQuery = true)
	public void cancelCourseApplication(String cancelNote, Integer orderCourseId);
	
	//查出一筆訂單內容(透過orderProductId)
	@Query(value = "select * from order_course where ordercourseid=?1", nativeQuery = true)
	public OrderCoursecart findByOrderCourseId(Integer orderCourseId);
	
	// ------------------管理員後台--------------------
	// 查詢全部訂單內容
	// 同ProductQuery不用改
	
	
	// 查詢訂單狀態: 未付款/已付款/取消訂單
	@Query(value = "select * from order_course where paystatus=?1", nativeQuery = true)
	public List<OrderCoursecart> findPayStatus(String payStatus);
	
	// 查詢某訂單物流狀態：是否為"已出貨"-----課程不用物流
		
	
	// 修改訂單狀態(未付款 → 已付款)-----課程不用物流
	
	
	// ------------------BONUS--------------------
	//存qrcode? 
	
	//
	
	
}
