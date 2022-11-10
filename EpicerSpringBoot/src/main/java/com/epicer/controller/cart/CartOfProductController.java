package com.epicer.controller.cart;

import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.cart.CartOfCourse;
import com.epicer.model.cart.CartOfProduct;
import com.epicer.model.course.Course;
import com.epicer.model.product.Product;

import com.epicer.model.users.*;
import com.epicer.service.cart.CartOfCourseService;

import com.epicer.service.cart.CartOfProductService;
import com.epicer.controller.product.*;

@Controller
@RequestMapping
//@SessionAttributes(names = {"userid"})
public class CartOfProductController {

	// 商品
	@Autowired
	private CartOfProductService COPService;
	// 課程
	@Autowired
	private CartOfCourseService COCService;

	private static Integer userid = 1002;

	// 管理員全部購物車 //暫時用不到
	// 開啟前端購物車連線網址: http://localhost:8091/Epicer/frontproductcart
	@GetMapping("/frontproductcart")
	public String processAdminCartAction() {
		return "cart/admincart";
	}
	// ------------------ 商品 & 課程購物車寫一起--------------------
	// ------------------使用者前台 - 商品購物車--------------------

	// 前端購物車畫面查全部食材商品
	// 進入商品頁網址: http://localhost:8091/Epicer/queryusercart
	@GetMapping(path = "/queryusercart")
	public String processActionCartQueryAll(Model m) {
		System.out.println("gotoqueryallcart");
//		Integer userid =(Integer)m.getAttribute("userid");
		List<CartOfProduct> beans = COPService.findById2(userid);// 找購物車所有商品
		Integer tQuantity = COPService.totalCartQuantity(userid); // 計算購物車數量
		Integer tPrice = COPService.totalCartPrice(userid); // 計算總金額
		m.addAttribute("queryById", beans);
		m.addAttribute("tQuantity", tQuantity);
		m.addAttribute("tPrice", tPrice);
		// return "cart/frontproductintocart";
		// 改版購物車
		return "cart/frontcartnew";
	}

	// 從商品頁按鈕進入購物車 - (1) 一次加一個 (原寫法)
	// 進入商品頁網址: http://localhost:8091/Epicer/addproducttocart
	@GetMapping(path = "/addoneproducttocart")
//	@RequestParam("userid") Integer userId, 
	public String processOneItemAddAction(Integer userId,Integer productId, Model m){
		System.out.println("addtocart--userid"+userId);
		Integer quantity = 1;
		EpicerUser cartUser = new EpicerUser();

		cartUser.setId(userId);
		Product cartProduct = new Product();
		cartProduct.setProductId(productId);
		CartOfProduct c1 = new CartOfProduct(cartUser, cartProduct, quantity);
		

		// 先查詢購物車是否有重複userId+productId->if有，則查出cartId然後修改;if無，則新增
		if (COPService.checkItemList(userid, productId) != null) {
			System.out.println("do update cart!"+ "get Quantity"+ quantity);

			Integer cartProductId = COPService.checkItemList(userid, productId);
			Optional<CartOfProduct> amount = COPService.findById(cartProductId);
			// System.out.println("amount:" + amount + "cartProductId:"+ cartProductId);
			Integer itemquantity = amount.get().getQuantity();
			
		
			c1.setQuantity(itemquantity + quantity);
			
			c1.setCartProductId(cartProductId);
			COPService.update(c1);
		} else {
			System.out.println("do insert cart!");
			COPService.insert(c1) ;
		}
		return "redirect:/product"; // 停留在商品頁 //去新的controller才要用redirect:/
	}
	
