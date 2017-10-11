package com.sjkj.controller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.pojo.common.DataDic;
import com.sjkj.service.common.DataDicService;
import com.sjkj.vo.PageBean;
/**
 * 数据字典管理
 * @author YJQ
 *
 */
@Controller
@RequestMapping("/data/dic")
public class DataDicManager {
	@Autowired
	private DataDicService dataDicService;
	/**
	 * 获取数据字典数据
	 * @return
	 */
	@RequestMapping(value = "/getDataDicList", method = RequestMethod.POST)
	public ResponseEntity<?> getDataDicList(PageBean pageBean) {
		return new ResponseEntity<Object>(dataDicService.getDataDicList(pageBean), HttpStatus.OK);
	}
	/**
	 * 添加or更新数据字典数据
	 */
	@RequestMapping(value = "/operateDataDic", method = RequestMethod.POST)
	public ResponseEntity<?> addDataDic(DataDic dataDic) {
		return new ResponseEntity<Object>(dataDicService.operateDataDic(dataDic), HttpStatus.OK);
	}
}
