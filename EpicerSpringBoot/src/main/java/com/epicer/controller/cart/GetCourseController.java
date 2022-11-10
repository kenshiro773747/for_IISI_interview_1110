package com.epicer.controller.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.epicer.model.course.Course;
import com.epicer.model.product.Product;
import com.epicer.service.cart.ProductQueryService;
import com.epicer.service.course.CourseService;
import com.epicer.service.course.TeacherService;
import com.epicer.util.TimeTest;

@Controller
@RequestMapping
@SessionAttributes(names = {"totalPages","totalElements","queryallcourse"})//操作分頁查詢用
public class GetCourseController {
	
	@Autowired
	private CourseService CS;
	
	@Autowired
	private TeacherService TS;
	
	
	private TimeTest TT = new TimeTest();
	
	
	//進入商品頁網址: http://localhost:8091/Epicer/productmenu
//	@GetMapping("/productmenu")
//	public String processProductMainAction() {
//		System.out.println("gotomenu");
//		return "cart/frontproductmenu";
//	}
	
	//前端畫面查全部課程
	//進入商品頁網址: http://localhost:8091/Epicer/queryallcoursemenu
	@GetMapping(path = "/queryallcoursemenu")
	public String processActionCourseQueryAll(Model m){
		System.out.println("gotoqueryallmenu-課程");
		List<Course> list = CS.findAllCourse();
		m.addAttribute("queryallcourse", list);	
		return "cart/frontcoursemenu";
	}
	
}