	// 從商品頁按鈕進入購物車 - (2) 一次加多個 (新增)
		// 進入商品頁網址: http://localhost:8091/Epicer/addproducttocart
		@PostMapping(path = "/addselectproducttocart")
//		@RequestParam("userid") Integer userId, 
		public String processSelectItemAddAction(Integer userId,Integer productId,Integer selectQuantity, Model m){
			System.out.println("addtocart--userid"+userId);
			//Integer quantity = 1;
			EpicerUser cartUser = new EpicerUser();

			cartUser.setId(userId);
			Product cartProduct = new Product();
			cartProduct.setProductId(productId);
			CartOfProduct c1 = new CartOfProduct(cartUser, cartProduct, selectQuantity);
			

			// 先查詢購物車是否有重複userId+productId->if有，則查出cartId然後修改;if無，則新增
			if (COPService.checkItemList(userid, productId) != null) {
				System.out.println("do update cart!"+ "get selectQuantity"+ selectQuantity);

				Integer cartProductId = COPService.checkItemList(userid, productId);
				Optional<CartOfProduct> amount = COPService.findById(cartProductId);
				// System.out.println("amount:" + amount + "cartProductId:"+ cartProductId);
				Integer itemquantity = amount.get().getQuantity();
				
			
				c1.setQuantity(itemquantity + selectQuantity);
				
				c1.setCartProductId(cartProductId);
				COPService.update(c1);
			} else {
				System.out.println("do insert cart-selectQuantity!");
				COPService.insert(c1) ;
			}
			return "redirect:/product"; // 停留在商品頁 //去新的controller才要用redirect:/
		}
		
		// 從商品獨立面頁按鈕進入購物車 - (3) 一次加多個 (新增)
		// 進入商品頁網址: http://localhost:8091/Epicer/addproducttocart
//		@RequestParam("userid") Integer userId, 
		@GetMapping("/addselectproducttocartforonepg")
		public String SelectItemAction(Integer userId,Integer productId,Integer selectQuantity,Integer stock){
			System.out.println("addtocart--userid"+userId);
			//Integer quantity = 1;
			EpicerUser cartUser = new EpicerUser();

			cartUser.setId(userId);
			Product cartProduct = new Product();
			cartProduct.setProductId(productId);
			CartOfProduct c1 = new CartOfProduct(cartUser, cartProduct, selectQuantity);
			

			// 先查詢購物車是否有重複userId+productId->if有，則查出cartId然後修改;if無，則新增
			if (COPService.checkItemList(userId, productId) != null) {
				System.out.println("do update cart!"+ "get selectQuantity"+ selectQuantity);

				Integer cartProductId = COPService.checkItemList(userId, productId);
				Optional<CartOfProduct> amount = COPService.findById(cartProductId);
				
				
				 System.out.println("amount:" + amount.get().getCartProductId() + "cartProductId:"+ cartProductId);
				Integer itemquantity = amount.get().getQuantity();
				
				System.out.println(itemquantity);
				
				
				//判別購物車是否可以加入品項(購物車數量<庫存量)
//				Integer cartAmount = itemquantity + selectQuantity;
//				if(cartAmount<stock) {
//					c1.setQuantity(cartAmount);
//				}else {
//					//如何先回傳說品項超過不給加入購物車啊?
//				 return null;
//				}
			
				c1.setQuantity(itemquantity + selectQuantity);
				
				c1.setCartProductId(cartProductId);
				COPService.update(c1);
			} else {
				System.out.println("do insert cart-selectQuantity!");
				COPService.insert(c1) ;
			}
			
			return "redirect:/productDetail?ProductId="+ productId;
		}
		
		
	

	// 刪除購物車的商品
	@GetMapping("/deleteCartItem")
	public String deleteCartItem(@RequestParam("cartId") Integer cartId) {
		System.out.println("gotoDelete");
		COPService.deleteByCartProductId(cartId);

		return "redirect:/queryusercart";
	}

