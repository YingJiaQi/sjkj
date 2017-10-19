package com.sjkj.service.back;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.MultiValueMap;

import com.sjkj.vo.PageBean;

public interface BookMaintainService {
	/**
	 * 后台操作书籍数据 增删改查
	 * @return
	 */
	Map<String, Object> operateBook(HttpServletRequest request);
	/**
	 * 获取书籍数据
	 * @return
	 */
	Map<String, Object> getBookList(PageBean pageBean);
	/**
	 * 更新书籍url
	 * @param id
	 * @param path
	 * @param fileType pic/book
	 */
	void updateFile(String id, String path, String fileType);


}
