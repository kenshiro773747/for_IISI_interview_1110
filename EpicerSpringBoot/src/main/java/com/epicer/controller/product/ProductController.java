package com.epicer.controller.product;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.product.Product;
import com.epicer.model.product.ProductLike;
import com.epicer.model.users.EpicerUser;
import com.epicer.service.product.ProductLikeService;
import com.epicer.service.product.ProductService;
import com.epicer.util.CSVExportUtil;

@Controller
@SessionAttributes(names= {"user","sgender","scity","sbirth","list","admin"})
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductLikeService productLikeService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private SessionFactory factory;
	
//	後台首頁為http://localhost:8081/product
	@GetMapping("/productManage")
	private String findAll(Model m) {
		List<Product> beans=productService.findAll();
		m.addAttribute("findAll",beans);
		return "product/adminProduct";
	}
//	Ajax寫法弄首頁
	@GetMapping("/productAjax")
	private String findAllAjax(Model m) {
		List<Product> beans=productService.findAll();
		m.addAttribute("findAll",beans);
		return "product/adminProductAjax";
	}
	
//搜尋並回傳JSON
	@GetMapping("/productManageAjax")
	@ResponseBody
	private List<Product> findAllJSONAjax() {
		List<Product> beans=productService.findAll();
		return beans;
	}
	
//	registry.addResourceHandler("productCategory/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
//	要加上面那行才可以
//	@GetMapping(path="/productCategory/{productCategoryId}")
//	public String findCategoryAll(@PathVariable("productCategoryId") Integer productCategoryId ,Model m) {
//		System.out.println(productCategoryId);
//		List<Product> beans=productService.findCategoryAll(productCategoryId);
//		m.addAttribute("findCategoryAll",beans);
//		System.out.println(beans.get(1));
//		return "product/adminProductCategory";
//	}
	
//	分兩頁的寫法
//	@GetMapping(path="/productCategory")
//	public String findCategoryAll(@RequestParam("productCategoryId") Integer productCategoryId ,Model m) {
//		List<Product> beans=productService.findCategoryAll(productCategoryId);
//		m.addAttribute("findCategoryAll",beans);
//		return "product/adminProductCategory";
//	}
	
//	原來的方法
	@GetMapping(path="/productCategory")
	public String findCategoryAll(@RequestParam("productCategoryId") Integer productCategoryId ,Model m) {
		List<Product> beans=productService.findCategoryAll(productCategoryId);
		m.addAttribute("findAll",beans);
		return "product/adminProduct";
	}
	
//	Ajax
	@GetMapping(path="/productCategoryAjax/{productCategoryId}")
	@ResponseBody
	public List<Product> findCategoryAll(@PathVariable("productCategoryId") Integer productCategoryId ) {
		List<Product> beans=productService.findCategoryAll(productCategoryId);
		return beans;
	}
	
	
	
	@GetMapping("/insertProduct")
	public String insertProduct() {
		return "product/adminProductInsert";
	}
	
	@PostMapping("/insertProductAction")
//	public String insertProductAction(Product bean )  {
		public String insertProductAction(@RequestParam("productName") String productName,
				@RequestParam("productCategoryId") Integer productCategoryId, @RequestParam("productImage") MultipartFile mf,
				@RequestParam("productUnit") String productUnit, @RequestParam("productPrice") Integer productPrice,
				@RequestParam("productOrigin") String productOrigin,@RequestParam("productStock") Integer productStock,
				@RequestParam("productStatus") Integer productStatus,@RequestParam("productDescription") String productDescription,
				@RequestParam("productDetails") String productDetails,@RequestParam("productHot") Integer productHot
				) throws IllegalStateException, IOException {
		
		System.out.println(productDetails);
//		存入該專案的位置寫法
		String classLocalPath =this.getClass().getClassLoader().getResource("").getPath();
		String classLocalPathModify= classLocalPath.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		String saveFileDir= classLocalPathModify+"webapp/WEB-INF/resources/images"; 
//		用產品名稱來設定檔案名
//		String fileName="product"+productName;
		String fileLocalPath = "images/"+mf.getOriginalFilename();
//	    存檔
		File saveFilePath =new File(saveFileDir,mf.getOriginalFilename());
		mf.transferTo(saveFilePath);
//		存入資料庫的寫法
//		byte[] b=mf.getBytes();
//		bean.setProductImage(b);
		Product bean = new Product(productName, productCategoryId, productUnit, productPrice, productOrigin, productStock, productStatus, productDescription,productDetails, fileLocalPath,productHot);
		bean.setProductImage(fileLocalPath)	;
		
		productService.insert(bean);
		return "redirect:productAjax";//要回controller可以用redirect
	}
	
	@PostMapping("/updateProduct")
