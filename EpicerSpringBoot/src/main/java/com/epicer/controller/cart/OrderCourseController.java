package com.epicer.controller.cart;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.cart.CartOfCourse;
import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.cart.OrderCoursecart;
import com.epicer.model.cart.OrderProduct;
import com.epicer.model.cart.OrderProductDetails;
import com.epicer.model.course.Course;
import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleUserBean;
import com.epicer.model.product.Product;
import com.epicer.model.users.EpicerUser;
import com.epicer.model.users.User;
import com.epicer.service.cart.CartOfCourseService;
import com.epicer.service.cart.OrderCourseServicecart;
import com.epicer.service.cart.OrderOfUserService;
import com.epicer.service.course.CourseService;
import com.epicer.util.Mail;
import com.epicer.util.TimeTest;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
@RequestMapping
@SessionAttributes(names = {"totalPages","totalElements","queryall",
		"queryuser","alldetails","courseQueryById","orderCourseId","orderCourseBean","getcoursebean"})
public class OrderCourseController {
	//寄出報名成功通知
	@Autowired
	private Mail mail;

	//呼叫課程Service
	@Autowired
	private CourseService courseService;
	
	//呼叫課程購物車Service
	@Autowired
	private CartOfCourseService cartCourseService;
	
	//呼叫會員Service
	@Autowired
	private OrderOfUserService userService;
	
	//呼叫課程訂單Service
	@Autowired
	private OrderCourseServicecart orderCourseService;
	
	//呼叫課程Repo
	
	
	//呼叫訂單明細Service(不需要了)
	
	private static Integer userid=1002;
	
	//------------------使用者前台--------------------
	//按"我要報名" → 進入課程購物車 → 前端畫面"確認訂單明細" (不能直接連動)
	//進入網址: http://localhost:8091/Epicer/ordercoursecheck
	@GetMapping(path = "/ordercoursecheck")
	public String CourseCartQueryAll(Model m){
		System.out.println("gotoqueryorder--課程填寫報名資訊");
//		Integer userid =(Integer)m.getAttribute("userid");
		List<CartOfCourse> beans= cartCourseService.findById2(userid);//找購物車所有商品
		EpicerUser userBeans = userService.findById(userid);//找會員資料
		Integer tQuantity = cartCourseService.totalCartQuantity(userid); //計算購物車數量
		Integer tPrice = cartCourseService.totalCartPrice(userid); //計算總金額
		m.addAttribute("queryById",beans);
		m.addAttribute("tQuantity",tQuantity);
		m.addAttribute("tPrice",tPrice);
		m.addAttribute("queryuser",userBeans);
		
		return "cart/frontcheckoutcourse";
	}
	
	
	//新增課程訂單 (這邊不導入ECPAY)
	//課程存入資料庫後→導到到第三方支付→謝謝購買(不能直接開)→才回首頁
	//進入課程頁網址: http://localhost:8091/Epicer/orderinsert
	@PostMapping(path = "/orderinsertstudent")
//	@ResponseBody
	public String processOrderInsertStudent(Integer userId,String userName,String userPhone,String userAddress,
			String userEmail ,Integer courseId, String courseName,String courseTeacher,Long courseDate,
			Integer quantity, Model m, HttpServletRequest request) {
		System.out.println("goto order insert 新增一筆訂單, userId=" + userId);
		
		//存入訂單(訂單狀態為未結帳)
		Integer tQuantity = cartCourseService.totalCartQuantity(userId); //計算購物車數量
		Integer tPrice = cartCourseService.totalCartPrice(userId); //計算總金額
		m.addAttribute("tQuantity",tQuantity);
		m.addAttribute("tPrice",tPrice);
		
		System.out.println("courseTeacher--"+courseTeacher);
		EpicerUser user1 = userService.findById(userId);
		
		OrderCoursecart orderBean = new OrderCoursecart(userId, tQuantity, tPrice);
		orderBean.setOrderdate(TimeTest.getTime());
		orderBean.setCourseid(courseId);
		orderBean.setPaystatus("未付款");
		orderBean.setOrdername(userName);
		orderBean.setOrderphone(userPhone);
		orderBean.setOrderaddress(userAddress);
		orderBean.setOrderemail(userEmail);
		orderBean.setCourseName(courseName);
		orderBean.setCourseDate(courseDate);
		orderBean.setTeacherName(courseTeacher);
		orderCourseService.addOrder(orderBean);
		
		
		//取出課程訂單ID (抓錯抓到courseId)
		Integer orderCourseId = orderBean.getOrderCourseId();
		System.err.println(orderCourseId);
		m.addAttribute("orderCourseId",orderCourseId);
		System.out.println("調出orderCourseId:" +orderCourseId);
		
		return "redirect:/ordercourseinfo";
	}
	
	//存訂單到資料庫後，僅能確認報名資料→ 直接導向付款頁面
	//進入課程頁網址: http://localhost:8091/Epicer/ordercourseinfo (額...其實不能直接開)
	@GetMapping(path = "/ordercourseinfo")
	public String orderCourseInfoCheck(Model m){
		
		System.out.println("m" + m);
		
		Integer orderCourseId = (Integer) m.getAttribute("orderCourseId");
		System.out.println("進入info - orderCourseId" +orderCourseId);
		OrderCoursecart ocBean = orderCourseService.findByOrderCourseId(orderCourseId);
		m.addAttribute("orderCourseBean", ocBean);
		Integer courseId = ocBean.getCourseid();
		Course courseBean = courseService.getCourseById(courseId);
		m.addAttribute("getcoursebean",courseBean);
		
		
		
		
		return "cart/frontcourseinformation";
	}
	
