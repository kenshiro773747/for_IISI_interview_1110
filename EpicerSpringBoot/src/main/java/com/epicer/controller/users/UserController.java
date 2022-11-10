package com.epicer.controller.users;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;
import javax.persistence.PostRemove;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.users.Message;
import com.epicer.model.users.EpicerUser;
import com.epicer.service.users.LoginService;
import com.epicer.service.users.ManagementService;
import com.epicer.service.users.RegisterService;
import com.epicer.util.MailTemplateUtil;
import com.epicer.util.MailUtil;
import com.epicer.util.PDFFreeMakerUtil;
import com.epicer.util.Tools;


//@RequestMapping(path = "/user" , method = RequestMethod.GET)
@Controller
@SessionAttributes(names= {"user","sgender","scity","sbirth","list","admin"})
public class UserController {
	@Autowired
	private RegisterService register;
	
	@Autowired
	private LoginService login;
	
	@Autowired
	private ManagementService management;
	
	@Autowired
	private MailUtil mailutil;  //純文字
	
	@Autowired
	private MailTemplateUtil mtu;
	
	
	private static final String localpath = "D:\\EpicerProjectSpringBootFinal\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images\\";
	
	private Tools tools=new Tools();
	
	@Autowired
	private OAuth2AuthorizedClientService authorizedClientService;
	
	@Autowired
	private PDFFreeMakerUtil PDFU;
	

	
	//轉
	@GetMapping(path="/turn")
	public String getHomepage(Model m) {
		EpicerUser user =(EpicerUser) m.getAttribute("user");
		System.out.println(user.getAccount());
		m.addAttribute("user", user);
		return "redirect:/homepage";  
	}
	
	
	
	
	//google登錄
//	@GetMapping("/oauth2/authorization/google")
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
	
	
	//what
	@PostMapping(path="/vertifyaccount22")
	public ResponseEntity<Map<String,EpicerUser>> vertifyAccount(Model m){
    System.out.println("in");
	EpicerUser user = (EpicerUser)m.getAttribute("user");
	EpicerUser admin = (EpicerUser)m.getAttribute("admin");
	Map msg = new HashMap();
	
	if(admin == null) {
		 System.out.println("管理者null");
			msg.put("result","N");
			msg.put("user",null);
			if(user == null) { //兩者皆無
				System.out.println("會員null");
				msg.put("result","N");
				msg.put("user",null);
			}else if(user.getStatus()==1) {
				msg.put("result","U");
				msg.put("user",user);
			}else if(user.getStatus()==3) {
				msg.put("result","U2");
				msg.put("user",user);
			}else {
				msg.put("result","X");
				msg.put("user",user);
			}	
	}else {
		msg.put("result","A");
		msg.put("user",admin);
	}
	return new ResponseEntity<Map<String,EpicerUser>>(msg,HttpStatus.OK);
	
	
	}
	
	
	
    //測試
	@GetMapping(path="/exc")
	public void processExceptionAction() throws Exception {
		throw new Exception() ;
	}
	
	
	//註冊
	@GetMapping(path="/form")
	public String RegisterForm() {
		return "frontframeblankpgs/signin";
	}
	
	//Profile_PDF_Download
//	@PostMapping(path="/exportpdf123")
//	public void downloadPdf(HttpServletResponse response,HttpServletRequest request,@RequestBody String pdfchose) throws Exception {
//        System.out.println(pdfchose);
//        management.changeStatusById(0);
//        ByteArrayInputStream byteArrayInputStream = PDFU.exportPdf("test.ftl",user);
//        response.setContentType("application/octet-stream");
//        response.setCharacterEncoding("UTF-8");
//        response.setHeader("Content-Disposition", "attachment; filename=receipt.pdf");
//        IOUtils.copy(byteArrayInputStream, response.getOutputStream());
//    }
	
	
	//視圖
	@GetMapping(path="/forgetpassword")
	public String forgetPassword() {
		return "frontframeblankpgs/forgetpassword";
	}
	
	//寄出認證信
    @PostMapping(path="/vertifyemail")
	public ResponseEntity<String> vertifyEmail(@RequestBody EpicerUser user,Model m) {
    Message msga = login.checkAccount(user.getAccount());
    if(msga.getCode()==0) { //帳號存在
    	user = (EpicerUser)msga.getObject();
    	m.addAttribute("vertify",user); //驗證信箱後，找出整筆會員資料
    	try {
			mtu.sendMessageWithFreemarkerTemplate("changepassword.ftl", user);
			return new ResponseEntity<String>("Y",HttpStatus.OK);    	
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("N",HttpStatus.OK);  
		}
    }else {
    	return new ResponseEntity<String>("N",HttpStatus.OK);  
    }
    }
    
