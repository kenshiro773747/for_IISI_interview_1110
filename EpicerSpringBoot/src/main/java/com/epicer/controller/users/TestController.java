package com.epicer.controller.users;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.spi.RegisterableService;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.epicer.model.users.ChatClientModel;
import com.epicer.model.users.Comment;
import com.epicer.model.users.DemoUser;
import com.epicer.model.users.Message;
import com.epicer.model.users.ServerResponseModel;
import com.epicer.model.users.EpicerUser;
import com.epicer.service.users.DemoUserService;
import com.epicer.service.users.ManagementService;
import com.epicer.service.users.RegisterService;
import com.epicer.util.CSVExportUtil;
import com.epicer.util.CSVExportUtil;
import com.epicer.util.MailUtil;
import com.epicer.util.PDFFreeMakerUtil;
import com.epicer.util.Tools;
import com.lowagie.text.DocumentException;

import antlr.StringUtils;

@Controller
@SessionAttributes(names={"user"})
public class TestController {

	
	@Autowired
	private DemoUserService dus;
	
	@Autowired
	private MailUtil mail;
	
//	@Autowired
//	private PDFGeneratorService PDF;
	
	@Autowired
	private PDFFreeMakerUtil PDFU;
	
	@Autowired
	private CSVExportUtil csv;
	
	@Autowired
	private ManagementService management;
	
	@Autowired
	private RegisterService register;
	
	private Tools tools =new Tools();
	
	
//	@Autowired
//	private OAuth2AuthorizedClientService authorizedClientService;
//
//	@GetMapping("/google")
//	public String getLoginInfo(Model model, OAuth2AuthenticationToken authentication) {
//	    OAuth2AuthorizedClient client = authorizedClientService
//	      .loadAuthorizedClient(
//	        authentication.getAuthorizedClientRegistrationId(), 
//	          authentication.getName());  //
//	    String email = authentication.getPrincipal().getAttribute("email");
//	    String name = authentication.getPrincipal().getAttribute("name");
//	    System.out.println("email:"+email+",name:"+name);
//	    String userInfoEndpointUri = client.getClientRegistration()
//	    		  .getProviderDetails().getUserInfoEndpoint().getUri();
//	    EpicerUser user = management.findByAccount2(email);
//	    if(user==null) {
//	    	 System.out.println("這");
//	    EpicerUser newUser= new EpicerUser();
//	    newUser.setAccount(email);
//	    newUser.setName(name);
//	    newUser.setLogindate(new Date().getTime());
//	    newUser.setStatus(1);
//	    register.InsertClient(newUser);
//	    model.addAttribute("user",newUser); 
//	    return "users/index"; 
//	    }else {
//	      model.addAttribute("user",user); 
//	    }
//	    return "users/index"; 
//	}
	
	
	@GetMapping(path="/testtt")
	public void findByCommentId() {
		dus.findByCommentId();
	}
	
	@GetMapping(path="/signinjsp")
	public String singinjsp() {
		return "users/test";
	}
	
	@GetMapping(path="/signinjspp")
	public String singinjspp() {
		return "users/AdminExport";
	}
	
	@GetMapping(path="/finalindex")
	public String testjsp() {
		return "frontframeblankpgs/index";
	}
	
	
	@GetMapping(path="/ajaxlogin")
	public String redirect() {
		return "frontframeblankpgs/login";
	}
	
	@GetMapping(path="/cart")
	public String cartjsp() {
		return "users/cart";
	}
	
	@GetMapping(path="/charoom")
	public String chatjsp() {
		return "users/chatroom";
	}
	
	
	@PostMapping(path="/record")
	public ResponseEntity<List<Comment>> record(Model m) {
		EpicerUser user = (EpicerUser)m.getAttribute("user");
		System.out.println(user.getId());
		List<Comment> list = management.findBySenderId(user);
		if(list == null) {
			return new ResponseEntity(null,HttpStatus.OK);
		}else {
			return new ResponseEntity(list,HttpStatus.OK);
		}
		
	}
	
	
	
