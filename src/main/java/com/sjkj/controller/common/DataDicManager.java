package com.sjkj.controller.common;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.bussinessUtils.DataDicUtils;
import com.sjkj.pojo.common.DataDic;
import com.sjkj.service.common.DataDicService;
import com.sjkj.vo.PageBean;
import com.sjkj.vo.ProjectConstant;
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
	/**
	 * @DESC  根据   字典类型编码   查找所有的字典码及数据 JSONObject(BelongCode,BelongName)
	 * @author YJQ
	 * @return
	 */
	@RequestMapping(value = "/getMapByDocCode")
	public ResponseEntity<?> getMapByDocCode() {
		return new ResponseEntity<Object>(DataDicUtils.getMapByDocCode(ProjectConstant.DATA_DOC_BOOK_CODE), HttpStatus.OK);
	}
	/**
	 * 根据字典类型编码 获取该类型节点的所有父字典码  如果此时添加的是父节点 则此选项不选就好 
	 */
	@RequestMapping(value = "/getParentBelongCodeBydocCode")
	public ResponseEntity<?> getParentBelongCodeBydocCode(String docCode) {
		return new ResponseEntity<Object>(DataDicUtils.getParentBelongCodeBydocCode(docCode), HttpStatus.OK);
	}
}
