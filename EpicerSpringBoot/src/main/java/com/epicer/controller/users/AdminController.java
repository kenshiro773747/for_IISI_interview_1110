package com.epicer.controller.users;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
import com.epicer.util.CSVExportUtil;
import com.epicer.util.Tools;

@Controller
@SessionAttributes(names= {"user","sgender","scity","sbirth","list","admin"})
public class AdminController {

	@Autowired
	private RegisterService register;
	@Autowired
	private LoginService login;
	@Autowired
	private ManagementService management;
	
	private static final String localpath = "D:\\EpicerProjectSpringBootFinal\\EpicerSpringBoot\\src\\main\\webapp\\WEB-INF\\resources\\images\\";

	private Tools tools=new Tools();
	
	//????????????
	@PostMapping(path="/admin/export")
	public String exportPage() {
		return"users/AdminExport";
		
	}
	
	
	
	
	//????????????(Security??????????????????)
	@PostMapping(path="/admin/checkpassword")
	public Message checkPassword(@RequestBody EpicerUser user) {
		Message pwdmsg = new Message();
		String account = user.getAccount();
		Message msg = login.checkAccount(account);
		EpicerUser result = (EpicerUser)msg.getObject();
		if(result.getPassword().equals(user.getPassword())) {
			pwdmsg.setCode(0);
			pwdmsg.setMessage("????????????");
			pwdmsg.setObject(result); //?????????domain
		}else {
			pwdmsg.setCode(1);
			pwdmsg.setMessage("????????????");
		}
		return pwdmsg;
	}
	
	
	//????????????(????????????)
	@PostMapping(path="/admin/char")
	public String charjs(Model m,SessionStatus status) {
	return "users/AdminChart";
	}
	
	
	//???????????? ??????
	@GetMapping(path="/gender")
	public ResponseEntity<Message> getGender() {
	List<EpicerUser> list = management.findAll();
    Message msg = new Message();
    int female=0;
    int male =0;
    int amount = list.size();
	for(EpicerUser user:list) {	
	 if(user.getGender()==1) { //???
		 male+=1;
	 }else if(user.getGender()==2) {
		 female+=1;
	 }else {
		 male+=0;
		 female+=0;
	 }
	}
	System.out.println(male);
	System.out.println(female);
	msg.setCode(male);
	msg.setObject(female);
	return new ResponseEntity<Message>(msg,HttpStatus.OK);
	}
	
	
	//???????????? ??????
	@GetMapping(path="/age")
	public ResponseEntity<Map> getAge() {
	List<EpicerUser> list = management.findAll();
    Map map = new HashMap(); //key:18~28 29~39 40~50 51~61 61??????
    int a =0;
    int b =0;
    int c=0;
    int d=0;
    int e =0;
    map.put("eighteen",a);
    map.put("ninteen",b);
    map.put("fourty",c);
    map.put("fivty",d);
    map.put("sixty",e);
    long longdate = new Date().getTime();
    for(EpicerUser user:list) {
    	int age = tools.getAge(user.getBirth());
    	
    	if(age <=28) {
    		int renewa =(int) map.get("eighteen");
    		renewa+=1;
    		map.put("eighteen",renewa);
    	}else if(age >=19 && age <=39) {
    		int renewb =(int) map.get("ninteen");
    		renewb+=1;
    		map.put("ninteen",renewb);
    	}else if(age >=40 && age <=50) {
    		int renewc =(int) map.get("fourty");
    		renewc+=1;
    		map.put("fourty",renewc);
    	}else if(age >=51 && age <=61) {
    		int renewd =(int) map.get("fivty");
    		renewd+=1;
    		map.put("fivty",renewd);
    	}else {
    		int renewe =(int) map.get("sixty");
    		renewe+=1;
    		map.put("sixty",renewe);
    	}
    }
    System.out.println(map.get("fivty"));
    return new ResponseEntity<Map>(map,HttpStatus.OK);
	}
	
	
	