    //中繼站
    @GetMapping(path="/changepassword/{account}")
    public String changePasswordForm(@PathVariable("account") String account,Model m) {
    	EpicerUser user = management.findByAccount(account);
    	m.addAttribute("vertify",user);
    	return "frontframeblankpgs/resetpassword";
    }
    
    //更改密碼
    @PostMapping(path="/dochangepassword")
    public ResponseEntity<String> doChangePassword(@RequestBody EpicerUser vertify,SessionStatus status,Model m) {
        EpicerUser user = management.findById(vertify.getId()); //資料庫的
        System.out.println(vertify.getId());
        System.out.println(vertify.getPassword());
        System.out.println(user.getId());
    	Message msg = management.changePassword(vertify); //輸入的
        if(msg.getCode()==1) { //驗證錯誤
        	status.setComplete();
        	return new ResponseEntity<String>("typeerror",HttpStatus.OK);
        }else { //驗證OK
        	user.setPassword(tools.getEncodePassword(vertify.getPassword()));
        	EpicerUser result = management.updatePassword(user);
        	if(result!=null) { //修改成功
        		status.setComplete();
        		return new ResponseEntity<String>("updateok",HttpStatus.OK);
        	}else{
        		status.setComplete();
        		return new ResponseEntity<String>("systemerror",HttpStatus.OK);
        	}
        }
    }
    
    
	//登出
	@RequestMapping(path="/userlogout", method=RequestMethod.GET)
	public String doLogout(Model m,SessionStatus status) {
		status.setComplete();
		return "users/index";
	}
	
	//從編輯返回
	@PostMapping(path="/userback")
	public String backToManagement() {
		return "frontframeblankpgs/profiledetails";		
	}
	
	
	//進入表格
	@RequestMapping(path = "/usermanagement" ,method=RequestMethod.POST )
	public String showInform(Model m) {
			EpicerUser user = (EpicerUser)m.getAttribute("user");
			EpicerUser uuser = management.showInform(user.getAccount());
			if(uuser.getPassword() == null) {
				String sgender ="尚未驗證";
				String scity ="尚未驗證"; 
				String sbirth ="尚未驗證"; 
				uuser.setAddress("尚未驗證");
				uuser.setPassword("尚未驗證");
				uuser.setPhone("尚未驗證");
				uuser.setTownship("尚未驗證");
				m.addAttribute("user",uuser);
				m.addAttribute("sgender",sgender);
				m.addAttribute("sbirth",sbirth);
				m.addAttribute("scity",scity);
				return "frontframeblankpgs/profiledetails";		
			}else {
				String sgender =uuser.getGenderName(uuser.getGender());
				String scity = tools.getCityName(uuser.getCity());
				String sbirth = tools.getStringDate(uuser.getBirth());
				m.addAttribute("user",uuser);
				m.addAttribute("sgender",sgender);
				m.addAttribute("sbirth",sbirth);
				m.addAttribute("scity",scity);
				return "frontframeblankpgs/profiledetails";							
			}
	}
	
