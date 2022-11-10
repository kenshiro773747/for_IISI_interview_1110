package com.epicer.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;



public class Tools {
	
	private BCryptPasswordEncoder bc =new BCryptPasswordEncoder();
	
	public Tools() {
		// TODO Auto-generated constructor stub
	}

	
	public String getEncodePassword(String rawPassword) {
		String encodePassword = bc.encode(rawPassword);		
//	    boolean result = bc.matches(rawPassword,encodePassword);
	    System.out.println(encodePassword);
//	    System.out.println(result);
	    return encodePassword;
	}
	
	public boolean getComparaion(String rawPassword,String encodePassword) {
	    boolean result = bc.matches(rawPassword,encodePassword);
	    System.out.println(rawPassword);
	    System.out.println(encodePassword);
	    System.out.println(result);
	    return result;
	}
	
	//產生亂數
	public int randomNum() {
		int random = 0;
		random = (int)(Math.random()*100)+1;
        return random;		
	}
	
	//非空判斷
		public boolean isEmpty(String str) {
			if(str !=null) {
			return false; // 非空
		}else {
			return true; //空值
		}
		}
		
		// || str.trim().length()>0
		
		
		//不能有中文
//	    public void hasChinese(String str) {
//	    	String text = str.trim();
//	    Pattern chinese = Pattern.compile("[\\u4e00-\\u9fa5]+");
//	    Matcher result = chinese.matcher(text);
//	    System.out.print(result.matches());
//	    }
	    
	    //是否含中文
	    public static boolean hasChinese(String str) {
	    	Pattern chinese = Pattern.compile("[\u4e00-\u9fa5]");
	    	Matcher result = chinese.matcher(str);
	    	if (result.find()) {
	    	return true;
	    	}else {
	    	return false;
	    	}
	    	}
	    
	    
	    //是否含英文
	    public static boolean hasEng(String str) {
	    	String text = str.trim();
	    	Pattern eng = Pattern.compile("[A-Za-z]+");
	    	Matcher result = eng.matcher(text);
	    	if(result.find()) {
	    		return true;
	    	}else {
	    		return false;
	    	}
	    }
	    
	    
	    //是否"全為"數字
	    public boolean allNum(String str) {
	    	String text = str.trim();
	    	Pattern num = Pattern.compile("[0-9]+");
	    	Matcher result = num.matcher(str);
	    	if(result.matches()) {
	    		return true;
	    	}else {
	    		return false;
	    	}
	    }
		

	    //是否含英文及數字
	    public boolean hasEngandNum(String str) {
	    	Pattern eng = Pattern.compile("[A-Za-z]+");
	    	Pattern num = Pattern.compile("[0-9]+");
	    	Matcher resulta = eng.matcher(str);
	    	Matcher resultb = num.matcher(str);
	    	if(resulta.find() && resultb.find()) {
	    		return true;
	    	}else {
	    		return false;
	    	}
	    }
	    
	    //是否含英文及數字
	    public boolean hasEngorNum(String str) {
	    	Pattern eng = Pattern.compile("[A-Za-z]+");
	    	Pattern num = Pattern.compile("[0-9]+");
	    	Matcher resulta = eng.matcher(str);
	    	Matcher resultb = num.matcher(str);
	    	if(resulta.find() || resultb.find()) {
	    		return true;
	    	}else {
	    		return false;
	    	}
	    }
	    
	   
	    
		//將毫秒轉為字串
		public static String getStringDate(Long timeMillies)
		{
		    Date date = new Date();
		    date.setTime(timeMillies);
		    SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		    return sdf.format(date);
		}
		
		
		//將毫秒轉為字串 (日期時間)
		public static String getStringDateTime(Long timeMillies)
		{
		    Date date = new Date();
		    date.setTime(timeMillies);
		    SimpleDateFormat sdf =new SimpleDateFormat( "yyyy/MM/dd HH:mm");
		    return sdf.format(date);
		}
		
		
		
