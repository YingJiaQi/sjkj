package com.sjkj.utils.times;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DateUtil {
    private static Log log = LogFactory.getLog(DateUtil.class);
	
	public static final String YMD1 = "yyyy-MM-dd";
    public static final String YMD2 = "dd/MM/yy";
    public static final String YMD3 = "yyyyMMdd";
    public static final String YMD4 = "ddMMyyyy";
    public static final String YMD5 = "yyyy-MM";
    public static final String YMD6 = "HH";
    public static final String YMD7 = "yyyy-MM-dd HH:mm";
    public static final String YMD8 = "yyyy";
    public static final String YMD9 = "yyyyMMddHHmm";
    public static final String YMD_FULL = "yyyy-MM-dd HH:mm:ss";
    public static final String NUMBER_INT = "###";
    public static final String NUMBER_FLOAT = "####.##";
    
    
    /**
	* Convert date type from String to Date
	* @param date Sample:2005-10-12
	* @return Date
	*/
    public static String convertToString(Date date,String format) {
    	if(date==null) return "";
    	SimpleDateFormat sdf=new SimpleDateFormat(format);
    	return sdf.format(date);
    }
    
    public static String convertToString(Date date) {
		return convertToString(date,YMD_FULL);
	}
    
    public static Date seekDate(Date date,int dayNum) {
		return  new Date(date.getTime() + (((long)dayNum) * 86400000));
	}
    
    public static Date trimDate(Date date) {
    	Calendar rightNow = Calendar.getInstance();
    	rightNow.setTime(date);
    	
		rightNow.set(Calendar.HOUR_OF_DAY, 0);
		rightNow.set(Calendar.MINUTE, 0);
		rightNow.set(Calendar.SECOND, 0);
        rightNow.set(Calendar.MILLISECOND, 0);
        
    	return  rightNow.getTime();
	}

    public  static int getDayOfMonth(){
        Calendar rightNow = Calendar.getInstance();
        return rightNow.get(Calendar.DAY_OF_MONTH);
    }
    
    public static Date getCurrentDate() {
    	return new Date();
    }
    
    public static int getAge(String birth,String format) {
    	if(birth == null){
    		return 0;
    	}
    	try {
    		return getAge(convertFromString(birth,format));
		} catch (Exception e) {
			log.error(e.toString(),e);
			return 0;
		}
    	
    }
    public static int getAge(Date birth) {
    	if(birth == null){
    		return 0;
    	}
    	Calendar rightNow = Calendar.getInstance();
    	int nowYear = rightNow.get(Calendar.YEAR);
    	rightNow.setTime(birth);
    	int birthYear = rightNow.get(Calendar.YEAR);
    	
    	return nowYear - birthYear;
    	
    }
    
    public static DateFormat getCnDateFormat(String pattern){
		return new SimpleDateFormat(pattern);
	}
    
    public static Date convertFromString(String date,String format) throws Exception{
		if(date==null) return null;
		if(format == null) format = YMD_FULL;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.parse(date);
	}
    
    public static Date convertFromString(String date) throws Exception{
    	return convertFromString(date, null);
    }
    public static Date convertDate(String date) throws Exception{
    	return convertFromString(date, YMD1);
    }
    public static Date convertDateMutip(String date) throws Exception{
    	if(null == date) return null;
    	if(date.length() > 10){
    		return convertFromString(date);
    	}else{
    		return convertDate(date);
    	}
    }
    
	public static double normalMultiply(Double value1,Double value2)throws Exception{
		BigDecimal b1 = new BigDecimal(value1.toString());		
		BigDecimal b2 = new BigDecimal(value2.toString());
		return b1.multiply(b2).doubleValue();
	}
	
	public static double normalAdd(Double value1,Double value2)throws Exception{
		BigDecimal b1 = new BigDecimal(value1.toString());		
		BigDecimal b2 = new BigDecimal(value2.toString());
		return b1.add(b2).doubleValue();
	}
	
	public static void main(String[] args) {
		
//		Calendar rightNow = Calendar.getInstance();
//		rightNow.set(Calendar.HOUR_OF_DAY, 0);
//		rightNow.set(Calendar.MINUTE, 0);
//		rightNow.set(Calendar.SECOND, 0);
//		
//		Date feedTimeBegin = rightNow.getTime();
//		
//		rightNow.add(Calendar.DATE, 1);
//		Date feedTimeEnd = rightNow.getTime();
//		
//		System.out.println(feedTimeBegin);
//		System.out.println(feedTimeEnd);
		String str = "Mon Sep 19 02:15:30 CST 2016";
		try {
			System.out.println(DateUtil.convertFromString(str,YMD7));
		} catch (Exception e) {
			log.error(e.toString(),e);
		}
		
		
	}
	

}
