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

import com.sjkj.pojo.User;
import com.sjkj.service.user.UserService;
import com.sjkj.vo.PageBean;

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
	/**
	 * 获取所有用户
	 * @param pageBean
	 * @return
	 */
	@RequestMapping(value = "/getUserList", method = RequestMethod.POST)
	public ResponseEntity<?> getUserList(PageBean pageBean) {
		return new ResponseEntity<Object>(userService.getUserList(pageBean), HttpStatus.OK);
	}
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public ResponseEntity<?> updateUser(@RequestBody User user) {
		return new ResponseEntity<Object>(userService.updateUser(user), HttpStatus.OK);
	}
	/**
	 * 删除用户信息
	 * @param userID
	 * @return
	 */
	@RequestMapping(value = "/deleteUserById", method = RequestMethod.POST)
	public ResponseEntity<?> deleteUserById(@RequestBody User user) {
		return new ResponseEntity<Object>(userService.deleteUserById(user), HttpStatus.OK);
	}
	/**
	 * 添加用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ResponseEntity<?> addUser(@RequestBody User user) {
		return new ResponseEntity<Object>(userService.addUser(user), HttpStatus.OK);
	}
	/**
	 * 操作用户数据
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/operateUser", method = RequestMethod.POST)
	public ResponseEntity<?> operateUser(HttpServletRequest request) {
		return new ResponseEntity<Object>(userService.operateUser(request), HttpStatus.OK);
	}
	
}
