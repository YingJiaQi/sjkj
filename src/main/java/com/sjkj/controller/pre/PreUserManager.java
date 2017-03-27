package com.sjkj.controller.pre;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.pojo.pre.PreUser;
import com.sjkj.service.pre.preUser.PreUserService;
import com.sjkj.utils.MD5Util;

@Controller
@RequestMapping("/preUser")
public class PreUserManager {
	@Autowired
	private PreUserService preUserService;
	/**
	 * 添加前台用户
	 * @param preUser
	 * @return
	 */
	@RequestMapping(value="/addPreUser", method=RequestMethod.POST)
	public ResponseEntity<?> addPreUser(@RequestBody  PreUser preUser){
		return new ResponseEntity<Object>(preUserService.addPreUser(preUser),HttpStatus.OK);
	}
}
