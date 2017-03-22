package com.sjkj.controller.pre;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.service.pre.preCustomPage.PreCustomPageService;


@Controller
@RequestMapping("/pre")
public class PreCustomPage {
	@Autowired
	private PreCustomPageService preCustomPageService;
	/**
	 * 前台转到其它页面
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/{value}")
	public String toPrePages(@PathVariable("value")String param){
		return param;
	}
	/**
	 * 保存前台提交过来的自定义页面
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/saveCustomHtmls", method = RequestMethod.POST)
	public ResponseEntity<?> saveCustomHtmls(@RequestBody Map<String, Object> param){
		return new ResponseEntity<Object>(preCustomPageService.saveCustomHtmls(param),HttpStatus.OK);
	}
}
