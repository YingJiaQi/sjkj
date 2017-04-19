package com.sjkj.controller.category;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.service.category.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 获取规格参数树结构数据
	 * @return
	 */
	@RequestMapping(value = "/getTreeMenu", method = RequestMethod.POST)
	public ResponseEntity<?> getTreeMenu(){
		return new ResponseEntity<Object>(categoryService.getTreeMenu(), HttpStatus.OK);
	}
	
	/**
	 * 节点操作：增、删、改、查
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/operateNodes", method=RequestMethod.POST)
	public ResponseEntity<?> operateNodes(@RequestBody Map<String, Object> param){
		return new ResponseEntity<Object>(categoryService.operateNodes(param), HttpStatus.OK);
	}
}
