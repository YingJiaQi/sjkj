package com.sjkj.controller.common;


import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;

/**
 * 获取天气预报
 * @author YJQ
 *
 */
@Controller
@RequestMapping("/common")
public class GetWeatherForecast {
	public static Logger _log = Logger.getLogger(GetWeatherForecast.class);
	
	@RequestMapping(value="getWeatherForecast",method=RequestMethod.GET)
    public ResponseEntity<?> getWeatherForecast(HttpServletRequest request){
		String city = request.getParameter("city");
		try {
			//参数url化
			if(StringUtils.equals(city, "1")){
				//此时是用户没有设定确定的城市天气预报，根据ip,判断用户所在城市
			    String ip = request.getHeader("x-forwarded-for");
			    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			        ip = request.getHeader("Proxy-Client-IP");
			    }
			    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			        ip = request.getHeader("WL-Proxy-Client-IP");
			    }
			    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			        ip = request.getRemoteAddr();
			    }
			    ip = ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
			}else{
				//此时用户传来了具体的城市
				city = java.net.URLEncoder.encode(city, "utf-8");
				//拼地址
				String apiUrl = String.format("http://www.sojson.com/open/api/weather/json.shtml?city=%s",city);
				//开始请求
				URL url= new URL(apiUrl);
				URLConnection open = url.openConnection();
				InputStream input = open.getInputStream();
				//这里转换为String，带上包名，怕你们引错包
				String result = org.apache.commons.io.IOUtils.toString(input,"utf-8");
				JSONObject parseObject = JSONObject.parseObject(result);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	//输出
    	return new ResponseEntity<Object>("",HttpStatus.OK);
    }
}