		//將字串轉為毫秒
		public  Long getLongFromString(String date) {
	        try {
	            /**
	             * 將字串資料轉化為秒數
	             */
	            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//match <input type="date"> return "yyyy-mm-dd"
	            if (date == null || date.equals("")) //為空或空字串
	            {
	                return null;
	            }
	            return simpleDateFormat.parse(date).getTime(); //getTime(); return milliseconds
	       } catch (Exception e ) 
	        {
	           return null;
	       }
	}
		
		
	public Date dateFromLong(Long mili) throws ParseException {
		        return new Date(mili);  
		    }
		
		
		
		public String StringDateFromDate(Date date) {
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		    String strdate = sdf.format(date);
		    return strdate;
		}
		
//		public  int getAge(String birthDate) { 
//		long date = new Date().getTime();//today
//		int age =0;
//		Long birthMilli = this.getLongFromString(birthDate);
//		age = (int) (Math.floor((date-birthMilli)/(365L * 24 * 3600 * 1000)));
//		return age;
//		}
//		
//		public String getGenderName(int gender) {
//		    String gendername =" ";
//			if(gender == 1) {
//				gendername="女性";
//				return gendername;
//			}else {
//				gendername="男性";
//				return gendername;
//			}
//		}
		
		
		public  int getAge(long birth) { 
			long date = new Date().getTime();//today
			int age =0;
			age = (int) (Math.floor((date-birth)/(365L * 24 * 3600 * 1000)));
			return age;
			}
		
		
		
		//狀態說明
		public String getStatusDes(int status) { //0 1 2 3 4
			String[] StatusDes = {"管理員","正式會員","臨時會員","none","已停權"};
			String des=StatusDes[status];
			System.out.println(des);
			return des;
			
		}
		
		
		//狀態編碼
		public int getStatusDes(String  statusDes) {
		int status=11;
		String[] StatusDes = {"管理員","正式會員","臨時會員","已停權"};
		for(int i=0;i<StatusDes.length;i++) {
			if(statusDes.equals(StatusDes[i])) {
				status=i;
			}
		}
		return status;
		}
		
		
			
			public String getGenderName(int gender) {
			    String gendername ="";
				if(gender == 2) {
					gendername+="女性";
				}else if(gender==1){
					gendername+="男性";
				}else {
					gendername +=" "; 
				}
				return gendername;
			}
		
		


		public int getGenderNum(String gendername) {
			int gendernum =3; // 男0 女1 預設性別編碼3，不存在
			if(gendername.equals("男性")) {
				gendernum = 1;
				return gendernum;
			}else {
				gendernum = 2;
				return gendernum;
			}
		}

		
		//取得城市名稱 0為首
			public String getCityName(int city) {
				String cityname=" ";
		        String[]  allcities = {"基隆市","臺北市","新北市",
		        		"桃園市","新竹市","新竹縣","苗栗縣","臺中市","彰化縣","南投縣",
		        		"雲林縣","嘉義市","嘉義縣","臺南市","高雄市","屏東縣","臺東縣","花蓮縣","宜蘭縣","澎湖縣","金門縣","連江縣"};
		        cityname += allcities[(city)];
		        return cityname;
		}
		
			//取得城市代碼 0為首
			public int getCityNum(String cityName) {
				String[]  allcities = {"基隆市","臺北市","新北市",
		        		"桃園市","新竹市","新竹縣","苗栗縣","臺中市","彰化縣","南投縣",
		        		"雲林縣","嘉義市","嘉義縣","臺南市","高雄市","屏東縣","臺東縣","花蓮縣","宜蘭縣","澎湖縣","金門縣","連江縣"};
				int result=0;
				for(int i =0 ;i<allcities.length;i++) {
					if(cityName.equals(allcities[i])) {
						result = i;
						return result+1;
					}
				}
				return 0;
			}
			
		//取得sql指型態 
			public String getSqltype(Object obj,int index) {
				String selector = String.valueOf(obj);
				String[] colum = {"user_id","user_status","user_name","user_account","user_password","user_nickname","user_gender","user_birth","user_address_city","user_address_road","user_address_township"};
				String sql = colum[index].trim() +"="+selector;  //output user_selector
				return sql;
			}
			
			public String geImageFile(String picname) {
				String filename="images"+"\\";
				String Imagefile=filename.replace(" ","")+picname.replace(" ","");
				return Imagefile;
			}
			
			
		}