	//???????????? ????????????
	@GetMapping(path="/city")
	public ResponseEntity<Map> getCity(){
		Map map = new HashMap();
		int north =0;
		int center =0;
		int south =0;
		int east =0;
		int island=0;
        map.put("north",north);
        map.put("center",center);
        map.put("south", south);
        map.put("east", east);
        map.put("island",island);
		List<EpicerUser> list = management.findAll();
		for(EpicerUser user:list) {
			int city = user.getCity();
			if(city >=0 && city <=5) {
				int renewn =(int) map.get("north");
				renewn+=1;
				map.put("north",renewn);
			}else if(city >= 6 && city <=10) { //678910
				int renewc =(int) map.get("center");
				renewc+=1;
				map.put("center",renewc);
			}else if(city >= 11 && city <=15) {
				int renews =(int) map.get("south");
				renews+=1;
				map.put("south",renews);
			}else if(city >= 16 && city <=18) {
				int renewe =(int) map.get("east");
				renewe+=1;
				map.put("east",renewe);
			}else {
				int renewi=(int) map.get("island");
				renewi+=1;
				map.put("island",renewi);
			}
		}
		return new ResponseEntity<Map>(map,HttpStatus.OK);
	}
	
	//???????????? ?????????
	@PutMapping(path="/gendertable")
	public ResponseEntity<List> getGenderTable(@RequestBody String append){
		System.out.println(append);
		if(append.equals("male")) {
		List<EpicerUser> list = management.findByGender(1);
		return new ResponseEntity<List>(list,HttpStatus.OK);
		}else if(append.equals("female")) {
			List<EpicerUser> list = management.findByGender(2);
			System.out.println(list.size());
			return new ResponseEntity<List>(list,HttpStatus.OK);
		}else {
			List<EpicerUser> list = management.findByGender(1);
			return new ResponseEntity<List>(list,HttpStatus.OK);
		}
	}
	
	
	//???????????? ???????????????
	@PostMapping(path="/usersamount")
	public ResponseEntity<Integer> getUsersAmount(){
		List<EpicerUser> list = management.findAll();
		Integer result =list.size();
		System.out.println("?????????"+result);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	//???????????? ??????????????????
	@PostMapping(path="/loginamount")
	public ResponseEntity<Integer> getSignUpAmount(){
		List<EpicerUser> list = management.findAll();
		Integer result=0;
		String today = tools.getStringDate(new Date().getTime());
		System.out.println(today);
       for(EpicerUser user:list) {
    	  String logindate = tools.getStringDate(user.getLogindate());
    	  if(logindate.equals(today)) {
    		  result+=1;
    	  }else {
    		  result+=0; 
    	  }
       }
		System.out.println("?????????"+result);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	
	//-24*60*60*1000
	
	
	//???????????? ??????????????????
	@PostMapping(path="/kinologinamount")
	public ResponseEntity<Integer> getKinoLoginAmount(){
		List<EpicerUser> list = management.findAll();
		Integer result=0;
		String yesterday = tools.getStringDate((new Date().getTime())-24*60*60*1000);
		System.out.println(yesterday);
       for(EpicerUser user:list) {
    	  String logindate = tools.getStringDate(user.getLogindate());
    	  if(logindate.equals(yesterday)) {
    		  result+=1;
    	  }else {
    		  result+=0; 
    	  }
       }
		System.out.println("?????????222"+result);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	

	//??????Json
	@GetMapping(value ="/exportcsv123/{gender}", produces = "application/json; charset=utf-8")
    public void download(HttpServletResponse response,@PathVariable("gender") String chose) {
		System.out.println("????????????");
        List<Map<String, Object>> dataList = null;
        int gender=3;
        if(chose.equals("male")) {
        	gender=1;
        }else {
        	gender=2;
        }

        //List<EpicerUser> findAll = management.findAll();// ???????????????????????????
        List<EpicerUser> genderlist = management.findByGender(gender);

        if (genderlist.size() == 0) {
            System.out.println("???????????????");
        }
        String sTitle = "id,??????,??????,??????,??????,???????????????,??????,????????????,????????????,??????";
        String fName = "Gender_"+gender;
        String mapKey = "id,status,account,name,gender,birth,age,address,logindate,note";
        dataList = new ArrayList<>();
        Map<String, Object> map = null;
        for (EpicerUser epiceruser : genderlist) {
            map = new HashMap<>();
            String strgender = tools.getGenderName(gender);
            map.put("id", epiceruser.getId());
            map.put("status", tools.getStatusDes(epiceruser.getStatus()));
            map.put("account",epiceruser.getAccount());
            map.put("name", epiceruser.getName());
            map.put("gender",strgender);
            map.put("birth", tools.getStringDate(epiceruser.getBirth()));
            map.put("age", tools.getAge(epiceruser.getBirth()));
            map.put("address",epiceruser.getAddress());
            map.put("logindate", tools.getStringDate(epiceruser.getLogindate()));
            map.put("note","   ");
System.out.println(strgender+"00000");
            dataList.add(map);
        }
//        OutputStreamWriter osw = new OutputStreamWriter(response.getOutputStream(),"UTF-8");
        try (final OutputStream os = response.getOutputStream()) {
            CSVExportUtil.responseSetProperties(fName,response);
            response.setContentType("UTF-8");
            CSVExportUtil.doExport(dataList, sTitle, mapKey, os);
        } catch (Exception e) {
           e.printStackTrace();
        }
        System.out.println("????????????");
    }
	
	
	
	//??????
	@PostMapping(path = "/admin/back")
		public String backToIndex(Model m,SessionStatus status) {
		EpicerUser user = (EpicerUser)m.getAttribute("user");
		if(user.getStatus()==0) {
			return "users/AdminIndex2";			
		}
		status.setComplete();
		return "users/illegal";
		}
	
	
	//??????????????????(security?????????????????????)
	@PostMapping(path="/checkadminstatus")
	public String checkAdminStatus(Model m,SessionStatus status,HttpSession session) {
	   return this.checkAdminStatus2(m, status, session);
	}
	
	//??????????????????
	@PostMapping(path="/admin/checkadminstatus2")
	public String checkAdminStatus2(Model m ,SessionStatus status,HttpSession session) {
//	          String account =(String)m.getAttribute("account");
	    	  try {
	    		  String account =(String) session.getAttribute("account");
	    		  System.out.println(account); 
	    		  EpicerUser admin = login.showIndex(account);
	    		  login.updateDate(admin);
	    		  m.addAttribute("admin", admin);
	    		  return "users/AdminChart";	
	    	  }catch(Exception e) {
	    		  EpicerUser admin = (EpicerUser)m.getAttribute("admin");  
	    		  System.out.println(admin.getAccount()); 
	    		  return "users/AdminChart";	
	    	  }
	    	  }
	
	
	
	//??????????????? (security?????????????????????)
	@PostMapping(path="/adminlogin")
	public String doAdminLogin(@RequestParam("account") String account,@RequestParam String password,Model m,SessionStatus status) {
		 Message msga = login.checkAccount(account);
			if(msga.getCode()==1) { //???????????????
				m.addAttribute("account",account);
				m.addAttribute("password",password);
				m.addAttribute("msga",msga);
				return "users/AdminLoginReset";
			}else {//????????????
				Message msgp = login.cheackPassword(account, password);
				if(msgp.getCode()==1) { //??????????????????
					m.addAttribute("account",account);
					m.addAttribute("password",password);
					m.addAttribute("msgp",msgp);
					return "users/AdminLoginReset";
				}else { //????????????
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
					if(user.getStatus()==0) {
						return "users/AdminIndex2";
					}else {
						status.setComplete();
						return "users/illegal"; //???????????????????????????		
					}
				}
			}
		}
	
	
	//???????????????????????????
	@PostMapping(path="/admin/user")
	public String getAllUsers(@RequestParam("status") int status,Model m,SessionStatus sessionstatus) {
		if(status == 7) {
			List<EpicerUser> list = management.findAll();
			m.addAttribute("list",list);
			return "users/Adminusersdata";
		}else {
			List<EpicerUser> list = management.doSearch(status);
			m.addAttribute("list",list);
			return "users/Adminusersdata";
		}
//		if(list == null) {
//		 return "users/Adminusersdata";
//		}
//		User admin = (User) m.getAttribute("admin");
//		if(admin.getStatus()==0) {
//			List<User> list = management.doSearch(status);
//			m.addAttribute("list",list);
//			return "users/Adminusersdata";			
//		} //??????????????????
//		sessionstatus.setComplete();
//		return "users/illegal";
	}
	
	
	//???????????????
	@PostMapping(path="/admin/usersdata")
	public String getAllUsersform(Model m,SessionStatus status){
		List<EpicerUser> list = management.findAll();
		m.addAttribute("list",list);
		return "users/Adminusersdata";	
//		User admin= (User)m.getAttribute("admin");
//		if(admin.getStatus()==0) {
//			return "users/Adminusersdata";			
//		}
//		status.setComplete();
//		return "users/illegal";
	}
	
	//??????????????????
	@PostMapping(path="/admin/empregister")
	public String getEmpregister(Model m,SessionStatus status){
		EpicerUser admin = (EpicerUser) m.getAttribute("admin");
		if(admin.getStatus()==0) {
			return "users/AdminRegister";			
		}
		status.setComplete();
		return "users/illegal";
	}
	
	
	//??????????????????
	@RequestMapping (path="/admin/empcheck" , method =RequestMethod.POST) // empregister.jsp
	public String checkEmpAll(
			   @RequestParam("name") String name,@RequestParam("gender") String gender,
			   @RequestParam("birth") String birth,@RequestParam("account") String account,
			   @RequestParam("password") String password,@RequestParam("phone") String phone,
			   @RequestParam("county") String city,@RequestParam("district") String township,
			   @RequestParam("road") String road,Model m) {
				HashMap<String, Message> show = new HashMap<String, Message>();
				int numgender = tools.getGenderNum(gender);
				Long longbirth = tools.getLongFromString(birth);
				int numcity = tools.getCityNum(city);
				EpicerUser user = new EpicerUser(name,numgender, longbirth, account, password, phone, numcity, township, road);
				Message msg = register.checkAccount(user);
				show = register.checkAll(user);
				Message result = show.get("result");
				Message passwordd = show.get("password");
				if(result.getCode() == 0 && msg.getCode() == 0) { //????????????
					m.addAttribute("user",user); 
					String sgender = tools.getGenderName(user.getGender());
					String scity = tools.getCityName(user.getCity());
					String sbirth = tools.getStringDate(user.getBirth());
					m.addAttribute("sgender",sgender);
					m.addAttribute("scity",scity);
					m.addAttribute("sbirth",sbirth);
					return "users/AdminDisplayForm";
				}else { //????????????
				    m.addAttribute("show",show);
				    m.addAttribute("account",msg);
				    m.addAttribute("user",user);
					return "users/AdminRegisterReset";
				}
			}
	
	//????????????
	@RequestMapping (path="/admin/empinsert" , method =RequestMethod.POST) // DisplayForm.jsp
	public String InertEmp(Model m) {
		EpicerUser user = (EpicerUser)m.getAttribute("user");
		user.setStatus(0); //?????????
		long time = new Date().getTime();
		user.setLogindate(time);
		user.setNickname("?????????????????????");
		user.setAvatar("images/default.jpg"); //?????????????????????
        user.setPassword(tools.getEncodePassword(user.getPassword()));
		boolean result = register.InsertClient(user);
		if(result) {
//			String sgender = tools.getGenderName(admin.getGender());
//			String scity = tools.getCityName(admin.getCity());
//			String sbirth = tools.getStringDate(admin.getBirth());
//			m.addAttribute("sgender",sgender);
//			m.addAttribute("scity",scity);
//			m.addAttribute("sbirth",sbirth);
			return "users/AdminIndex2";
		}else {
			return "users/error";
		}
	}
	
	
	//????????????(spring security?????????????????????)
		@RequestMapping(path = "/adminmanagement" ,method=RequestMethod.POST )
		public String showInform(Model m,SessionStatus status) {
			EpicerUser admin = (EpicerUser)m.getAttribute("admin");
			if(admin.getStatus()==0) {
				EpicerUser newadmin = management.showInform(admin.getAccount());
				String sgender = admin.getGenderName(admin.getGender());
				String scity = tools.getCityName(admin.getCity());
				String sbirth = tools.getStringDate(admin.getBirth());
				m.addAttribute("admin",newadmin);
				m.addAttribute("sgender",sgender);
				m.addAttribute("sbirth",sbirth);
				m.addAttribute("scity",scity);
				return "users/AdminManagement";
			}
			status.setComplete();
			return "users/illegal";
		}
		
		
		
		//????????????(test)
		@RequestMapping(path = "/admin/adminmanagement2" ,method=RequestMethod.POST )
		public String showInform(@RequestParam("account")String account,Model m,SessionStatus status) {
			EpicerUser admin = (EpicerUser)m.getAttribute("admin");
			if(admin==null) {
				EpicerUser newadmin = management.showInform(admin.getAccount());
				String sgender = newadmin.getGenderName(newadmin.getGender());
				String scity = tools.getCityName(newadmin.getCity());
				String sbirth = tools.getStringDate(newadmin.getBirth());
				m.addAttribute("admin",newadmin);
				m.addAttribute("sgender",sgender);
				m.addAttribute("sbirth",sbirth);
				m.addAttribute("scity",scity);
				return "users/AdminManagement";
			}else if(admin.getStatus()==0) {
				EpicerUser newadmin = management.showInform(admin.getAccount());
				String sgender = admin.getGenderName(newadmin.getGender());
				String scity = tools.getCityName(newadmin.getCity());
				String sbirth = tools.getStringDate(newadmin.getBirth());
				m.addAttribute("admin",newadmin);
				m.addAttribute("sgender",sgender);
				m.addAttribute("sbirth",sbirth);
				m.addAttribute("scity",scity);
				return "users/AdminManagement";
			}else {
				status.setComplete();
				return "users/illegal";
			}
		}
		
		
		
		
		
		//??????????????????????????????
				@RequestMapping(path = "/admin/adminmodify" ,method=RequestMethod.POST )
				public String showModify2(@RequestParam("submit") String chose,Model m,SessionStatus status) {
					EpicerUser admin = (EpicerUser)m.getAttribute("admin");
					if(admin.getStatus()==0) {
						if(chose.equals("??????")){
							management.showInform(admin.getAccount());
							String sgender = admin.getGenderName(admin.getGender());
							String scity = tools.getCityName(admin.getCity());
							String sbirth = tools.getStringDate(admin.getBirth());
//							m.addAttribute("admin",admin);
//							m.addAttribute("sgender",sgender);
//							m.addAttribute("sbirth",sbirth);
//							m.addAttribute("scity",scity);
							return "users/AdminManagementForm";		
						}else{ //??????
							if(admin.getStatus()==0) {
								return "users/AdminIndex2";
							}
			     			status.setComplete();
							return "users/illegal";
						}
					}else {
						status.setComplete();
						return "users/illegal";
					}
					
				}
		
		
		//????????????????????????(spring security?????????????????????)
		@RequestMapping(path = "/adminmodify" ,method=RequestMethod.POST )
		public String showModify(@RequestParam("submit") String chose,Model m,SessionStatus status) {
			EpicerUser user = (EpicerUser)m.getAttribute("user");
			if(user.getStatus()==0) {
				if(chose.equals("??????")){
					EpicerUser admin = management.showInform(user.getAccount());
					String sgender = admin.getGenderName(admin.getGender());
					String scity = tools.getCityName(admin.getCity());
					String sbirth = tools.getStringDate(admin.getBirth());
					m.addAttribute("user",admin);
					m.addAttribute("sgender",sgender);
					m.addAttribute("sbirth",sbirth);
					m.addAttribute("scity",scity);
					return "users/AdminManagementForm";		
				}else{ //??????
					if(user.getStatus()==0) {
						return "users/AdminIndex2";
					}
	     			status.setComplete();
					return "users/illegal";
				}
			}else {
				status.setComplete();
				return "users/illegal";
			}
			
		}
		
		
		//????????????????????????
		@RequestMapping(path = "/admin/doadminmodify" ,method=RequestMethod.POST )
		public String doModify2(@RequestParam("submit") String chose,@RequestParam("nickname") String nickname,
				@RequestParam("password") String password,@RequestParam("id") int id,
				@RequestParam("phone") String phone,@RequestParam("county") String city,
				@RequestParam("district") String township,@RequestParam("road") String road,
				@RequestParam("myfile") MultipartFile file,Model m,SessionStatus status) throws IllegalStateException, IOException {
			if(chose.equals("??????")) {
				EpicerUser result = management.findById(id);
				int numcity = tools.getCityNum(city);
				result.setPassword(password);
				result.setNickname(nickname);
				result.setPhone(phone);
				result.setCity(numcity);
				result.setTownship(township);
				result.setAddress(road);
				HashMap<String, Message> show = management.checkAll(result);
				if(show.get("result").getCode()==1) {
					m.addAttribute("show",show); //request scope
					return "users/AdminManagementForm";
				}else { //????????????????????????
					String filename = file.getOriginalFilename();
					File fullpath = new File(localpath,filename);
					file.transferTo(fullpath);
					if(file.getName()!=null && file.getName().length() !=0) {
						result.setPassword(tools.getEncodePassword(password));
						EpicerUser admin = management.updateUser(result,filename);   		
						//????????????
//						m.addAttribute("user",admin);
						String path = this.showInform(m,status);
						return path;
					}
				}
			}
			return "users/AdminManagement";
		}
		
		
		//????????????????????????(spring security?????????????????????)
		@RequestMapping(path = "/doadminmodify" ,method=RequestMethod.POST )
		public String doModify(@RequestParam("submit") String chose,@RequestParam("nickname") String nickname,
				@RequestParam("password") String password,@RequestParam("id") int id,
				@RequestParam("phone") String phone,@RequestParam("county") String city,
				@RequestParam("district") String township,@RequestParam("road") String road,
				@RequestParam("myfile") MultipartFile file,Model m,SessionStatus status) throws IllegalStateException, IOException {
			if(chose.equals("??????")) {
				EpicerUser result = management.findById(id);
				int numcity = tools.getCityNum(city);
				result.setPassword(password);
				result.setNickname(nickname);
				result.setPhone(phone);
				result.setCity(numcity);
				result.setTownship(township);
				result.setAddress(road);
				HashMap<String, Message> show = management.checkAll(result);
				if(show.get("result").getCode()==1) {
					m.addAttribute("show",show); //request scope
					return "users/AdminManagementForm";
				}else { //????????????????????????
					String filename = file.getOriginalFilename();
					File fullpath = new File(localpath,filename);
					file.transferTo(fullpath);
					if(file.getName()!=null && file.getName().length() !=0) {
						EpicerUser admin = management.updateUser(result,filename);   		
						//????????????
//						m.addAttribute("user",admin);
						String path = this.showInform(m,status);
						return path;
					}
				}
			}
			return "users/AdminManagement";
		}
		
		
		//???????????????????????????(????????????)
//		@PostMapping(path="/delete")
//		public String doDelete(@RequestParam("password") String password,@RequestParam("userid") int id,Model m,SessionStatus status) {
//			User user = (User)m.getAttribute("user");
//			if(user.getStatus()==0) {
//				if(user.getStatus()==0 && password.equals(user.getPassword())) {
//					Message msg = management.deleteById(id);
//					m.addAttribute("msg",msg);
//					return "users/Adminusersdata";			
//				}else {
//					Message msg =new Message();
//					msg.setMessage("??????????????????????????????");
//					m.addAttribute("msg",msg);
//					return "users/Adminusersdata";	
//				}				
//			}else {
//				status.setComplete();
//				return "users/illegal";
//			}
//			
//		}
		
		
		//???????????????????????????(????????????)(spring security?????????????????????)
		@PostMapping(path="/admin/delete")
		public String doDelete(@RequestParam("password") String password,@RequestParam("userid") int id,Model m,SessionStatus status) {
			EpicerUser admin = (EpicerUser)m.getAttribute("admin");
			if(admin.getStatus()==0) {
				if(admin.getStatus()==0 && tools.getComparaion(password, admin.getPassword())) {
					Message msg = management.changeStatusById(id);
					m.addAttribute("msg",msg);
					return "users/Adminusersdata";			
				}else {
					Message msg =new Message();
					msg.setMessage("??????????????????????????????");
					m.addAttribute("msg",msg);
					return "users/Adminusersdata";	
				}				
			}else {
				status.setComplete();
				return "users/illegal";
			}
		}
		
		//???????????????????????????(????????????) (ajax)
		@PostMapping(path="/admin/delete2")
		public ResponseEntity<Message> doDelete2(@RequestBody EpicerUser vertify,Model m,SessionStatus status) {
			EpicerUser admin = (EpicerUser)m.getAttribute("admin");
			System.out.println(admin.getAccount());
			if(admin.getStatus()==0) {
				if(admin.getStatus()==0 && tools.getComparaion(vertify.getPassword(), admin.getPassword())) {
					Message msg = management.changeStatusById(vertify.getId());
					System.out.println(msg.getCode());
               return new ResponseEntity<Message>(msg,HttpStatus.OK);		
				}else {
					Message msg =new Message();
					msg.setCode(1);
					msg.setMessage("??????????????????????????????");
					return new ResponseEntity<Message>(msg,HttpStatus.OK);		
				}				
			}else {
				status.setComplete();
				Message msg =new Message();
				msg.setCode(1);
				msg.setMessage("??????????????????????????????");
				return new ResponseEntity<Message>(msg,HttpStatus.OK);		
			}
		}
		
		
		
		//??????
		@RequestMapping(path="/adminlogout", method=RequestMethod.GET)
		public String doLogout(Model m,SessionStatus status) {
			status.setComplete();
			return "users/index";
		}
	
}
