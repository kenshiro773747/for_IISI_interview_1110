package com.epicer.controller.cart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.cart.OrderCoursecart;
import com.epicer.model.cart.OrderProduct;
import com.epicer.model.cart.OrderProductDetails;
import com.epicer.model.product.Product;
import com.epicer.model.users.EpicerUser;
import com.epicer.model.users.User;
import com.epicer.service.cart.CartOfProductService;
import com.epicer.service.cart.OrderOfUserService;
import com.epicer.service.cart.OrderProductDetailsRepository;
import com.epicer.service.cart.OrderProductDetailsService;
import com.epicer.service.cart.OrderProductService;
import com.epicer.service.cart.ProductQueryService;
import com.epicer.util.Mail;
import com.epicer.util.MailTemplateUtil;
import com.epicer.util.TimeTest;

import ecpay.payment.integration.*;
import ecpay.payment.integration.domain.*;

@Controller
@RequestMapping
@SessionAttributes(names = {"totalPages","totalElements","queryall","queryuser","alldetails"})
public class OrderProductController {
	//寄出報名成功通知
	@Autowired
	private Mail mail;
	
	@Autowired
	private MailTemplateUtil template;
	
	//呼叫商品Service
	@Autowired
	private ProductQueryService productService;
	
	//呼叫購物車Service
	@Autowired
	private CartOfProductService cartService;
	
	//呼叫會員Service
	@Autowired
	private OrderOfUserService userService;
	
	//呼叫訂單Service
	@Autowired
	private OrderProductService orderProductService;
	//呼叫訂單明細Service
	@Autowired
	private OrderProductDetailsService OPODService;
	
	private static Integer userid=1002;
	
	
	
	
	
	//private static Integer shipbill = 80;
	