//    public String updateProduct() {
	public String updateProduct(@RequestParam("ProductId") Integer productId,Model m ) {
		System.out.println(productId);
		Product product = productService.getById(productId);
		System.out.println("123"+product.getProductHot());
		m.addAttribute("product", product);
		return "product/adminProductUpdate";
	}
	
//	還沒加照片
//	public String updateProductAction(Product bean) {
//		productService.update(bean);
//		return "redirect:product";
//	}
	
	@PostMapping("/updateProductAction")
	public String updateProductAction(Model m, @RequestParam("ProductId") Integer productId, @RequestParam("productName") String productName,
			@RequestParam("productCategoryId") Integer productCategoryId, @RequestParam("productImage") MultipartFile mf,
			@RequestParam("productUnit") String productUnit, @RequestParam("productPrice") Integer productPrice,
			@RequestParam("productOrigin") String productOrigin,@RequestParam("productStock") Integer productStock,
			@RequestParam("productStatus") Integer productStatus,@RequestParam("productDescription") String productDescription,
			@RequestParam("productDetails") String productDetails,@RequestParam("productHot") Integer productHot, String oldimg 
			) throws IllegalStateException, IOException {
		
		System.out.println(productDetails);
		
		if (mf.isEmpty()) {
		
			Product bean = new Product(productId, productName, productCategoryId, productUnit, productPrice, productOrigin, productStock, productStatus, productDescription,productDetails,oldimg,productHot);
			System.out.println(bean);
			productService.update(bean);
			
			
		} else {
			
//			存入該專案的位置寫法
			String classLocalPath =this.getClass().getClassLoader().getResource("").getPath();
			String classLocalPathModify= classLocalPath.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
			String saveFileDir= classLocalPathModify+"webapp/WEB-INF/resources/images"; 
			System.out.println(classLocalPath);
//			/D:/Epicer/EpicerSpringBoot/target/classes/
//			用產品名稱來設定檔案名
//			String fileName="product"+productName+".jpg";
			String fileLocalPath = "images/"+mf.getOriginalFilename();
			//		    存檔
			File saveFilePath =new File(saveFileDir,mf.getOriginalFilename());
			System.out.println(mf.getOriginalFilename());
			mf.transferTo(saveFilePath);
//			存入資料庫的寫法
//			byte[] b=mf.getBytes();
//			bean.setProductImage(b);
			Product bean = new Product(productId, productName, productCategoryId, productUnit, productPrice, productOrigin, productStock, productStatus, productDescription,productDetails, fileLocalPath,productHot);
			System.out.println(bean);
			productService.update(bean);
		}
	return "redirect:productAjax";
}
	
	
	@PostMapping("/deleteProductAction")
	public String deleteProductAction(Product bean) {
		productService.delete(bean.getProductId());
		return "redirect:productAjax";
	}
	
	
	@GetMapping("/likeProduct")
	public String likeProductAction(@RequestParam("ProductId") Integer productId) {
		if (session.getAttribute("userId") == null) {
			return "frontframeblankpgs/login";
		} else {
			int userid = (int) session.getAttribute("userId");
			System.out.println(userid);

//		開連線拿Product
			Session s = factory.openSession();
			Product product =s.get(Product.class, productId);
			s.close();
			System.out.println(product.getProductName());
			
			ProductLike like=new ProductLike(userid, product);
			ProductLike oldProductLike = productLikeService.findProductLike(productId,userid);
			System.out.println(oldProductLike);
			
			if (oldProductLike != null) {
				productLikeService.delete(productId,userid);
			}else {
				productLikeService.insert(like);
			}
			return "redirect:product";
		}
	}
	
	
	
	
//	@GetMapping("/likeProduct")
//	public String likeProductAction(@RequestParam("ProductId") Integer productId,Model m) {
//		System.err.println("1");
//		if (m.getAttribute("user") == null) {
//			return "frontframeblankpgs/login";
//		} else {
//			System.err.println("2");
//		   EpicerUser user = (EpicerUser) session.getAttribute("user");
//		   int userid = user.getId();
//			System.out.println(userid);
//
//		//開連線拿Product
//			Session s = factory.openSession();
//			Product product =s.get(Product.class, productId);
//			s.close();
//			
//			ProductLike like=new ProductLike(userid, product);
//			ProductLike oldProductLike = productLikeService.findProductLike(productId,userid);
//			System.out.println(oldProductLike);
//			
//			if (oldProductLike != null) {
//				System.err.println("3");
//				productLikeService.delete(productId,userid);
//			}else {
//				System.err.println("4");
//				productLikeService.insert(like);
//			}
//			System.err.println("5");
//			return "redirect:product";
//		}
//	}
	
	
	
	
	
