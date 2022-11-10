package com.epicer.service.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.cart.OrderProduct;
import com.epicer.model.cart.OrderProductDetails;
import com.epicer.model.product.Product;

//商品訂單總表Dao
public interface OrderProductRepository extends JpaRepository<OrderProduct, Integer> {

	// ------------------使用者前台--------------------
	// 購物車+訂單-->新增一筆訂單
	// 使用內建(不另寫)

	// 加入ECPAY內容(所以是修改訂單內容)+ 修改訂單'已付款'
	@Modifying
	@Query(value = "update order_product set paystatus='已付款',merchanttradeno=?1, paymenttype=?2, merchanttradedate =?3 where orderproductid =?4", nativeQuery = true)
	void updateECPay(String merchantTradeNo, String paymentType, String merchantTradeDate, Integer orderProductId);
	
	// 會員中心-->查詢自己的訂單狀態(付款狀態 + 出貨狀態)
	@Query(value = "select * from order_product where userid=?1", nativeQuery = true)
	public List<OrderProduct> findUserOrder(Integer userId);

	// 會員中心-->'取消訂單'訂單(會保留訂單紀錄)(修改)
	@Modifying
	@Query(value = "update order_product set paystatus='取消訂單', returnnote=?1 where orderproductid = ?2", nativeQuery = true)
	public void cancelOrderApplication(String returnNote, Integer orderProductId);

	// ------------------管理員後台--------------------
	// 查詢全部訂單內容
	// 同ProductQuery不用改

	// 查詢訂單狀態: 未付款/已付款/申請取消/取消訂單
	@Query(value = "select * from order_product where paystatus=?1", nativeQuery = true)
	public List<OrderProduct> findPayStatus(String payStatus);

	// 查詢某訂單物流狀態：是否為"已出貨"
	// 若已出貨，不能取消訂單
	@Query(value = "select shipment from order_product where orderproductid=?1", nativeQuery = true)
	public List<OrderProductDetails> findShipment(Integer orderProductId);

	// 修改訂單狀態(未付款 → 已付款)
	@Modifying
	@Query(value = "update order_product set paystatus='已付款' where orderproductid = ?1", nativeQuery = true)
	public OrderProduct updatePayStaus(Integer orderProductId);

	// (修改)同意會員取消訂單(訂單資料不可刪除) ->修改狀態從:未付款/已付款 → 取消訂單
//	@Modifying
//	@Query(value ="update order_product set paystatus='取消訂單' where orderproductid = ?1", nativeQuery = true)
//	public OrderProduct updateCancelOrder(Integer orderProductId);

	// 修改物流狀態(未出貨 → 已出貨)
	@Modifying
	@Query(value = "update order_product set shipment='已出貨', shipmentno=?1 where orderproductid=?2", nativeQuery = true)
	public void updateShipment(String shipmentNo, Integer orderProductId);
	
	
	//統計--商品銷售額
	@Query(value = "select sum(totalprice) totalprice from order_product", nativeQuery = true)
	public Integer totalSale();
	
	//統計--總訂單數
	@Query(value = "select count(orderproductid) totalorder from order_product;", nativeQuery = true)
	public Integer totalOrders();
	
	
	//統計--課程營業額
	@Query(value = "select sum(totalprice) totalprice from order_course", nativeQuery = true)
	public Integer totalCourseIncome();
	
	//統計--總報名人數
	@Query(value = "select sum(totalquantity) totalstudent from order_course", nativeQuery = true)
	public Integer totalStudent();
	
	//統計--總報名人數
	

}
