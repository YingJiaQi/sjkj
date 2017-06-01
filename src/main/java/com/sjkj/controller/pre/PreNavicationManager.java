package com.sjkj.controller.pre;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sjkj.service.pre.PreNavication.PreNavicationService;

@Controller
@RequestMapping("/pre/navication")
public class PreNavicationManager {
	@Autowired
	private PreNavicationService preNavicationService;
	/**
	 * 动态获取链接图标
	 * @param linkAddr
	 * @return
	 */
	@RequestMapping(value="/dynFindBrand" ,method = RequestMethod.POST)
	public ResponseEntity<?> dynFindBrand(@RequestBody Map<String, Object> linkAddr){
		String addr = linkAddr.get("linkAddr").toString();
		return new ResponseEntity<Object>(preNavicationService.dynFindBrand(addr),HttpStatus.OK);
	}
	/**
	 * 保存链接及图标
	 * @param linkAddr
	 * @return
	 */
	@RequestMapping(value="/saveBrand" ,method = RequestMethod.POST)
	public ResponseEntity<?> saveBrand(@RequestBody Map<String, Object> param){
		return new ResponseEntity<Object>(preNavicationService.saveBrand(param),HttpStatus.OK);
	}
}