//	商品細節頁面，收藏商品後並跳轉到商品原頁面
	@GetMapping("/likeProduct2")
	public String likeProductAction2(@RequestParam("ProductId") Integer productId) {
		if (session.getAttribute("userId") == null) {
			return "frontframeblankpgs/login";
		} else {
			int userId = (int) session.getAttribute("userId");
			System.out.println(userId);
			
//		開連線拿Product
			Session s = factory.openSession();
			Product product =s.get(Product.class, productId);
			s.close();
			
			ProductLike like=new ProductLike(userId, product);
			ProductLike oldProductLike = productLikeService.findProductLike(productId, userId);
			System.out.println(oldProductLike);
			
			if (oldProductLike != null) {
				productLikeService.delete(productId,userId);
			}else {
				productLikeService.insert(like);
			}
			return "redirect:productDetail?ProductId="+productId ;
		}
	}
	
	
	@GetMapping("/findProductAllLike")
	public Integer findProductAllLike(@RequestParam("ProductId") Integer productId) {
		Integer likes = productLikeService.findProductAllLike(productId);
		System.out.println(likes);
		return likes;
		}
	
	
	
//	刪除收藏商品
	@GetMapping("/deleteLikeProduct")
	public String deleteLikeProductAction(@RequestParam("ProductId") Integer productId) {
		int userId = (int) session.getAttribute("userId");
//		開連線拿Product
		Session s = factory.openSession();
		Product product =s.get(Product.class, productId);
		s.close();
		
		ProductLike like=new ProductLike(userId, product);
		ProductLike oldProductLike = productLikeService.findProductLike(productId, userId);
		System.out.println(oldProductLike);
		
		if (oldProductLike != null) {
			productLikeService.delete(productId,userId);
		}else {
			productLikeService.insert(like);
		}
		return "redirect:productLike";
	}
	
	
	
	
	
//	@GetMapping("/productLike")
//	public String frontProductLike() {
//		int userId = (int) session.getAttribute("userId");
//		return "product/productLike";
//	}
	
//	商品收藏頁面
	@GetMapping("/productLike")
	public String findLikeProductAction(Model m) {
		if (session.getAttribute("userId") ==null) {
			return "frontframeblankpgs/login";
		} else {

			int userId = (int) session.getAttribute("userId");
			List<ProductLike> product = productLikeService.findLikeProductsByUserId(userId);
			
			List<Product> a = new ArrayList<Product>();
			for (ProductLike productLike : product) {
				a.add(productLike.getProduct());
			}
			m.addAttribute("find",a);
			System.out.println(userId);
			return "product/productLike";
		}
		
		
		
	}
	
	
	
	// EPICER測試前台登入頁面
		// 連線網址路徑: http://localhost:8091/
//	frontframeblankpgs/shopsidebar
//	frontframeblankpgs/productsingle
		@GetMapping("/product")
		public String frontFindAll(Model m) {
//			找出上架中商品
			List<Product> beans=productService.findOnShelf(1);
			m.addAttribute("findAll",beans);
//			找出熱賣商品
			List<Product> sale=productService.findOnSale(1);
			for (Product product : sale) {
				System.out.println(product.getProductImage());
			}
			m.addAttribute("findOnSale",sale);
			
			
//			int userId = (int) session.getAttribute("userId");
//			List<ProductLike> productLike = productLikeService.findLikeProductsByUserId(userId);
//			List<Integer> likesProductId = new ArrayList<Integer>();
//			for (ProductLike productLike2 : productLike) {
//				likesProductId.add(productLike2.getProduct().getProductId());
//			}
//			System.out.println(likesProductId);
//			m.addAttribute("likes",productLike);
			
			return "product/productWithSidebar";
		}
		
//		找出所有消費者收藏的商品ID(Ajax)
		@GetMapping(path="/findAllLike")
		@ResponseBody
		public List<Integer> findAllLike() {
			int userId = (int) session.getAttribute("userId");
			List<ProductLike> productLike = productLikeService.findLikeProductsByUserId(userId);
			List<Integer> likesProductId = new ArrayList<Integer>();
			for (ProductLike productLike2 : productLike) {
				likesProductId.add(productLike2.getProduct().getProductId());
			}
			System.out.println(likesProductId);
			System.out.println(userId);
			return likesProductId;
		}
		
