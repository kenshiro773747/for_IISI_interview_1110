package com.epicer.service.users;

import java.util.HashMap;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epicer.model.users.Message;
import com.epicer.model.users.EpicerUser;
import com.epicer.model.users.UserRespostity;
import com.epicer.util.Tools;


@Service
@Transactional
public class RegisterService {
	@Autowired
	private UserRespostity ur;
		
	private Tools tools =new Tools();
		

		public HashMap<String,Message> checkAll(EpicerUser user) {
			HashMap<String,Message> show =new HashMap<String,Message>();
			Message name = this.checkName(user);
			Message gender = this.checkGender(user);
			Message age = this.checkAge(user);
			Message password = this.checkPassword(user);
			Message phone = this.checkPhone(user);
			Message city = this.checkCity(user);
			Message township = this.checkTownship(user);
			Message address = this.checkAddress(user);
			int namecode = name.getCode();
			int gendercode = gender.getCode();
			int agecode = age.getCode();
			int pswcode = password.getCode();
			int phonecode = phone.getCode();
			int citycode = city.getCode();
			int tscode = township.getCode();
			int adcode = address.getCode();
			if(namecode == 0 && gendercode == 0 && agecode == 0  && pswcode == 0 && phonecode ==0 && citycode == 0 && tscode == 0 && adcode == 0) {
				Message result = new Message();
				result.setCode(0);
				show.put("result", result);
				show.put("result",result);	
				show.put("name",name);
				show.put("gender",gender);
				show.put("age",age);
				show.put("password",password);
				show.put("phone",phone);
				show.put("city",city);
			    show.put("township",township);
			    show.put("address",address);
			}else {
				Message result = new Message();
				result.setCode(1);
				show.put("result",result);	
				show.put("name",name);
				show.put("gender",gender);
				show.put("age",age);
				show.put("password",password);
				show.put("phone",phone);
				show.put("city",city);
			    show.put("township",township);
			    show.put("address",address);
			}
			return show;
			
		}
		
		
		public boolean InsertClient(EpicerUser user) {
			EpicerUser result = ur.save(user);
			if(result == null) {
				return false;
			}else {
				return true;
			}
		}
		
		public Message checkAccount(EpicerUser user) {
			Message msg = new Message();
			String account = user.getAccount();
			EpicerUser admin = ur.checkAccount(account);
		    if(admin == null) {
		    	msg.setCode(0);
				msg.setMessage("OK");
		    }else {
		    	msg.setCode(1);
				msg.setMessage("帳號已使用，請更改帳號");
		    }
		    return msg;
		}
		
		
		// 不為空，6~18字以內，是否含中文，是否英文數字
			public Message checkPassword(EpicerUser user) {
				String password = user.getPassword();
				Message msg = new Message();
				boolean isempty = tools.isEmpty(password);
				if (isempty) { // 為空
					msg.setCode(1);
					msg.setMessage("密碼不能為空");
				} else {// 不為空
					boolean haschinese = tools.hasChinese(password);
					if (haschinese) { // 含中文
						msg.setCode(1);
						msg.setMessage("密碼不能有中文");
					} else { // 不含中文
						boolean hasengnum = tools.hasEngandNum(password);
						if (hasengnum) { // 含英文數字
							int length = password.length();
							if (length < 8 || length > 16) { // 密碼小於8或超過16
								msg.setCode(1);
								msg.setMessage("密碼為8至16個字元");
							} else {
								msg.setCode(0);
								msg.setMessage("ok");
							}
						} else { // 缺少英文或數字
							msg.setCode(1);
							msg.setMessage("密碼需含英文或數字");
						}
					}

				}
				return msg;
			}