	// ------------------使用者前台 - 課程購物車--------------------
	// 前端購物車畫面查出課程   //******因課程訂購流程不順暢，這頁畫面不使用******
	// 進入課程購物車網址: http://localhost:8091/Epicer/queryusercartcourse
	@GetMapping(path = "/queryusercartcourse")
	public String processCourseCartQueryAll(Model m) {
		System.out.println("gotoqueryallcart-課程購物車");
//		Integer userid =(Integer)m.getAttribute("userid");
		List<CartOfCourse> beans = COCService.findById2(userid);// 找購物車所有商品
		Integer tQuantity = COCService.totalCartQuantity(userid); // 計算購物車數量
		Integer tPrice = COCService.totalCartPrice(userid); // 計算總金額
		m.addAttribute("courseQueryById", beans);
		m.addAttribute("tQuantity", tQuantity);
		m.addAttribute("tPrice", tPrice);
		// return "cart/frontproductintocart";
		// 改版購物車
		return "cart/frontcartcourse";
	}

	// 從課程總頁按鈕存購物車 (會直接導到訂購畫面)  ---報名1
	// 進入商品頁網址: http://localhost:8091/Epicer/addcoursetocart
	@GetMapping(path = "/addcoursetocart")
//	@RequestParam("userid") Integer userId, 
	public String courseSignupAction(Integer userId, Integer courseId, Model m) {
		System.out.println("addtocart--userid" + userId);
		Integer quantity = 1;
		EpicerUser cartUser = new EpicerUser();
		cartUser.setId(userId);
		Course cartCourse = new Course();
		cartCourse.setCourseId(courseId);
		CartOfCourse c1 = new CartOfCourse(cartUser, cartCourse, quantity);
		
		// 先查詢購物車是否有重複userId(一次只能報名一位)->if有，則查出cartId然後修改;if無，則新增
		if (COCService.checkItemList(userId) != null) {
			System.out.println("do update cart!");

			Integer cartCourseId = COCService.checkItemList(userId);
			Optional<CartOfCourse> amount = COCService.findById(cartCourseId);
			// System.out.println("amount:" + amount + "cartProductId:"+ cartProductId);
			Integer itemquantity = amount.get().getQuantity();
			c1.setQuantity(itemquantity);
			c1.setCartCourseId(cartCourseId);
			COCService.update(c1);
		} else {
			System.out.println("do insert cart!");
			COCService.insert(c1);
		}
//		return "redirect:/queryusercartcourse"; // 直接進入購物車  
		return "redirect:/ordercoursecheck"; //直接跳去訂購填資料畫面
	}
	
	// 從課程獨立頁面進入報名系統 (會直接導到訂購畫面)  ---報名2
		// 進入商品頁網址: http://localhost:8091/Epicer/addcoursetocart
		@PostMapping(path = "/addcoursetocartpost")
//		@RequestParam("userid") Integer userId, 
		public String courseSignupSingleAction(Integer userId, Integer courseId, Model m) {
			System.out.println("addtocart--userid" + userId);
			Integer quantity = 1;
			EpicerUser cartUser = new EpicerUser();
			cartUser.setId(userId);
			Course cartCourse = new Course();
			cartCourse.setCourseId(courseId);
			CartOfCourse c1 = new CartOfCourse(cartUser, cartCourse, quantity);
			
			// 先查詢購物車是否有重複userId(一次只能報名一位)->if有，則查出cartId然後修改;if無，則新增
			if (COCService.checkItemList(userId) != null) {
				System.out.println("do update cart!");

				Integer cartCourseId = COCService.checkItemList(userId);
				Optional<CartOfCourse> amount = COCService.findById(cartCourseId);
				// System.out.println("amount:" + amount + "cartProductId:"+ cartProductId);
				Integer itemquantity = amount.get().getQuantity();
				c1.setQuantity(itemquantity);
				c1.setCartCourseId(cartCourseId);
				COCService.update(c1);
			} else {
				System.out.println("do insert cart!");
				COCService.insert(c1);
			}
//			return "redirect:/queryusercartcourse"; // 直接進入購物車  
			return "redirect:/ordercoursecheck"; //直接跳去訂購填資料畫面
		}
	
	
	
	
	
	
	// 刪除購物車的課程 (但其實可以不刪除，若要換課就直接跳出去重新Insert)
	
	
	
	

}