	//------------------使用者前台--------------------
	//前端畫面"確認訂單明細" (不能直接連動)  //待改畫面 //10/3
	//進入網址: http://localhost:8091/Epicer/ordercheck
	@GetMapping(path = "/ordercheck")
	public String processActionCartQueryAll(Model m){
		System.out.println("gotoqueryorder");
//		Integer userid =(Integer)m.getAttribute("userid");
		List<CartOfProduct> beans= cartService.findById2(userid);//找購物車所有商品
		EpicerUser userBeans = userService.findById(userid);//找會員資料
		Integer tQuantity = cartService.totalCartQuantity(userid); //計算購物車數量
		Integer tPrice = cartService.totalCartPrice(userid); //計算總金額
		m.addAttribute("queryById",beans);
		m.addAttribute("tQuantity",tQuantity);
		m.addAttribute("tPrice",tPrice);
		m.addAttribute("queryuser",userBeans);
		
		//return "cart/frontoldcheckout"; //舊版面
		//新的套版
		System.out.println("5456");
		return "cart/frontcheckout";
	}
	
	
	//新增商品訂單 //這邊要處理ECPAY 
	//商品存入資料庫後→導到到第三方支付→謝謝購買(不能直接開)→才回首頁
	//進入商品頁網址: http://localhost:8091/Epicer/orderinsert
	@PostMapping(path = "/orderinsert")
	@ResponseBody
	public String processOrderInsert(Integer userId,String userName,String userPhone,String userAddress,
			String userEmail ,Integer[] productId,
			Integer[] quantity,Integer shipBill , Model m, HttpServletRequest request) {
		System.out.println("goto order insert 新增一筆訂單, userId=" + userId);
		
		//存入訂單(訂單狀態為未結帳)
		Integer tQuantity = cartService.totalCartQuantity(userId); //計算購物車數量
		Integer tPrice = cartService.totalCartPrice(userId); //計算總金額
		m.addAttribute("tQuantity",tQuantity);
		m.addAttribute("tPrice",tPrice);
		
		EpicerUser user1 = userService.findById(userId);
		
		OrderProduct orderBean = new OrderProduct(userId, tQuantity, tPrice);
		orderBean.setOrderDate(TimeTest.getTime());
		orderBean.setShipbill(shipBill); //加入運費
		orderBean.setProductTotalPrice(tPrice+shipBill); //總金額+運費
		orderBean.setPayStatus("未付款");
		orderBean.setShipment("未出貨");
		//orderBean.setCouponId(1);
		orderBean.setOrderName(userName);
		orderBean.setOrderPhone(userPhone);
		orderBean.setOrderAddress(userAddress);
		orderBean.setOrderEmail(userEmail);
		Set<OrderProductDetails> detailsSet = new LinkedHashSet<OrderProductDetails>();
		for(int i=0; i<productId.length; i++) {
			OrderProductDetails detail = new OrderProductDetails();
			
			Integer orderProductId = orderBean.getOrderProductId();
			List<CartOfProduct> productitem = cartService.findById2(userId);
			 
			Product product1 = productService.findById(productId[i]);
			detail.setOrderProduct(product1);
			detail.setQuantity(quantity[i]);
			detailsSet.add(detail);
		}
		orderBean.setOrderDetails(detailsSet);
		orderProductService.addOrder(orderBean, detailsSet);
		
		//取出訂單ID
		Integer orderProductId = orderBean.getOrderProductId();
		
		
		//導到第三方支付-方法一(4)(暫時無法用)
//		String url =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
//		+ request.getContextPath();
//		AioCheckOutALL obj = new AioCheckOutALL();
//		String ecPay = orderProductService.ecPay(orderProductId, url, obj);
//		m.addAttribute("ecpay",ecPay);
//		return "cart/ecpay";
		
		//導到第三方支付 - 成功!! -> 會進入成功畫面 -> 點選回商店按鈕(修改訂單狀態: 已付款)
		
//		if() { //for line pay
		AllInOne allInOne = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateToStr = dateFormat.format(TimeTest.getTime());
		List<OrderProductDetails> orderDetailsList = OPODService.findByOrderProductId(orderProductId);
		String itemName = "";
		int i = 0;
		for (OrderProductDetails item : orderDetailsList) {
			if (i == orderDetailsList.size() - 1) {
				itemName += item.getOrderProduct().getProductName();
			} else {
				itemName += item.getOrderProduct().getProductName() + "#";
				i++;
			}
		}
		obj.setMerchantTradeNo("EpicerShop" + orderProductId + String.valueOf((int) (Math.random() * 10000)));
		obj.setMerchantID("Epic-ER 料理生活購物平台");
		obj.setMerchantTradeDate(dateToStr);
		obj.setTotalAmount(String.valueOf((int) tPrice+shipBill));
		obj.setCustomField1("ECPay");
		obj.setTradeDesc("test Description");
		//obj.setReturnURL("http://211.23.128.214:5000");
		obj.setReturnURL("http://localhost:8091/ecpayToConfirmation");
		obj.setOrderResultURL("http://localhost:8091/ecpayToConfirmation");//會直接進入自已的成功付款
		obj.setNeedExtraPaidInfo("N");
		obj.setItemName(itemName);
		
		//取得回傳值，存資料庫
		//String paymentType = obj.getPaymentType();
		String merchantTradeNo = obj.getMerchantTradeNo();
		String merchantTradeDate = obj.getMerchantTradeDate();
		String paymentType = obj.getCustomField1();
		System.out.println("PaymentType:" + paymentType + "MerchantTradeNo:" +merchantTradeNo + "MerchantTradeDate:" +merchantTradeDate);
		
		
		//orderProductService.updateECPay(merchantTradeNo, paymentType, merchantTradeDate, orderProductId);
		OrderProduct old = orderProductService.findById(orderProductId);
		old.setMerchantTradeNo(merchantTradeNo);
		old.setPaymentType(paymentType);
		old.setMerchantTradeDate(merchantTradeDate);
		old.setPayStatus("已付款");
		OrderProduct newone = orderProductService.updateOrderProduct(old);
		
		//google寄信
		System.out.println("寄信orderProductId--"+ orderProductId);
		//OrderProduct info = orderProductService.findByorderProductId(orderProductId);
		System.out.println("寄信info--"+ newone.getOrderDate());
		System.out.println("寄信info--"+ newone.getOrderAddress());
		String orderEmail = newone.getOrderEmail();
		System.out.println("寄信購買號--"+ newone.getMerchantTradeNo());
		System.out.println("寄信購買號--"+ newone.getMerchantTradeDate());
		System.out.println("寄信orderEmail--"+ orderEmail);
		//	mail.courseSendToGmail(orderEmail);
		template.sendMessageWithOrder("ordermail.ftl", newone);

		
		//清空購物車(刪 cart_product)
		//BUG小問題(尚未解決): in context with path [] threw exception [Request processing failed; 
		//nested exception is org.springframework.orm.jpa.JpaSystemException: could not extract ResultSet;
//		cartService.deleteUserCart(userId);
		
		//obj.setClientBackURL("http://localhost:8091/ecpayToConfirmation");//會多一個訂單成功畫面，不過還是要導到自己的thank 才能改訂單狀態
		
		String form = allInOne.aioCheckOut(obj, null);
		
		return form;
		
		
//		}else {
//			//如果有Line pay
//		}
		
		//導到confirmation(thank u page)→按返回商品頁改狀態: 改成已付款(方式2)
		//return "cart/frontorderconfirmation";
//		return "redirect:/queryallproductmenu";
	}
	
	
	//ECPAY結束後跳轉到confirmation(thank u page)→按返回商品頁改狀態: 改成已付款(方式2)
	@PostMapping("/ecpayToConfirmation")
	public String ecpayToConfirmationAction(Integer orderProductId ,Integer userId,@RequestParam("PaymentType") String paymentType, @RequestParam("MerchantTradeNo") String merchantTradeNo) {
		System.out.println("ecpay confirmation- userId:" + userId);
		
		//按返回首頁->修改訂單
		return "cart/frontorderconfirmation";
	}
	
