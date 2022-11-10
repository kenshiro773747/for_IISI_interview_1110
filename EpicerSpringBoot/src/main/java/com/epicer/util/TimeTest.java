package com.epicer.util;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;

public class TimeTest {

	public static void main(String[] args) throws ParseException {

		// 當前電腦時間
		long time = System.currentTimeMillis();
		System.out.println(time);

		Date date = new Date(time);
		Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		System.out.println(format.format(date));

//		日期轉毫秒
//		Calendar calendar = Calendar.getInstance();
//		calendar.set(6666, 5, 5, 25, 37);
//		System.out.println(calendar.getTimeInMillis());

		// 毫秒轉日期
//		long time = -6847827760404l;
//		long time2 = 7955084254509l;
//		long time3 = 43017413827378l;
//		long time4 = 78080002654298l;
//		long time5 = 113142332223104l;
//		long time6 = 148204921038086l;
//		
//		long[] a = {time,time2,time3,time4,time5,time6};
//		
//		for (long l : a) {
//			Date date = new Date(l);
//		    Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
//		    System.out.println(format.format(date));
//		}
//	    
	}

	/**
	 * 資料庫毫秒轉日期
	 * 
	 * @param time
	 * @returns
	 */
	public static String transToDate(long time) {
		Date date = new Date(time);
		Format format = new SimpleDateFormat("yyyy/MM/dd ");
		return format.format(date);
	}

	/**
	 * 取得當前電腦時間(發文...)
	 * 
	 * @param time
	 * @return
	 */
	public static Long getTime(long time) {
		time = System.currentTimeMillis();
		return time;

	}

	/**
	 * 取得當前電腦時間(發文...)
	 * 
	 * @param time
	 * @return
	 */
	public static Long getTime() {
		long time = System.currentTimeMillis();
		return time;

	}


	public static Long getLongFromString(String date) {

		// 字串轉毫秒
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return simpleDateFormat.parse(date).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public static String TransLongToString(Long time) {
		Date date = new Date();
		date.setTime(time);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	//////////////////////////date///////////////////////////////

	public static String TransDateToString(Date date) {
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = SDF.format(date);
		return stringDate;
	}

	public static String TransStringToDate(String time) {
		Format format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(time);
	}
	
	 public  String filterNumber(String number)
	 {
	 number = number.replaceAll("[^(0-9)]", "");
	 return number;
	 }
	
	

}
