package com.sjkj.controller.pre;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sjkj.service.pre.preStackroom.PreStackroomService;
import com.sjkj.utils.PropsUtil;

@Controller
@RequestMapping("/pre/stackroomManager")
public class PreStackroomManager {
	@Autowired
	private PreStackroomService preStackroomService;
	/**
	 * 页面加载获取书籍信息
	 * @return
	 */
	@RequestMapping(value="/getBooksList" ,method = RequestMethod.POST)
	public ResponseEntity<?> getBooksList(){
		return new ResponseEntity<Object>(preStackroomService.getBooksList(),HttpStatus.OK);
	}
	/**
	 * 转到书籍阅读页面
	 * @param bookUrl
	 * @return
	 */
	@RequestMapping(value="/toBookReadingPage")
	public ModelAndView toPages(String bookUrl){
		ModelAndView mv = new ModelAndView("pre_book_reading");
		//mv.addObject("url","http://47.95.208.48:8080"+bookUrl);
		String url = PropsUtil.get("hostIpAddress")+bookUrl;
		mv.getModel().put("urls", url);
		return mv;
	}
}