//		找出商品ID被收藏幾次(Ajax)
//		@GetMapping(path="/findLikes")
//		@ResponseBody
//		public List<Integer> findLikes() {
//			int userId = (int) session.getAttribute("userId");
//			List<ProductLike> productLike = productLikeService.findLikeProductsByUserId(userId);
//			List<Integer> likesProductId = new ArrayList<Integer>();
//			for (ProductLike productLike2 : productLike) {
//				System.out.println(productLike2.getProduct().getProductId());
//				likesProductId.add(productLike2.getProduct().getProductId());
//			}
//			System.out.println(likesProductId);
//			System.out.println(userId);
//			return likesProductId;
//		}
		
		
		@GetMapping(path="/category")
		public String frontFindCategoryAll(@RequestParam("productCategoryId") Integer productCategoryId ,Model m) {
			List<Product> beans=productService.findCategoryAll(productCategoryId);
			m.addAttribute("findAll",beans);
			
//			找出熱賣商品
			List<Product> sale=productService.findOnSale(1);
			for (Product product : sale) {
				System.out.println(product.getProductImage());
			}
			m.addAttribute("findOnSale",sale);
			return "product/productWithSidebar";
		}
		
	
		@GetMapping("/productDetail")
		public String frontProductDetail(@RequestParam("ProductId") Integer productId,Model m) {
			System.out.println(productId);
			Product product = productService.getById(productId);
			m.addAttribute("findDetail",product);
			Integer likes = productLikeService.findProductAllLike(productId);
			m.addAttribute("likes",likes);
			
			System.out.println(likes);
			return "product/productDetail";
		}
		
//		舊的商品收藏
//		@GetMapping("/productFavorite")
//		public String frontProductFavorite() {
//			return "product/productFavorite";
//		}
		
		
	
		@GetMapping("/productAnalytics")
		public String frontProduct(Model m) {
			Integer q1 = productService.query1();
			m.addAttribute("q1",q1);
			Product q2 = productService.query2();
			m.addAttribute("q2",q2);
			Product q3 = productService.query3();
			m.addAttribute("q3",q3);
			Integer q4 = productLikeService.query4();
			m.addAttribute("q4",q4);
			return "product/adminProductAnalytics";
		}
		
		@GetMapping("/productTest")
		public String frontProduct() {
			return "product/productAnalytics";
		}
		
		
//		輸出CSV
		@PostMapping(value ="/exportcsv", produces = "application/json; charset=utf-8")
	    public void download(HttpServletResponse response)  {
			

	        //List<EpicerUser> findAll = management.findAll();// 查詢到要導出的信息
	        List<Product> list = productService.findAll();

	        List<Map<String, Object>> dataList = null;
	        if (list.size() == 0) {
	            System.out.println("無數據導出");
	        }



//	        String sTitle = "商品名稱,單位,庫存,價格,產地,上架狀態,商品描述"; //(改成自己的欄位名稱)
	        String sTitle = "商品名稱,單位,庫存,價格,產地,上架狀態"; //(改成自己的欄位名稱)
	        String fName = "Product";//(改成自己的檔案名稱，不要有中文)

	        String mapKey = "name,unit,stock,price,origin,status"; //(要跟sTitle對得上)

	        dataList = new ArrayList<>();
	        Map<String, Object> map = null;

	        for (Product epiceruser : list) {
	            map = new HashMap<>();
	            map.put("name", epiceruser.getProductName());
	            map.put("unit",epiceruser.getProductUnit());
	            map.put("stock",epiceruser.getProductStock());
	            map.put("price",epiceruser.getProductPrice());
	            map.put("origin",epiceruser.getProductOrigin());
	            map.put("status",epiceruser.getProductStatus());
	            dataList.add(map);
	        }

	//  固定寫法
//	     OutputStreamWriter osw = new OutputStreamWriter(response.getOutputStream(),"UTF-8");
	        try (final OutputStream os = response.getOutputStream()) {
	            CSVExportUtil.responseSetProperties(fName,response);
	            response.setContentType("UTF-8");
	            CSVExportUtil.doExport(dataList, sTitle, mapKey, os);
	        } catch (Exception e) {
	           e.printStackTrace();
	        }
	        System.out.println("完成です");
	    }

	
}
