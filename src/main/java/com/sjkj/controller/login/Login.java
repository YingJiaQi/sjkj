package com.sjkj.controller.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.sjkj.service.user.UserService;
import com.sjkj.utils.Base64;

@Controller
@RequestMapping("/login")
public class Login {
	@Autowired
	private UserService userService;
	/**
	 * 转到其它页面
	 * @param param
	 * @return
	 */
	@RequestMapping(value="{value}")
	public String toPages(@PathVariable("value")String param){
		return param;
	}
	/**
	 * 后台管理员登录
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(value="/initUser", method = RequestMethod.POST)
	public ResponseEntity<?> initUser(@RequestBody Map<String,Object> param){
		Map<String,Object> result = new HashMap<String,Object>();
		String username = param.get("username").toString();
		String password = param.get("password").toString();
		BASE64Decoder base64 = new BASE64Decoder();
		try {
			//解密
			username = Base64.getFromBase64(username);
			
			byte[] newPwds = base64.decodeBuffer(password);
			MessageDigest md5s = MessageDigest.getInstance("MD5");
			byte[] digests = md5s.digest(newPwds);
			BASE64Encoder base64ens = new BASE64Encoder();
			//加密后的字符串
			password = base64ens.encode(digests);
		} catch (IOException | NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		try {
			SecurityUtils.getSubject().login(new UsernamePasswordToken(username, password));
			result.put("success", "true");
			result.put("msg", "登录成功");
			return new ResponseEntity<Object>(result,HttpStatus.OK);
		} catch (IncorrectCredentialsException | UnknownAccountException e) {
			//e.printStackTrace();
			result.put("success", "false");
			result.put("msg","用户名或密码错误");
			return new ResponseEntity<Object>(result,HttpStatus.OK);
		}
	}
	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String password = 123456+"";
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		//加密后的字符串
		password = base64en.encode(md5.digest(password.getBytes("utf-8")));
		System.out.println(password);
		System.out.println(UUID.randomUUID().toString().replaceAll("-", ""));
	}
}
