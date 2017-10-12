package com.sjkj.service.back.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.sjkj.pojo.User;
import com.sjkj.pojo.common.BookDetail;
import com.sjkj.service.back.BookMaintainService;
import com.sjkj.utils.times.DateUtil;

public class BookMaintainServiceImpl implements BookMaintainService {

	@Override
	public Map<String, Object> operateBook(HttpServletRequest param) {
		Map<String, Object> result = new HashMap<String,Object>();
		String oper = param.getParameter("oper");
		BookDetail bd = new BookDetail();
		String id = param.getParameter("id");
		if(StringUtils.equals(oper, "del")){
			bd.setId(id);
			result = deleteBookById(bd);
			return result;
		}
		String bookName = param.getParameter("bookName");
		String bookAuthor = param.getParameter("bookAuthor");
		String belongCategory = param.getParameter("belongCategory");
		String sore = param.getParameter("sore");
		String readTimes = param.getParameter("readTimes");
		String agreeTimes = param.getParameter("agreeTimes");
		String againstTimes = param.getParameter("againstTimes");
		String collectTimes = param.getParameter("collectTimes");
		String buyTimes = param.getParameter("buyTimes");
		String bookSizes = param.getParameter("bookSizes");
		String price = param.getParameter("price");
		String isDone = param.getParameter("isDone");
		String isShare = param.getParameter("isShare");
		String createTime = param.getParameter("createTime");
		try {
			////;;;;;;;;;;;;;;;;;;;;;;;;;;;
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(StringUtils.equals(oper, "edit")){
			bd.setId(id);
			result = updateUser(bd);
		}
		if(StringUtils.equals(oper, "add")){
			result = addUser(bd);
		}
		return result;
	}
	public Map<String, Object> deleteBookById(BookDetail bd) {
		return null;
	}
	public Map<String, Object> updateUser(BookDetail bd) {
		return null;
	}
	public Map<String, Object> addUser(BookDetail bd) {
		return null;
	}

}