	@GetMapping(value ="/file", produces = "application/json; charset=utf-8")
	    public void download(HttpServletResponse response) {
	        List<Map<String, Object>> dataList = null;

	        List<EpicerUser> findAll = management.findAll();// 查詢到要導出的信息

	        if (findAll.size() == 0) {
	            System.out.println("無數據導出");
	        }
	        String sTitle = "id,權限,帳號,姓名,性別,出生年月日,年齡,完整地址,上次登錄,備註";
	        String fName = "Users_";
	        String mapKey = "id,status,account,name,gender,birth,age,address,logindate,note";
	        dataList = new ArrayList<>();
	        Map<String, Object> map = null;
	        for (EpicerUser epiceruser : findAll) {
	            map = new HashMap<>();
	            String gender = tools.getGenderName(1);
	            map.put("id", epiceruser.getId());
	            map.put("status", tools.getStatusDes(epiceruser.getStatus()));
	            map.put("account",epiceruser.getAccount());
	            map.put("name", epiceruser.getName());
	            map.put("gender",gender);
	            map.put("birth", tools.getStringDate(epiceruser.getBirth()));
	            map.put("age", tools.getAge(epiceruser.getBirth()));
	            map.put("address",epiceruser.getAddress());
	            map.put("logindate", tools.getStringDate(epiceruser.getLogindate()));
	            map.put("note","   ");
System.out.println(gender);
	            dataList.add(map);
	        }
//	        OutputStreamWriter osw = new OutputStreamWriter(response.getOutputStream(),"UTF-8");
	        try (final OutputStream os = response.getOutputStream()) {
	            CSVExportUtil.responseSetProperties(fName,response);
	            response.setContentType("UTF-8");
	            CSVExportUtil.doExport(dataList, sTitle, mapKey, os);
	        } catch (Exception e) {
	           e.printStackTrace();
	        }
	        System.out.println("完成です");
	    }
	
	
	
	
	
	@GetMapping(path="/index")
	public String processMainAction() {
		return "users/index";
	}
	
	//所有請求
	@GetMapping(path="/login")
	public String loginForm() {
		return "frontframeblankpgs/login";
	}
	
	//Html渲染
//	 @GetMapping("/downloadPdf")
//	    public void downloadPdf(HttpServletResponse response) throws Exception {
//	        EpicerUser user = new EpicerUser();
//	        user.setName("你好");
//	        ByteArrayInputStream byteArrayInputStream = PDFU.exportPdf("test.ftl",user);
//	        response.setContentType("application/octet-stream");
//	        response.setHeader("Content-Disposition", "attachment; filename=receipt.pdf");
//	        IOUtils.copy(byteArrayInputStream, response.getOutputStream());
//	    }
	
	
	//純文
//	@GetMapping(path="/PDF")
//	public void PDFtest(HttpServletResponse res) throws DocumentException, IOException {
//		res.setContentType("application/pdf");
//		DateFormat dateformatter = new SimpleDateFormat("yyyy-MM-dd");
//		 String current = dateformatter.format(new Date());
//		 String headerKey="Content-Disposition";
//		 String headerValue ="attachment;filename=pdf_"+current+"pdf";
//		 res.setHeader(headerKey, headerValue);
//		 PDF.export(res);
//	}
	
	
	@GetMapping(path="/testmail")
	public void mailTest() {
		EpicerUser user = new EpicerUser();
		user.setAccount("860102yeah@gmail.com");
		mail.sendToGmail(user);
	}
	
	
	@GetMapping(path="/blanklogin")
	public String processMainAction2() {
		return "users/blanklogin";
	}
	
	
	@GetMapping(path="/error/404")
	@ResponseBody
		public String forbiddenPage() {
			return "您的權限不足";
		}
	
	//test 非同步
	@PostMapping(path="/logintest")
	@ResponseBody
	public Message testAction(@RequestBody DemoUser user) {
		Message msg = dus.checkAccount(user.getName());
		return msg;
	}
	
	
	@GetMapping(path="/logintest")
	public String processLogin() {
		return "users/Userlogin";
	}
	
//	@PostMapping(path="/dologin")
//	public String doLogin(@RequestParam("name") String name,@RequestParam("password") String password,Model m) {
//		DemoUser result = dus.checkAccount(name);
//		if(result == null) {
//			m.addAttribute("msg","Account is not exist!");
//			return"users/login";
//	}else {
//		if(password.equals(result.getPassword())) {
//			m.addAttribute("user",result);
//			m.addAttribute("msg","sucess");
//			return "users/index";			
//		}else {
//			m.addAttribute("name",name);
//			m.addAttribute("password",password);
//			m.addAttribute("msg","check again your password!");
//			return"users/login";
//		}
//	}
//}
	
	
	
}