	//ECPAY結束後跳轉到confirmation(thank u page) 
	//GOOGLE API寄信+QRCODE!!!!
	@PostMapping("/courseinfotoecpay")
	@ResponseBody
	public String CourseInfotoECPayAction(Integer orderCourseId, Model m) {
		System.out.println("info to ecpay- orderCourseId:" + orderCourseId);
		
		//(新)確認報名畫面(未付款) 按確認->跳alert 寄信→進入謝謝頁面
		OrderCoursecart info = orderCourseService.findByOrderCourseId(orderCourseId);
		Integer courseId = info.getCourseid();
		Course course = courseService.getCourseById(courseId);
		String courseName = course.getCourseName();
		Integer coursePrice = course.getCoursePrice();
		String teacherName = course.getTeacher().getTeacherName();
		Long courseDate = course.getCourseDate();
		System.out.println("找出courseName:"+courseName);
		
		
		//按返回首頁->修改訂單
		//return "cart/frontcourseinformation";
		
		//導到第三方支付 - 成功!! -> 會進入成功畫面 -> 點選回商店按鈕(修改訂單狀態: 已付款)
		
//		if() { //for line pay
		AllInOne allInOne = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateToStr = dateFormat.format(TimeTest.getTime());

		obj.setMerchantTradeNo("EpicerCourse" + orderCourseId + String.valueOf((int) (Math.random() * 10000)));
		obj.setMerchantID("Epic-ER 料理生活購物平台");
		obj.setMerchantTradeDate(dateToStr);
		obj.setTotalAmount(String.valueOf((int) coursePrice));
		obj.setCustomField1("ECPay");
		obj.setTradeDesc("test Description");
		obj.setReturnURL("http://localhost:8091/infotocourseconfirmation");
		obj.setOrderResultURL("http://localhost:8091/infotocourseconfirmation");//會直接進入自已的成功付款
		obj.setNeedExtraPaidInfo("N");
		obj.setItemName(courseName); //加入課程名稱
		
		//取得回傳值，存資料庫
		//String paymentType = obj.getPaymentType();
		String merchantTradeNo = obj.getMerchantTradeNo();
		String merchantTradeDate = obj.getMerchantTradeDate();
		String paymentType = obj.getCustomField1();
		System.out.println("PaymentType:" + paymentType + "MerchantTradeNo:" +merchantTradeNo + "MerchantTradeDate:" +merchantTradeDate);
		orderCourseService.updateECPay(merchantTradeNo, paymentType, merchantTradeDate, orderCourseId);
		
		//obj.setClientBackURL("http://localhost:8091/ecpayToConfirmation");//會多一個訂單成功畫面，不過還是要導到自己的thank 才能改訂單狀態
		String form = allInOne.aioCheckOut(obj, null);

		
		//google寄信
		String orderEmail =info.getOrderemail();
		mail.courseSendToGmail(orderEmail);
		
		return form;
		//結束後，進入謝謝畫面
	}
	
	//跳轉謝謝confirmation→ 回首頁
	@PostMapping("/infotocourseconfirmation")
	public String infoToCourseConfirmationAction(Model m) {
		
		
		//按返回首頁
		return "cart/frontcourseconfirmation";
	}
	
	
	//查詢會員"我的課程"
	//進入會員訂單網址: http://localhost:8091/usercoursequeryall
	@GetMapping(path = "/usercoursequeryall")
	public String userOrderQueryAll(Integer userId, Model m) {
		System.out.println("會員中心-我的訂單");
		//先用預設 userid=1002
		List<OrderCoursecart> userOrder = orderCourseService.findUserOrder(userid);
		
		m.addAttribute("usercourse", userOrder);
		
		
		
		return "cart/frontusercourse";
	}
	
	//取消報名(可能設置判斷式開課前一周不能取消)
	@PostMapping(path = "/usercancel")
	public String userCancelCourse(String orderCourseId,String cancelNote) {
		Integer orderId = Integer.valueOf(orderCourseId);
		orderCourseService.cancelCourseApplication(cancelNote, orderId);
		System.err.println("取消報名 - OrderProductId:" + orderCourseId + "Note:" + cancelNote);
		
		return "redirect:/usercoursequeryall";
	}
	
	
	
	//------------------管理員後台--------------------
	//後台管理員開啟總訂單畫面
	//進入訂單管理網址: http://localhost:8091/Epicer/admincoursequery
	@GetMapping(path = "/admincoursequery")
	public String courseOrderQueryAll(Model m) {
		System.out.println("goto admin course order query!!");
		List<OrderCoursecart> allcourse = orderCourseService.findAll();
			m.addAttribute("allcourselist", allcourse);
			
		return "cart/adminordercourse";
	}
	
	
	
	//管理員查詢: 未付款/已付款/取消報名--模糊查詢解決
	
	//增加統計分析?
}
