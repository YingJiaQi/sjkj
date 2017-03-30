package com.sjkj.service.pre.preUser;

import java.util.Map;


import com.sjkj.pojo.pre.PreUser;

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

}
