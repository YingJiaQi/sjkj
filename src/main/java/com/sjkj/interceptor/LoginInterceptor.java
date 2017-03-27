package com.sjkj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class LoginInterceptor implements HandlerInterceptor{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		/*Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSONArray.toJSONString(principal);
		if(StringUtils.isNoneBlank(jsonString) &&  !(jsonString.equals("null"))){
			JSONObject parseObject = JSON.parseObject(jsonString);
			String userName = parseObject.get("userName").toString();
			if(StringUtils.isBlank(userName)){
				//response.
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}*/
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
