package com.sjkj.service.back;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BookMaintainService {
	/**
	 * 后台操作书籍数据 增删改查
	 * @return
	 */
	Map<String, Object> operateBook(HttpServletRequest request);


}
