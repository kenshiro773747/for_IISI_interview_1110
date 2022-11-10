package com.epicer.service.cart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.cart.OrderCoursecart;
import com.epicer.model.cart.OrderProduct;
import com.epicer.model.cart.OrderProductDetails;
import com.epicer.model.product.Product;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
@Transactional
public class OrderProductService {
	
	@Autowired
	private OrderProductRepository orderProductRep;
	
	@Autowired
	private OrderProductDetailsRepository OPDetailRep;
	
	//------------------使用者前台--------------------
	//購物車+訂單-->新增一筆訂單
	public void addOrder(OrderProduct orderBean, Set<OrderProductDetails> detailSet) {
		Iterator<OrderProductDetails> detailIterator = detailSet.iterator();
		while(detailIterator.hasNext()) {
			OrderProductDetails details = detailIterator.next();
			details.setOrderId(orderBean);
		}
		orderBean.setOrderDetails(detailSet);
		orderProductRep.save(orderBean);//使用內建
	}
	//新增ECPAY回傳資料
	public void updateECPay(String merchantTradeNo,String paymentType,String merchantTradeDate, Integer orderProductId) {
		orderProductRep.updateECPay(merchantTradeNo, paymentType, merchantTradeDate, orderProductId);
	}
	
	//寄信之前要調出Bean
	public  OrderProduct findByorderProductId(Integer orderProductId){
		 Optional<OrderProduct> optional = orderProductRep.findById(orderProductId);
		 return optional.get();
	}
	
	
	//會員中心-->查詢自己的訂單狀態(付款狀態 + 出貨狀態) 
	public List<OrderProduct> findUserOrder(Integer userId){
		return orderProductRep.findUserOrder(userId);
	}
	
	//會員中心-->申請取消訂單(會保留訂單紀錄)(修改)
	public void cancelOrderApplication(String returnNote, Integer orderProductId) {
		orderProductRep.cancelOrderApplication(returnNote, orderProductId);
	}

	
	//------------------管理員後台--------------------
	//查詢全部訂單
	public List<OrderProduct> findAll() {
		return orderProductRep.findAll();
	}
	//查詢訂單狀態: 未付款/已付款/申請取消/取消訂單
	public List<OrderProduct> findPayStatus(String payStatus){
		return orderProductRep.findPayStatus(payStatus);
	}
	
	//查詢出訂單編號
//	public OrderProduct findOrderProductId() {
//		
//	}
	
	//修改訂單付款狀態(ECPAY後)---沒用到
//	public OrderProduct update(OrderProduct op) {
//		return orderProductRep.save(op);
//	}
	
	//修改訂單狀態(未付款 → 已付款)
	public OrderProduct updatePayStaus(Integer orderProductId) {
		return orderProductRep.updatePayStaus(orderProductId);
	}
	
	//(修改)同意會員取消訂單(訂單資料不可刪除) ->修改狀態從:未付款/已付款 → 取消訂單
//	public OrderProduct updateCancelOrder(Integer orderProductId) {
//		return orderProductRep.updateCancelOrder(orderProductId);
//	}
		
	//修改訂單狀態(未出貨 → 已出貨)
	public void updateShipment(String shipmentNo,Integer orderProductId) {
		orderProductRep.updateShipment(shipmentNo, orderProductId);
	}
		
	
	//統計--商品銷售額
	public Integer totalSale() {
		return orderProductRep.totalSale();
	}
	
	//統計--總訂單數
	public Integer totalOrders(){
		return orderProductRep.totalOrders();
	}
	
	//統計--課程營業額
	public Integer totalCourseIncome(){
		return orderProductRep.totalCourseIncome();
	}
	
	//統計--總報名人數
	public Integer totalStudent(){
		return orderProductRep.totalStudent();
	}
	
	
	
	
	
	//-------------以下為測試( 暫時不用) ------------------
	//ECPAY (學G4)
	//查訂單總表+訂單明細內容
//	static AllInOne allInOne = new AllInOne("");
	
	// @Override
//	public String ecPay(Integer orderProductId, String url, AioCheckOutALL obj) {
//		OrderProduct orderNo = orderProductRep.findById(orderProductId).get();
//		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		String dateToStr = dateFormat.format(orderNo.getOrderDate());
//		List<OrderProductDetails> orderDetailsList = OPDetailRep.findByOrderProductId(orderProductId);
//		String itemName = "";
//		int i = 0;
//		for (OrderProductDetails item : orderDetailsList) {
//			if (i == orderDetailsList.size() - 1) {
//				itemName += item.getOrderProduct().getProductName();
//			} else {
//				itemName += item.getOrderProduct().getProductName() + "#";
//				i++;
//			}
//		}
//
//		obj.setMerchantTradeNo(orderProductId + String.valueOf((int) (Math.random() * 10000)));
//		obj.setMerchantTradeDate(dateToStr);
//		obj.setTotalAmount(String.valueOf((int) orderNo.getProductTotalPrice()));
//		obj.setTradeDesc("test Description");
//		obj.setReturnURL("http://211.23.128.214:5000");
//		obj.setNeedExtraPaidInfo("N");
//		obj.setItemName(itemName);
//		//obj.setReturnURL("https://53b0-61-58-161-201.jp.ngrok.io/SpringMvcHomework/updateOrder/2/"+orderId);
//		obj.setClientBackURL(url + "/updateOrder/2/" + orderProductId);
//		//obj.setClientBackURL(url+"/orderList");
//		String form = allInOne.aioCheckOut(obj, null);
//		return form;
//	}

	//test
	public OrderProduct updateOrderProduct(OrderProduct orderproduct) {
		return orderProductRep.save(orderproduct);
	}
	
	
	//test
		public OrderProduct findById(Integer orderproductid) {
			Optional<OrderProduct> optional = orderProductRep.findById(orderproductid);
			return optional.get();
		}
}