	//進入編輯 或 返回
	@RequestMapping(path = "/usermodify" ,method=RequestMethod.POST )
	public String showModify(@RequestParam("submit") String chose,Model m) {
		if(chose.equals("修改")){
			EpicerUser user = (EpicerUser)m.getAttribute("user");
			EpicerUser admin = management.showInform(user.getAccount());
			if(admin.getPassword() == null) {
				String sgender ="尚未驗證";
				String scity ="尚未驗證"; 
				String sbirth ="尚未驗證"; 
				admin.setAddress("尚未驗證");
				admin.setPassword("尚未驗證");
				admin.setPhone("尚未驗證");
				admin.setTownship("尚未驗證");
				m.addAttribute("user",admin);
				m.addAttribute("sgender",sgender);
				m.addAttribute("sbirth",sbirth);
				m.addAttribute("scity",scity);
				return "frontframeblankpgs/profiledatailscomplete";		
			}else {
			String sgender = admin.getGenderName(admin.getGender());
			String scity = tools.getCityName(admin.getCity());
			String sbirth = tools.getStringDate(admin.getBirth());
			m.addAttribute("user",admin);
			m.addAttribute("sgender",sgender);
			m.addAttribute("sbirth",sbirth);
			m.addAttribute("scity",scity);
			return "frontframeblankpgs/profiledetailsfrom";	
			}
		}else{ //返回
			EpicerUser user = (EpicerUser)m.getAttribute("user");
			String sgender = user.getGenderName(user.getGender());
			String scity = tools.getCityName(user.getCity());
			String sbirth = tools.getStringDate(user.getBirth());
			m.addAttribute("user",user);
			m.addAttribute("sgender",sgender);
			m.addAttribute("sbirth",sbirth);
			m.addAttribute("scity",scity);
			return "frontframeblankpgs/profiledetails";
		}
	}
	
	
	//進行完善
	@PostMapping(path="/docomplete")
	public String doComplete(@RequestParam("submit") String chose,
			@RequestParam("gender") int gender,@RequestParam("birth") String birth,
			@RequestParam("nickname") String nickname,@RequestParam("password") String password,
			@RequestParam("id") int id,@RequestParam("phone") String phone,
			@RequestParam("county") String city,@RequestParam("district") String township,
			@RequestParam("road") String road,@RequestParam("myfile") MultipartFile file,Model m) throws IllegalStateException, IOException {
		EpicerUser user = management.findById(id);
		System.out.println(id);
		int numcity = tools.getCityNum(city);
		Long longbirth = tools.getLongFromString(birth);
		user.setGender(gender);
		user.setBirth(longbirth);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setPhone(phone);
		user.setCity(numcity);
		user.setTownship(township);
		user.setAddress(road);
		HashMap<String, Message> show = management.checkAll(user);
		if(show.get("result").getCode()==1) { //驗證錯誤
			m.addAttribute("show",show); //request scope
			return "users/UserManagementForm";
		}else { //驗證通過開始修改
				String filename = file.getOriginalFilename();
				File fullpath = new File(localpath,filename);
//			byte[] b = file.getBytes();
				file.transferTo(fullpath);
				if(file.getName()!=null && file.getName().length() !=0) {
					//加密密碼
					user.setPassword(tools.getEncodePassword(user.getPassword()));
					user.setStatus(1); //正式會員
					management.updateUser(user,filename);   
					String path = this.showInform(m);
					return path;
				}else { //檔案格式錯誤
					String path = this.showInform(m);
					return path;
				}
		}
		
		
		
	}
	
	
	//進行修改
	@RequestMapping(path = "/domodify" ,method=RequestMethod.POST )
	public String doModify(@RequestParam("submit") String chose,@RequestParam("nickname") String nickname,
			@RequestParam("password") String password,@RequestParam("id") int id,
			@RequestParam("phone") String phone,@RequestParam("county") String city,
			@RequestParam("district") String township,@RequestParam("road") String road,
			@RequestParam("myfile") MultipartFile file,Model m) throws IllegalStateException, IOException {
//		if(chose.equals("確認")) {
			EpicerUser user = management.findById(id);
			int numcity = tools.getCityNum(city);
			System.out.println(id);
			user.setPassword(password);
			user.setNickname(nickname);
			user.setPhone(phone);
			user.setCity(numcity);
			user.setTownship(township);
			user.setAddress(road);
			HashMap<String, Message> show = management.checkAll(user);
			if(show.get("result").getCode()==1) { //驗證錯誤
				m.addAttribute("show",show); //request scope
				return "users/UserManagementForm";
			}else { //驗證通過開始修改
					String filename = file.getOriginalFilename();
					File fullpath = new File(localpath,filename);
//				byte[] b = file.getBytes();
					file.transferTo(fullpath);
					if(file.getName()!=null && file.getName().length() !=0) {
						user.setPassword(tools.getEncodePassword(user.getPassword()));
						management.updateUser(user,filename);   
						String path = this.showInform(m);
						return path;
					}else { //檔案格式錯誤
						String path = this.showInform(m);
						return path;
					}
			}
	}
	
	
	//確認註冊資料
	@RequestMapping (path="/check" , method =RequestMethod.POST) // Register.jsp
   public String checkAll(
		   @RequestParam("name") String name,@RequestParam("gender") String gender,
		   @RequestParam("birth") String birth,@RequestParam("account") String account,
		   @RequestParam("password") String password,@RequestParam("phone") String phone,
		   @RequestParam("county") String city,@RequestParam("district") String township,
		   @RequestParam("road") String address,Model m) {
			HashMap<String, Message> show = new HashMap<String, Message>();
			int numgender = tools.getGenderNum(gender);
			Long longbirth = tools.getLongFromString(birth);
			int numcity = tools.getCityNum(city);
			EpicerUser user = new EpicerUser(name,numgender, longbirth, account, password, phone, numcity, township, address);
			
			Message msg = register.checkAccount(user);			
			show = register.checkAll(user);		
			Message result = show.get("result");
			Message passwordd = show.get("password");
			if(result.getCode() == 0 && msg.getCode() == 0) { //驗證通過
				String sgender = tools.getGenderName(user.getGender());
				String scity = tools.getCityName(user.getCity());
				String sbirth = tools.getStringDate(user.getBirth());
				m.addAttribute("user",user);
				m.addAttribute("sgender",sgender);
				m.addAttribute("scity",scity);
				m.addAttribute("sbirth",sbirth);
				return "frontframeblankpgs/dispaly";
			}else { //驗證有誤
			    m.addAttribute("show",show);
			    m.addAttribute("account",msg);
			    m.addAttribute("user",user);
			    m.addAttribute("birth",tools.getStringDate(user.getBirth()));
			    System.out.println(tools.getStringDate(user.getBirth()));
			    System.out.println(user.getTownship()+1);
				return "frontframeblankpgs/signinreset";
			}
		}
	
	
	//寄出驗證信
	//Display > Vertiry
	@PostMapping(path="/vertifymail")
	public String SendUseremail(Model m,@RequestParam("chose") String chose) {
		if(chose.equals("返回")) {
			return "frontframeblankpgs/signinreset";
		}else {
			EpicerUser user = (EpicerUser)m.getAttribute("user");
//		user.setStatus(1);
			Date a = new Date();
			long time =a.getTime();
			user.setLogindate(time);
			user.setNickname("尼還沒有設定唷");
			user.setAvatar("images/default.jpg");
			m.addAttribute("user",user);
			try {
				mtu.sendMessageWithFreemarkerTemplate("notification.ftl", user);
			} catch (Exception e) {
				e.printStackTrace();
			}  //驗證信		
			return "frontframeblankpgs/vertify"; 
		}
	}
	
	
//insertdata (session)
//新增會員
@RequestMapping (path="/insert" , method =RequestMethod.GET) // DisplayForm.jsp要換path
public String InertCilent(Model m) { 
	EpicerUser user = (EpicerUser)m.getAttribute("user");
	user.setStatus(1);
	Date a = new Date();
	long time =a.getTime();
	user.setPassword(tools.getEncodePassword(user.getPassword()));
	user.setLogindate(time);
	user.setNickname("尼還沒有設定唷");
	user.setAvatar("images/default.jpg");
	boolean result = register.InsertClient(user);
	if(result) {
		String welcome=user.getName()+"歡迎加入！";
		String sgender = tools.getGenderName(user.getGender());
		String scity = tools.getCityName(user.getCity());
		String sbirth = tools.getStringDate(user.getBirth());
		m.addAttribute("sgender",sgender);
		m.addAttribute("scity",scity);
		m.addAttribute("sbirth",sbirth);
		m.addAttribute("welcome",welcome);	
		return "frontframeblankpgs/profiledetails";
	}else {
		return "frontframeblankpgs/404";
	}
}


@GetMapping(path="/userloginform")
public String userLoginForm(Model m) {
	EpicerUser user = (EpicerUser)m.getAttribute("user");
//	User admin = (User)m.getAttribute("admin");
	if(user == null) {
		return "frontframeblankpgs/login";
//		return "users/AdminIndex2";	
//	}else if(admin != null) {
//		 return "users/AdminIndex2";	
	}else {
		 return "frontframeblankpgs/dashboard";
	}
}



@PostMapping(path="/users/checkuserstatus")
public String checkUserStatus(Model m) {
	EpicerUser user = (EpicerUser)m.getAttribute("user");
//	User admin = (User)m.getAttribute("admin");
	if(user == null) {
		return "frontframeblankpgs/login";
//		return "users/AdminIndex2";	
//	}else if(admin != null) {
//		 return "users/AdminIndex2";	
	}else {
		String sgender = tools.getGenderName(user.getGender());
		String scity = tools.getCityName(user.getCity());
		String sbirth = tools.getStringDate(user.getBirth());
		m.addAttribute("user",user);
		m.addAttribute("sgender",sgender);
		m.addAttribute("sbirth",sbirth);
		m.addAttribute("scity",scity);
		return "frontframeblankpgs/profiledetails";		
	}
//	if(user != null) {
//       if(user.getStatus()==1) {
//    	   return "users/Userindex";
//       }else if(user.getStatus()==0){ //0管理者
//    	   return "users/AdminIndex";
//       }else if(admin==null){
//    	   return "users/Userlogin";
//       }else if(admin != null){
//    	   return "users/Userlogin";
//       }else {
//    	   return "users/Userlogin";
//       }
//	}
//	return "users/Userlogin";
}


@PostMapping(path="/checkuserstatus")
public String checkUserStatus2(Model m) {
	EpicerUser user = (EpicerUser)m.getAttribute("user");
//	User admin = (User)m.getAttribute("admin");
	if(user == null) {
		return "frontframeblankpgs/index";
//		return "users/AdminIndex2";	
//	}else if(admin != null) {
//		 return "users/AdminIndex2";	
	}else {
		String sgender ="尚未驗證";
		String scity ="尚未驗證"; 
		String sbirth ="尚未驗證"; 
		user.setAddress("尚未驗證");
		user.setPassword("尚未驗證");
		user.setPhone("尚未驗證");
		user.setTownship("尚未驗證");
		m.addAttribute("user",user);
		m.addAttribute("sgender",sgender);
		m.addAttribute("sbirth",sbirth);
		m.addAttribute("scity",scity);
		return "frontframeblankpgs/profiledetails";	
	}
//	if(user != null) {
//       if(user.getStatus()==1) {
//    	   return "users/Userindex";
//       }else if(user.getStatus()==0){ //0管理者
//    	   return "users/AdminIndex";
//       }else if(admin==null){
//    	   return "users/Userlogin";
//       }else if(admin != null){
//    	   return "users/Userlogin";
//       }else {
//    	   return "users/Userlogin";
//       }
//	}
//	return "users/Userlogin";
}


//login
//path有改 原/login
@RequestMapping (path="/userlogin" , method =RequestMethod.GET) // DisplayForm.jsp
public String Login(@RequestParam("account") String account,@RequestParam String password,Model m) {
	 Message msga = login.checkAccount(account);
	if(msga.getCode()==1) { //帳號不存在
		m.addAttribute("account",account);
		m.addAttribute("password",password);
		m.addAttribute("msga",msga);
		return "frontframeblankpgs/loginreset";
	}else {//帳號存在
		Message msgp = login.cheackPassword(account, password);
		if(msgp.getCode()==1) { //密碼輸入錯誤
			m.addAttribute("account",account);
			m.addAttribute("password",password);
			m.addAttribute("msgp",msgp);
			return "frontframeblankpgs/loginreset";
		}else { //驗證通過
			EpicerUser admin= (EpicerUser)msga.getObject();
			login.updateDate(admin);
			EpicerUser user = login.showIndex(account);
			String sgender = user.getGenderName(user.getGender());
			String sbirth = tools.getStringDate(user.getBirth());
			String scity = tools.getCityName(user.getCity());
			m.addAttribute("user",user);
			m.addAttribute("sgender",sgender);
			m.addAttribute("scity",scity);
			m.addAttribute("sbirth",sbirth);
			if(user.getStatus()==1) {
				return "frontframeblankpgs/dashboard";
			}else if(user.getStatus() ==0) {
				return "users/AdminIndex";
			}else {
				return "users/index";
			}
		}
	}
}

//測試用udatedata
//@RequestMapping(path = "/upload",method=RequestMethod.POST)
//@ResponseBody
//public String uploadImage(@RequestParam("myfile") MultipartFile file) throws IOException {
//	String filename = file.getOriginalFilename();
////	String temppath = "C:\\Action\\worksapce\\MySpringMvcProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
//	File fullpath = new File(localpath,filename);
//	byte[] b = file.getBytes();
//	file.transferTo(fullpath); //檔案上傳指定路徑
//	System.out.println("fullpath = " + fullpath);
//	if(filename !=null && filename.length() !=0) {
//		this.savePicture(filename);
//	}
//		return "savefilepath" + fullpath;		
//}


//測試用
//public boolean savePicture(String filename) {
//	String usepath="images/"+filename;
//	System.out.println(usepath);
//	boolean result = management.updateImage(usepath);
//	if(result) {
//		return true;
//	}else {
//		return false;
//	}
//	
//}

}
	


