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
		String city = request.getParameter("city");//城市
		String county = "";//县
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
			    //根据ip查找对应的地区
			    URL url= new URL("http://ip.taobao.com/service/getIpInfo.php?ip="+ip);
			    URLConnection openConnection = url.openConnection();
			    InputStream inputStream = openConnection.getInputStream();
			    String result = org.apache.commons.io.IOUtils.toString(inputStream,"utf-8");
			    JSONObject parseObject = JSONObject.parseObject(result);
			    JSONObject jsonObject = parseObject.getJSONObject("data");
			    String country = jsonObject.get("country")+"";		//所属国家
			    String country_id = jsonObject.get("country_id")+"";//所属国家代码
			    String area = jsonObject.get("area")+"";			//所属区域 [area] => 华南  
			    String area_id = jsonObject.get("area_id")+"";		//所属区域代码 [area_id] => 800000  
			    String region = jsonObject.get("region")+"";		//所属省份 [region] => 广东省  
			    String region_id = jsonObject.get("region_id")+"";	//所属省份代码 [region_id] => 440000  
			    city = jsonObject.get("city")+"";					//所属城市 [city] => 深圳市  
			    String city_id = jsonObject.get("city_id")+"";		//所属城市代码 [city_id] => 440300  
			    county = jsonObject.get("county")+"";				//所属县 [county] =>
			    String county_id = jsonObject.get("county_id")+"";	//所属县代码 [county_id] => -1  
			    String isp = jsonObject.get("isp")+"";				//所属运营商  [isp] => 电信  
			    String isp_id = jsonObject.get("isp_id")+"";		//所属运营商 代码 [isp_id] => 100017   
			}
			//如果县不为空(county)，city赋值county这样天气信息更精确
			if(StringUtils.isNoneBlank(county)){
				city = county;
			}
			//此时用户传来了具体的城市
			city = java.net.URLEncoder.encode("北京", "utf-8");
			//拼地址
			String apiUrl = String.format("http://www.sojson.com/open/api/weather/json.shtml?city=%s",city);
			//开始请求
			URL url= new URL(apiUrl);
			URLConnection open = url.openConnection();
			InputStream input = open.getInputStream();
			//这里转换为String，带上包名，怕你们引错包
			String result = org.apache.commons.io.IOUtils.toString(input,"utf-8");
			JSONObject parseObject = JSONObject.parseObject(result);
			parseObject.put("success", "true");
			//请求成功
			return new ResponseEntity<Object>(parseObject,HttpStatus.OK);
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
