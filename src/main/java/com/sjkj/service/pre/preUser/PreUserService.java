package com.sjkj.service.pre.preUser;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.MultiValueMap;

import com.sjkj.pojo.pre.PreUser;
import com.sjkj.pojo.pre.PreUserBrandCategory;
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
	/**
	 * 获取该用户收藏的所有网址
	 */
	Map<String, Object> getCollectionWebsite();
	/**
	 * 添加收藏分类
	 */
	Map<String, Object> addUrlCategory(PreUserBrandCategory pubc);
	/**
	 * 更新收藏分类
	 */
	Map<String, Object> updateUrlCategory(PreUserBrandCategory pubc);
	/**
	 * 获取前台登录用户信息
	 */
	Map<String, Object> getUserInfo();

}