	//查詢會員個人訂單
	//進入會員訂單網址: http://localhost:8091/userorderqueryall
	@GetMapping(path = "/userorderqueryall")
	public String userOrderQueryAll(Integer userId, Model m) {
		System.out.println("會員中心-我的訂單");
		//先用預設 userid=1002
		List<OrderProduct> userOrder = orderProductService.findUserOrder(userid);
		m.addAttribute("userorder", userOrder);
		
		return "cart/frontuserorder";
	}
	
	//取消訂單(未付款/已付款 + 未出貨 才可以按)
	@PostMapping(path = "/userreturn")
	public String userReturnOrder(String orderProductId,String returnNote) {
		Integer orderId = Integer.valueOf(orderProductId);
		orderProductService.cancelOrderApplication(returnNote, orderId);
		OPODService.updateReturns(orderId);
		System.err.println("取消訂單 - OrderProductId:" + orderProductId + "Note:" + returnNote);
		
		return "redirect:/userorderqueryall";
	}
	
	//------------------管理員後台--------------------
	//後台管理員開啟總訂單畫面
	//進入訂單管理網址: http://localhost:8091/Epicer/adminorderquery
	@GetMapping(path = "/adminorderquery")
	public String processOrderQueryAll(Model m) {
		System.out.println("goto admin order query!!");
		List<OrderProduct> allorders = orderProductService.findAll();
			m.addAttribute("allorderlist", allorders);
			
			//可以調出ProductId (目前用不到了，已在前台寫好query)
//			for(OrderProduct or:allorders) {
//				Set<OrderProductDetails> ordertail =or.getOrderDetails();
//				for(OrderProductDetails opd :ordertail) {
//					System.out.println(opd.getOrderProduct().getProductId());
//				}
//			}
			
		//return "cart/frontproductordercheck";
		return "cart/adminorder";
	}
	
	//開啟訂單明細(總表)--跟總訂單畫面一起呈現了 (後來沒有用到)
//	@PostMapping(path = "/adminorderdetail")
//	public List<OrderProductDetails> adminorderdetail(Integer orderProductId,Model m) {
//		System.err.println(orderProductId);
//		List<OrderProductDetails> allorderdetails = OPODService.findByOrderProductId(orderProductId);
//		System.out.println(allorderdetails);
//		return allorderdetails;
//	}
	
	
	//修改訂單狀態(未出貨→已出貨 + 給物流單號)
	@PostMapping(path = "/updateshipping")
	public String updateShipment(String orderProductId,String shipmentNo) {
		Integer orderId = Integer.valueOf(orderProductId);
		orderProductService.updateShipment(shipmentNo, orderId);
		System.out.println("取消訂單 - OrderProductId:" + orderProductId + "物流單號:" + shipmentNo);
		
		return "redirect:/adminorderquery";
	}
	
	//管理員查詢: 未付款/已付款/取消訂單 (模糊查詢取代)
	
	
	//管理員查詢: 未出貨/ 已出貨(模糊查詢取代)
	
	
	
	//開啟統計表
	//進入統計網址: http://localhost:8091/Epicer/orderdashboard
	@GetMapping(path = "/orderdashboard")
	public String orderDashboard(Model m) {
		Integer totalSale = orderProductService.totalSale();
		m.addAttribute("totalSale",totalSale);
		Integer totalOrders = orderProductService.totalOrders();
		m.addAttribute("totalOrders",totalOrders);
		Integer totalCourseIncome = orderProductService.totalCourseIncome();
		m.addAttribute("totalCourseIncome",totalCourseIncome);
		Integer totalStudent = orderProductService.totalStudent();
		m.addAttribute("totalStudent",totalStudent);
		
		
		return "cart/admindashboard";
	}
	
}
