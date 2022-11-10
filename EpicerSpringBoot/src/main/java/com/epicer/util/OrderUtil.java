package com.epicer.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;


public class OrderUtil {
	public OrderUtil() {
		// TODO Auto-generated constructor stub
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
		
	
	    
	    
		
		
		public String StringDateFromDate(Date date) {
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		    String strdate = sdf.format(date);
		    return strdate;
		}
		
//		
		
		
		public  int getAge(long birth) { 
			long date = new Date().getTime();//today
			int age =0;
			age = (int) (Math.floor((date-birth)/(365L * 24 * 3600 * 1000)));
			return age;
			}
		
		
		
			
			public String getGenderName(int gender) {
			    String gendername =" ";
				if(gender == 1) {
					gendername="女性";
					return gendername;
				}else {
					gendername="男性";
					return gendername;
				}
			}
		
		


		public int getGenderNum(String gendername) {
			int gendernum =3; // 男0 女1 預設性別編碼3，不存在
			if(gendername.equals("男性")) {
				gendernum = 0;
				return gendernum;
			}else {
				gendernum = 1;
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
						return result;
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
