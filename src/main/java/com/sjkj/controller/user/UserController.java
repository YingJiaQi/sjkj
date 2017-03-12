package com.sjkj.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.pojo.SystemComponents;
import com.sjkj.service.user.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value="/loginOut", method = RequestMethod.POST)
	public ResponseEntity<?> loginOut(){
		SecurityUtils.getSubject().logout();
		return new ResponseEntity<Object>("", HttpStatus.OK);
	}
	/**
	 * 修改密码
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/changePwd", method = RequestMethod.POST)
	public ResponseEntity<?> changePwd(@RequestBody Map<String,Object> param){
		return new ResponseEntity<Object>(userService.changePwd(param),HttpStatus.OK);
	}
	/**
	 * 获取当前用户的menu.json
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getMenu", method = RequestMethod.POST)
	public ResponseEntity<?> getMenu(HttpServletRequest request) {
		return new ResponseEntity<List<?>>(userService.getMenu(), HttpStatus.OK);
	}
}
