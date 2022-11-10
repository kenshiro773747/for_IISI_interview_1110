package com.epicer.controller.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.product.Product;
import com.epicer.service.cart.CartOfProductService;
import com.epicer.service.product.ProductService;

@Controller
@RequestMapping
public class GroupPageController {
	
	// 商品
		@Autowired
		private CartOfProductService COPService;
		
		@Autowired
		private ProductService productService;
	
		private static Integer userid = 1002;
		
	// EPICER測試前台登入頁面
	// 連線網址路徑: http://localhost:8091/Epicer/epicerindex
	@GetMapping("/epicerindex")
	public String processFristFrontIndexAction() {
		
		
		
		
		return "frontframeblankpgs/index";
	}

	// EPICER前台首頁(index)  //這邊暫時不改動
	// 連線網址路徑: http://localhost:8091/Epicer/homepage
	@GetMapping("/homepage")
	public String processHomePageAction(Model m) {

		List<Product> beans=productService.findOnShelf(1);
		m.addAttribute("findAll",beans);
		
		return "frontframeblankpgs/index";
	}
	
	
	//EPICER測試會員中心blog
	// 連線網址路徑: http://localhost:8091/Epicer/membercenterforum
	@GetMapping("/membercenterforum")
	public String processMemberFroumAction() {
		return "frontframeblankpgs/address";
	}
	
	//EPICER測試bar
	// 連線網址路徑: http://localhost:8091/Epicer/testbar
	@GetMapping("/testbar")
	public String processTestAction() {
		return "frontframeblankpgs/purchaseconfirmation";
		//return "cart/frontcourseinformation";
	}
}