			// 姓名不能為空 不能含英文或數字 姓+名長度>2
			public Message checkName(EpicerUser user) {
				String name = user.getName();
				Message msg = new Message();
				boolean isempty = tools.isEmpty(name);
				if (isempty) { // 姓名為空
					msg.setCode(1);
					msg.setMessage("姓名不能為空");
				} else { // 姓名不為空
					boolean hasengornum = tools.hasEngorNum(name);
					if (hasengornum) { // 姓名含英文或數字
						msg.setCode(1);
						msg.setMessage("請輸入中文姓名");
					} else { // 姓名部含英文或數字
						int length = name.length();
						if (length < 2) { // 姓名長度小於2
							msg.setCode(1);
							msg.setMessage("請輸入有效姓名");
						} else { // 姓名長度大於等於2
							msg.setCode(0);
							msg.setMessage("OK");
						}
					}
				}
				return msg;
			}

			// 性別不能為空
			public Message checkGender(EpicerUser user) {
				int gender = user.getGender();
				Message msg = new Message();
				if (gender == 1 || gender == 2) {
					msg.setCode(0);
					msg.setMessage("ok");
					return msg;
				} else {
					msg.setCode(1);
					msg.setMessage("請選擇性別");
					return msg;
				}
			}

			// 生日不能為空 年齡大於18
			public Message checkAge(EpicerUser user) {
				long birth = user.getBirth();
				Message msg = new Message();
				if (birth<=0) { // 生日為空
					msg.setCode(1);
					msg.setMessage("請選擇出生日期");
				} else { // 不為空
					int age = tools.getAge(birth);
					if (age < 18) {
						msg.setCode(1);
						msg.setMessage("年齡需滿18歲");
					} else {
						msg.setCode(0);
						msg.setMessage("ok");
					}
				}
				return msg;
			}

			// 電話不能為空 不能含中文英文
			public Message checkPhone(EpicerUser user) {
				String phone = user.getPhone();
				Message msg = new Message();
				boolean isempty = tools.isEmpty(phone);
				if (isempty) { // 電話為空
					msg.setCode(1);
					msg.setMessage("連絡電話必填");
				} else { // 電話不為空
					boolean allnum = tools.allNum(phone);
					if (allnum) { // 全為數字
						int length = phone.length();
						if (length == 10) {
							msg.setCode(0);
							msg.setMessage("ok");
						} else {
							msg.setCode(1);
							msg.setMessage("請輸入有效電話");
						}
					} else { // 含非數字
						msg.setCode(1);
						msg.setMessage("請輸入有效電話");
					}

				}
				return msg;
			}

			// 縣市不能為0 且 必須範圍內
			public Message checkCity(EpicerUser user) {
				Message msg = new Message();
				int city = user.getCity();
				if (city == 0 || city > 22) { // 縣市為空 或 超出範圍
					msg.setCode(1);
					msg.setMessage("請選擇縣市");
				} else { // 縣市不為空 且 範圍內
					msg.setCode(0);
					msg.setMessage("ok");
				}
				return msg;
			}

		//區域不能為空
			public Message checkTownship(EpicerUser user) {
				Message msg = new Message();
				String township = user.getTownship();
				boolean isempty = tools.isEmpty(township);
				if (isempty) { // 縣市為空 或 超出範圍
					msg.setCode(1);
					msg.setMessage("區域不能為空");
				} else { // 區域不為空
					msg.setCode(0);
					msg.setMessage("ok");
				}
				return msg;
			}

		//路段不能為空
			public Message checkAddress(EpicerUser user) {
				Message msg = new Message();
				String road = user.getAddress();
				boolean isempty = tools.isEmpty(road);
				if (isempty) { // 縣市為空 或 超出範圍
					msg.setCode(1);
					msg.setMessage("路段不能為空");
				} else { // 區域不為空
					msg.setCode(0);
					msg.setMessage("ok");
				}
				return msg;
			}

			public Message checknick(EpicerUser user) {
				int length = user.getNickname().length();
				Message msg2 = new Message();
				if(length > 16) {
					msg2.setCode(1);
					msg2.setMessage("最多可以使用15個字");
					msg2.setObject(user);
				}else {
					msg2.setCode(0);
					msg2.setMessage("暱稱可以使用");
					msg2.setObject(user);
				}
				return msg2;
			}

	}
	
