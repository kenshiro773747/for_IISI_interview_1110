package com.epicer.controller.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class cartController {

	// 管理員全部購物車
	// 連線網址路徑: http://localhost:8091/Epicer/admincart.controller
	@GetMapping("/admincart.controller")
	public String processAdminCartAction() {
		return "cart/admincart";
	}

	// 一般會員個人購物車
	// 連線網址路徑: http://localhost:8091/Epicer/usercart.controller
	@GetMapping("/usercart.controller")
	public String processUserCartAction() {
		return "cart/usercart";
	}

	// 管理員查全部訂單
	// 連線網址路徑: http://localhost:8091/Epicer/adminorder.controller
	@GetMapping("/adminorder.controller")
	public String processAdminOrderAction() {
		return "cart/adminorder";
	}

	// 一般會員個人訂單
	// 連線網址路徑: http://localhost:8091/Epicer/userorder.controller
	@GetMapping("/userorder.controller")
	public String processUserOrderAction() {
		return "cart/userorder";
	}
	
	// EPICER測試前台畫面1
	// 連線網址路徑: http://localhost:8091/Epicer/fronttest1
	@GetMapping("/fronttest1")
	public String processTestOneAction() {
		return "cart/frontcartnew";
	}
	
	// EPICER測試前台畫面2
	// 連線網址路徑: http://localhost:8091/Epicer/fronttest2
	@GetMapping("/fronttest2")
	public String processTestTwoAction() {
		return "cart/frontcheckout";
	}
	

}