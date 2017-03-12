package com.sjkj.service.user;

import java.util.List;
import java.util.Map;




import com.sjkj.pojo.SystemComponents;
import com.sjkj.pojo.User;

public interface UserService {
	/**
	 * 根据用户名获取用户
	 * @param username
	 * @return
	 */
	User findUserByUsername(String username);
	/**
	 * 修改密码
	 * @param param
	 * @return
	 */
	Map<String, Object> changePwd(Map<String, Object> param);
	/**
	 * 获取当前用户的menu.json
	 * @param request
	 * @return
	 */
	List<?> getMenu();

}
