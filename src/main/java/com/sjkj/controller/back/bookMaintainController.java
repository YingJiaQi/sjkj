package com.sjkj.controller.back;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.service.back.BookMaintainService;
import com.sjkj.vo.PageBean;

@Controller
@RequestMapping(value="/back/bookMaintain")
public class bookMaintainController {
	@Autowired
	private BookMaintainService bookMaintainService;
	/**
	 * 获取书籍数据
	 * @return
	 */
	@RequestMapping(value = "/getBookList", method = RequestMethod.POST)
	public ResponseEntity<?> getBookList(PageBean pageBean) {
		return new ResponseEntity<Object>(bookMaintainService.getBookList(pageBean), HttpStatus.OK);
	}
	/**
	 * 操作书籍数据
	 * @return
	 */
	@RequestMapping(value = "/operateBook", method = RequestMethod.POST)
	public ResponseEntity<?> operateBook(HttpServletRequest request) {
		return new ResponseEntity<Object>(bookMaintainService.operateBook(request), HttpStatus.OK);
	}
	
}
