package com.sjkj.controller.pre;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.pojo.pre.PreUser;
import com.sjkj.pojo.pre.PreUserBrandCategory;
import com.sjkj.service.pre.preUser.PreUserService;
import com.sjkj.utils.MD5Util;
import com.sjkj.vo.PageBean;

@Controller
@RequestMapping("/pre")
public class PreUserManager {
	@Autowired
	private PreUserService preUserService;
	/**
	 * 前台转到其它页面
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/user/{value}")
	public String toPages(@PathVariable("value")String param){
		return param;
	}
	/**
	 * 添加前台用户
	 * @param preUser
	 * @return
	 */
	@RequestMapping(value="/addPreUser", method=RequestMethod.POST)
	public ResponseEntity<?> addPreUser(@RequestBody  PreUser preUser){
		return new ResponseEntity<Object>(preUserService.addPreUser(preUser),HttpStatus.OK);
	}
	/**
	 * 前台用户登录
	 * @param preUser
	 * @return
	 */
	@RequestMapping(value="/preUserLogin", method=RequestMethod.POST)
	public ResponseEntity<?> preUserLogin(@RequestBody  PreUser preUser){
		return new ResponseEntity<Object>(preUserService.preUserLogin(preUser),HttpStatus.OK);
	}
	/**
	 * 获取前台用户数据
	 * @return
	 */
	@RequestMapping(value = "/getUserList", method = RequestMethod.POST)
	public ResponseEntity<?> getUserList(PageBean pageBean) {
		return new ResponseEntity<Object>(preUserService.getUserList(pageBean), HttpStatus.OK);
	}
	/**
	 * 操作用户数据
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/operatePreUser", method = RequestMethod.POST)
	public ResponseEntity<?> operatePreUser(HttpServletRequest request) {
		return new ResponseEntity<Object>(preUserService.operatePreUser(request), HttpStatus.OK);
	}
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value="/loginOut")
	public String loginOut(){
		SecurityUtils.getSubject().logout();
		return "redirect:/";//退出，重定向到前台首页
	}
	/**
	 * 获取该用户收藏的所有网址
	 */
	@RequestMapping(value="/getCollectionWebsite")
	public ResponseEntity<?> getCollectionWebsite(){
		return new ResponseEntity<Object>(preUserService.getCollectionWebsite(),HttpStatus.OK);
	}
	/**
	 * 添加收藏分类
	 */
	@RequestMapping(value="/user/addUrlCategory", method = RequestMethod.POST)
	public ResponseEntity<?> addUrlCategory(@RequestBody PreUserBrandCategory pubc){
		return new ResponseEntity<Object>(preUserService.addUrlCategory(pubc),HttpStatus.OK);
	}
	/**
	 * 更新收藏分类
	 */
	@RequestMapping(value="/user/updateUrlCategory", method = RequestMethod.POST)
	public ResponseEntity<?> updateUrlCategory(@RequestBody PreUserBrandCategory pubc,String cmd){
		return new ResponseEntity<Object>(preUserService.updateUrlCategory(pubc,cmd),HttpStatus.OK);
	}
	/**
	 * 获取前台登录用户信息
	 */
	@RequestMapping(value="/user/getUserInfo", method = RequestMethod.POST)
	public ResponseEntity<?> getUserInfo(){
		return new ResponseEntity<Object>(preUserService.getUserInfo(),HttpStatus.OK);
	}
}
