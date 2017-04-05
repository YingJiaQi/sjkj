package com.sjkj.service.pre.preUser;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.MultiValueMap;

import com.sjkj.pojo.pre.PreUser;
import com.sjkj.vo.PageBean;

public interface PreUserService {
	/**
	 * 添加前台用户
	 * @param preUser
	 * @return
	 */
	Map<String, String> addPreUser(PreUser preUser);
	/**
	 * 前台用户登录
	 * @param preUser
	 * @return
	 */
	Map<String, String> preUserLogin(PreUser preUser);
	
	PreUser findPreUserByUsername(String username);
	PreUser findPreUserByUserCode(String substring);
	PreUser findPreUserByUserEmail(String substring);
	/**
	 * 获取前台用户数据
	 * @return
	 */
	Map<String, Object> getUserList(PageBean pageBean);
	/**
	 * 操作用户数据
	 * @param user
	 * @return
	 */
	Map<String, String> operatePreUser(HttpServletRequest request);

}
